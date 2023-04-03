package mx.abrahamNtd.poc.rest;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.*;
import static org.junit.Assert.*;

public class MathServiceTest {
    private MathService math = new MathService();

    @Test
    public void factorial() {
        assertTrue(math.factorial(0) == 1);
        assertTrue(math.factorial(1) == 1);
        assertTrue(math.factorial(5) == 120);
    }

    @Test
    public void factorialNegative() {
        assertThrows(IllegalArgumentException.class, () -> {
            math.factorial(-1);
        });
    }

    @Test
    public void todo() {
        assertTrue(math.plus(1, 1) == 2);
    }
}