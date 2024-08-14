package com.cathaybk.practice.nt50357.b;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class Practice2 {

	public static void main(String[] args) {

		List<Integer> resultList = new ArrayList<>();
		Random rand = new Random();

		while (resultList.size() < 6) {
			int num = rand.nextInt(49) + 1;
			if (!resultList.contains(num)) {
				resultList.add(num);
			}
		}
		System.out.println("排序前: ");
		printList(resultList);

		Collections.sort(resultList);
		System.out.println("\n" + "排序後:");
		printList(resultList);
	}

	private static void printList(List<Integer> resultList) {
		for (Integer result : resultList) {
			System.out.print(result + " ");
		}
	}
}
