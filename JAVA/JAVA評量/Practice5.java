package com.cathaybk.practice.nt50357.b;

import java.time.LocalDate;

import java.util.Scanner;

public class Practice5 {

	public static void main(String[] args) {
		try (Scanner sc = new Scanner(System.in)) {

			int year = LocalDate.now().getYear();
			System.out.print("   輸入介於1-12之內的整數m:");
			String input = sc.next();
			if (!input.matches("^(1[0-2]|[1-9])$")) {
				System.out.print("請輸入介於1-12之內的整數");
				return;
			}
			int m = Integer.parseInt(input);
			LocalDate dayMonthyear = LocalDate.of(year, m, 1);
			printdayMonthyear(dayMonthyear);
		}
	}

	private static void printdayMonthyear(LocalDate date) {

		int month = date.getMonthValue();
		int year = date.getYear();
		System.out.printf("        %-4d年%2d月\n", year, month);
		System.out.println("-----------------------");
		StringBuilder sbn = new StringBuilder();
		sbn.append(String.format("%-2s ", "日")).append(String.format("%-2s ", "一")).append(String.format("%-2s ", "二"))
				.append(String.format("%-2s ", "三")).append(String.format("%-2s ", "四"))
				.append(String.format("%-2s ", "五")).append(String.format("%-2s ", "六"));
		System.out.println(sbn.toString());
		System.out.println("=======================");

		int value = date.getDayOfWeek().getValue() % 7;
		for (int i = 0; i < value; i++) {
			System.out.print("   ");
		}
		for (int j = 1; j <= date.lengthOfMonth(); j++) {
			System.out.printf("%3d", j);
			if ((j + value) % 7 == 0) {
				System.out.println();

			}

		}

	}
}
