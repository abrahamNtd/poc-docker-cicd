package mx.abrahamNtd.poc.provider.service;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.*;
import static org.junit.Assert.*;

import mx.abrahamNtd.poc.provider.service.MathService;

public class MathServiceTest {

    private MathService mathService = new MathService();

    @Test
    public void factorial() {
        assertTrue(mathService.factorial(0) == 1);
        assertTrue(mathService.factorial(1) == 1);
        assertTrue(mathService.factorial(5) == 120);
    }

    @Test
    public void factorialNegative() {
        assertThrows(IllegalArgumentException.class, () -> {
            mathService.factorial(-1);
        });
    }

    @Test
    public void todo() {
        assertTrue(mathService.plus(1, 1) == 2);
    }
}