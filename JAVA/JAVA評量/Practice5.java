package com.cathaybk.practice.nt50357.b;

import java.time.LocalDate;
import java.util.Scanner;

public class Practice5 {

	private static int m;

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int year = 2024;
		System.out.print("             輸入介於1-12之內的整數m:");
		m = sc.nextInt();
		if (m < 1 || m > 12) {
			System.out.print("請輸入介於1-12之內的整數");
			return;
		}

		LocalDate dayMonthyear = LocalDate.of(year, m, 1);

		printdayMonthyear(dayMonthyear);
		sc.close();

	}

	private static void printdayMonthyear(LocalDate date) {

		int month = date.getMonthValue();
		int year = date.getYear();
		System.out.printf("                   %d年%d月\n", year, month);
		System.out.println("--------------------------------------------------");
		System.out.printf("日\t一\t二\t三\t四\t五\t六\n");
		System.out.println("==================================================");

		int value = date.getDayOfWeek().getValue() % 7;
		int dayInmonth = date.lengthOfMonth();
		for (int i = 0; i < value; i++) {
			System.out.print("\t");
		}
		for (int day = 1; day <= dayInmonth; day++) {
			System.out.print(day + "\t");
			if ((day + value) % 7 == 0) {
				System.out.println();

			}

		}

	}
}
