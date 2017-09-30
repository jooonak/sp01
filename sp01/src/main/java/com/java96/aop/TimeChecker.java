package com.java96.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component
@Aspect
@Log
public class TimeChecker {

//	@Before("execution(* com.java96.service.*.*(..))")
	public void sample1(JoinPoint jp) {
		log.info("---------------------------------------------");
		log.info("============================================="+Arrays.toString(jp.getArgs()));
		log.info("---------------------------------------------");
	}
	
//	@Around("execution(* com.java96.service.*.*(..))")
	public Object sampleAround(ProceedingJoinPoint jp) throws Throwable {

		Long start = System.currentTimeMillis();
		
		String methodName = jp.getSignature().getName();
		
		//Method.invoke(); -> 메소드 실제 실행한다 (리플렉션)
		Object result = jp.proceed();
		
		Long end = System.currentTimeMillis();
		
		log.info(methodName);
		log.info("" + (end - start));
		
		return result;
	}
}
