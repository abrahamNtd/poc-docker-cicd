package mx.abrahamNtd.poc.rest;

public class MathService {

    public long factorial(int number) {
        long result = 1;

        if (number < 0)
            throw new IllegalArgumentException();

        if (number > 1)
            for (int i = 1; i <= number; i++)
                result = result * i;

        return result;
    }

    public long plus(int num1, int num2) {
        return num1 + num2;
    }
}