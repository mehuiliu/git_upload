package com.cathaybk.practice.nt50357.b;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Practice6 {

	public static void main(String[] args) {

		List<Map<String, String>> dataList = new ArrayList<>();
		String inputFile = "C:\\Users\\Admin\\Desktop\\cars.csv";

		try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
			String line = reader.readLine();
			String[] headers = line.split(",");

			while (line != null) {
				String[] values = line.split(",");

				Map<String, String> data = new HashMap<>();
				for (int i = 0; i < headers.length; i++) {
					data.put(headers[i].trim(), values[i].trim());
				}
				dataList.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		Collections.sort(dataList, new Comparator<Map<String, String>>() {
			@Override
			public int compare(Map<String, String> o1, Map<String, String> o2) {
				BigDecimal price1 = new BigDecimal(o1.get("Price"));
				BigDecimal price2 = new BigDecimal(o2.get("Price"));
				return price2.compareTo(price1);
			}
		});

		try (BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\Admin\\Desktop\\cars2.csv"))) {

			StringBuilder sb = new StringBuilder();
			sb.append("Manufacturer,Type,Min.Price,Price\n");
			for (Map<String, String> data : dataList) {
				sb.append(data.get("Manufacturer")).append(",").append(data.get("Type")).append(",")
						.append(data.get("Min.Price")).append(",").append(data.get("Price")).append("\n");
			}
			writer.write(sb.toString());
		}

		catch (Exception e) {
			e.printStackTrace();

		}

		Map<String, List<Map<String, String>>> groupData = new HashMap<>();
		BigDecimal totalMinPrice = BigDecimal.ZERO; // 總計最低價
		BigDecimal totalPrice = BigDecimal.ZERO; // 總計價格

		for (Map<String, String> data : dataList) {
			String manufacturer = data.get("Manufacturer");
			groupData.putIfAbsent(manufacturer, new ArrayList<>());
			groupData.get(manufacturer).add(data);
		}
		StringBuilder sb0 = new StringBuilder();
		sb0.append(String.format("%-15s", "Manufacturer")).append(String.format(" %-10s", "Type"))
				.append(String.format(" %-10s", "Min.Price")).append(String.format(" %-10s", "Price"));
		System.out.println(sb0.toString());
		sb0.setLength(0);

		for (Map.Entry<String, List<Map<String, String>>> entry : groupData.entrySet()) {
			entry.getKey();
			List<Map<String, String>> manufacturerData = entry.getValue();

			BigDecimal subtotalMinPrice = BigDecimal.ZERO;
			BigDecimal subtotalPrice = BigDecimal.ZERO;

			for (Map<String, String> data : manufacturerData) {
				BigDecimal minPrice = new BigDecimal(data.get("Min.Price"));
				BigDecimal price = new BigDecimal(data.get("Price"));

//				StringBuilder sb1 = new StringBuilder();
				sb0.append(String.format("%-15s", data.get("Manufacturer")))
						.append(String.format(" %-11s", data.get("Type"))).append(String.format("%-10.1f", minPrice))
						.append(String.format("%-10.1f", price));
				System.out.println(sb0.toString());
				sb0.setLength(0);
				subtotalMinPrice = subtotalMinPrice.add(minPrice);
				subtotalPrice = subtotalPrice.add(price);
			}
//			StringBuilder sbSubTotal = new StringBuilder();
			sb0.append(String.format("%-14s", "小計\t\t")).append(String.format("%-10.1f", subtotalMinPrice))
					.append(String.format(" %-10.1f", subtotalPrice));

			System.out.println(sb0.toString());
			sb0.setLength(0);
			totalMinPrice = totalMinPrice.add(subtotalMinPrice);
			totalPrice = totalPrice.add(subtotalPrice);
		}
//		StringBuilder sbTotal = new StringBuilder();
		sb0.append(String.format("%-14s", "合計\t\t")).append(String.format("%10.1f", totalMinPrice))
				.append(String.format(" %10.1f", totalPrice));
		System.out.println(sb0.toString());

	}
}
