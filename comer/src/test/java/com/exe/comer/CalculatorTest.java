package com.exe.comer;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.exe.dao.Calculator;

public class CalculatorTest {

	@Test
	public void testSum() {
		Calculator c = new Calculator();
		double result = c.sum(10, 50);
		assertEquals(60, result,0); //(기대값 , 결과값)
		
	}
}
