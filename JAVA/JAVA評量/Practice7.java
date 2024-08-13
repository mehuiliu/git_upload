package com.cathaybk.practice.nt50357.b;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Practice7 {

	public static final String INSERT_CARS_SQL = "insert into STUDENT.CARS (MANUFACTURER, TYPE, MIN_PRICE, PRICE) values (?, ?, ?, ?)";
	public static final String QUERY_CARS_SQL = "select * from  STUDENT.CARS where MANUFACTURER = ? and TYPE = ?";
	public static final String DELETE_CAR_SQL = "delete from  STUDENT.CARS  where MANUFACTURER = ? and TYPE = ? ";
	public static final String UPDATE_CAR_SQL = "update STUDENT.CARS set MIN_PRICE = ?, PRICE = ? where MANUFACTURER = ? and TYPE = ? ";
	public static final String CONN_URL = "jdbc:oracle:thin:@//localhost:1521/XE";
	public static final String USER_NAME = "student";
	public static final String PASSWORD = "student123456";

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.println("請選擇以下指令輸入select 、 insert 、 update 、 delete");
		String command = sc.nextLine();

		switch (command) {
		case "select":
			System.out.println("請輸入製造商:");
			String manufacturer = sc.nextLine();
			System.out.println("請輸入類型:");
			String type = sc.nextLine();
			qeueryCars(manufacturer, type);
			break;
		case "insert":
			Map<String, Object> insertData = readCarData(sc);
			InsertCars(insertData);
			break;
		case "update":
			Map<String, Object> updateData = readCarData(sc);
			updateCars(updateData);
			break;
		case "delete":
			System.out.println("請輸入製造商:");
			String delManufacturer = sc.nextLine();
			System.out.println("請輸入類型:");
			String delType = sc.nextLine();
			deleteCars(delManufacturer, delType);
			break;

		default:
			System.out.println("無效的指令");
		}
		sc.close();
	}

	private static void qeueryCars(String manufacturer, String type) {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			PreparedStatement pstmt = conn.prepareStatement(QUERY_CARS_SQL);

			pstmt.setString(1, manufacturer);
			pstmt.setString(2, type);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("Manufacturer: " + rs.getString("MANUFACTURER"));
				System.out.println("Type: " + rs.getString("TYPE"));
				System.out.println("Min_Price: " + rs.getBigDecimal("MIN_PRICE"));
				System.out.println("Price: " + rs.getBigDecimal("PRICE"));
				System.out.println();

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	private static void InsertCars(Map<String, Object> carData) {

		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			PreparedStatement pstmt = conn.prepareStatement(INSERT_CARS_SQL);

			pstmt.setString(1, (String) carData.get("MANUFACTURER"));
			pstmt.setString(2, (String) carData.get("TYPE"));
			pstmt.setBigDecimal(3, (BigDecimal) carData.get("MIN_PRICE"));
			pstmt.setBigDecimal(4, (BigDecimal) carData.get("PRICE"));

			int rowAffected0 = pstmt.executeUpdate();
			System.out.println(rowAffected0 > 0 ? "新增成功" : "新增失敗");

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	private static void updateCars(Map<String, Object> carData) {
		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			PreparedStatement pstmt = conn.prepareStatement(UPDATE_CAR_SQL);

			pstmt.setBigDecimal(1, (BigDecimal) carData.get("MIN_PRICE"));
			pstmt.setBigDecimal(2, (BigDecimal) carData.get("PRICE"));
			pstmt.setString(3, (String) carData.get("MANUFACTURER"));
			pstmt.setString(4, (String) carData.get("TYPE"));

			int rowAffected0 = pstmt.executeUpdate();
			System.out.println(rowAffected0 > 0 ? "更新成功" : "更新失敗");

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	private static void deleteCars(String delManufacturer, String delType) {

		try (Connection conn = DriverManager.getConnection(CONN_URL, "student", "student123456");) {
			PreparedStatement pstmt = conn.prepareStatement(DELETE_CAR_SQL);

			pstmt.setString(1, delManufacturer);
			pstmt.setString(2, delType);
			try (ResultSet rs = pstmt.executeQuery()) {
			}

			int rowAffected = pstmt.executeUpdate();
			System.out.println(rowAffected > 0 ? "刪除失敗" : "刪除成功");

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	private static Map<String, Object> readCarData(Scanner sc) {
		Map<String, Object> carData = new HashMap<>();
		System.out.print("請輸入製造商: ");
		carData.put("MANUFACTURER", sc.nextLine());
		System.out.print("請輸入類型: ");
		carData.put("TYPE", sc.nextLine());
		System.out.print("請輸入底價: ");
		carData.put("MIN_PRICE", new java.math.BigDecimal(sc.nextLine()));
		System.out.print("請輸入售價: ");
		carData.put("PRICE", new java.math.BigDecimal(sc.nextLine()));
		return carData;
	}

}
