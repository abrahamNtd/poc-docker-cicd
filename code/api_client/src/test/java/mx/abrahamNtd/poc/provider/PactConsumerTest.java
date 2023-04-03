package mx.abrahamNtd.poc.rest;

public class PactConsumerTest {

    @Test
    public void getAllUsersPact() {
        String expectedUsers = """
                [
                    {
                        "id": 1, 
                        "name": "Jane Doe"
                    },
                    {
                        "id": 2, 
                        "name": "John Doe"
                    }
                ]
                """;

        RequestResponsePact pact = ConsumerPactBuilder
                .consumer("UserConsumer")
                .hasPactWith("UserService")
                .uponReceiving("A request for a user list")
                .path("/users")
                .method("GET")
                .willRespondWith()
                .status(200)
                .headers(Map.of("Content-Type", "application/json"))
                .body(expectedUsers)
                .toPact();

        MockProviderConfig config = MockProviderConfig.createDefault();
        PactVerificationResult result = runConsumerTest(pact, config, PactConsumerTest::getAllUsers);

        if (result instanceof PactVerificationResult.Error) {
            throw new RuntimeException(((PactVerificationResult.Error) result).getError());
        }

        assertEquals(new PactVerificationResult.Ok(
                Arrays.asList(
                        new User(1, "Jane Doe"),
                        new User(2, "John Doe")
                )), result);
    }

    private static List<User> getAllUsers(MockServer mockServer, PactTestExecutionContext context) {
        RestTemplate restTemplate = new RestTemplateBuilder().rootUri(mockServer.getUrl()).build();
        User[] resultingUsers = restTemplate.getForObject("/users", User[].class);
        if (resultingUsers != null) {
            return Arrays.stream(resultingUsers).toList();
        } else {
            return Collections.emptyList();
        }
    }

}