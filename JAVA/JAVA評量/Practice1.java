package com.cathaybk.practice.nt50357.b;

public class Practice1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		for (int i = 1; i <= 9; i++) {
			for (int j = 2; j <= 9; j++) {
				int r = i * j;
				System.out.printf("%d*%d=%2d", j, i, r);	
			}
			System.out.println();
		}
	}
}
