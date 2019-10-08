package com.cn.lhb.utils;

import java.util.Random;

public class CodeUtils {
	public static int getCode() {
		Random random = new Random();
		return (random.nextInt(9999-1000)+999);
	}
}
