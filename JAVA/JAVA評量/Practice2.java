package com.cathaybk.practice.nt50357.b;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class Practice2 {

	public static void main(String[] args) {

		int len = 6;
		List<Integer> resultList = new ArrayList<>(len);
		Random rand = new Random();

		while (resultList.size() < len) {
			int num = rand.nextInt(49) + 1;
			if (!resultList.contains(num)) {
				resultList.add(num);
			}
		}
		System.out.println("排序前: ");
		printList(resultList);

		Collections.sort(resultList);
		System.out.println("排序後: ");
		printList(resultList);
	}

	private static void printList(List<Integer> resultList) {

		for (int i = 0; i < resultList.size(); i++) {
			System.out.print(resultList.get(i));
			if (i < resultList.size() - 1) {
				System.out.print(" ");
			}
		}
		System.out.println();
	}

}
