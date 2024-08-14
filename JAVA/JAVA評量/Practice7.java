package com.cathaybk.practice.nt50357.b;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class Practice7 {

	private static final String INSERT_CARS_SQL = "insert into STUDENT.CARS (MANUFACTURER, TYPE, MIN_PRICE, PRICE) values (?, ?, ?, ?)";
	private static final String SELECT_CARS_SQL = "select * from  STUDENT.CARS";
	private static final String QUERY_CARS_SQL = "select * from  STUDENT.CARS where MANUFACTURER = ? and TYPE = ?";
	private static final String DELETE_CAR_SQL = "delete from  STUDENT.CARS  where MANUFACTURER = ? and TYPE = ? ";
	private static final String UPDATE_CAR_SQL = "update STUDENT.CARS set MIN_PRICE = ?, PRICE = ? where MANUFACTURER = ? and TYPE = ? ";
	private static final String CONN_URL = "jdbc:oracle:thin:@//localhost:1521/XE";
	private static final String USER_NAME = "student";
	private static final String PASSWORD = "student123456";

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		try (Connection conn = DriverManager.getConnection(CONN_URL, USER_NAME, PASSWORD)) {
			readAllCars(conn);
			
			while (true) {
				System.out.println("請選擇以下指令輸入select 、 insert 、 update 、 delete");

				Scanner sc = new Scanner(System.in);

				String command = sc.nextLine();

				switch (command) {
				case "select":
					System.out.println("請輸入製造商:");
					String manufacturer = sc.nextLine();
					System.out.println("請輸入類型:");
					String type = sc.nextLine();
					if (iscarExist(conn, manufacturer, type)) {
						qeueryCars(conn, manufacturer, type);
					} else {
						System.out.println("輸入錯誤");
						continue;
					}
					break;
				case "insert":
					Map<String, Object> insertData = readCarData(sc);
					if (!iscarExist(conn, (String) insertData.get("MANUFACTURER"), (String) insertData.get("TYPE"))) {
						InsertCars(conn, insertData);

					} else {
						System.out.println("資料已存在");
						continue;
					}

					break;
				case "update":
					Map<String, Object> updateData = readCarData(sc);
					if (iscarExist(conn, (String) updateData.get("MANUFACTURER"), (String) updateData.get("TYPE"))) {
						updateCars(conn, updateData);

					} else {
						System.out.println("資料錯誤");
						continue;
					}

					break;
				case "delete":
					System.out.println("請輸入製造商:");
					String delManufacturer = sc.nextLine();
					System.out.println("請輸入類型:");
					String delType = sc.nextLine();
					if (iscarExist(conn, delManufacturer, delType)) {
						deleteCars(conn, delManufacturer, delType);

					} else {
						System.out.println("資料不存在");
						continue;
					}
					break;
				case "exit":
					return;
				default:
					System.out.println("無效指令");
					continue;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static boolean iscarExist(Connection conn, String manufacturer, String type) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(QUERY_CARS_SQL)) {
			pstmt.setString(1, manufacturer);
			pstmt.setString(2, type);
			try (ResultSet rs = pstmt.executeQuery()) {
				return rs.next();
			}
		}
	}

	private static void readAllCars(Connection conn) throws SQLException {
		List<Map<String, Object>> carList = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(SELECT_CARS_SQL); ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				Map<String, Object> carData = new LinkedHashMap<>();
				carData.put("MANUFACTURER", rs.getString("MANUFACTURER"));
				carData.put("TYPE", rs.getString("TYPE"));
				carData.put("MIN_PRICE", rs.getBigDecimal("MIN_PRICE"));
				carData.put("PRICE", rs.getBigDecimal("PRICE"));
				carList.add(carData);
			}
		}

		for (Map<String, Object> car : carList) {
			System.out.println(car);
		}
	}

	private static void qeueryCars(Connection conn, String manufacturer, String type) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(QUERY_CARS_SQL)) {

			pstmt.setString(1, manufacturer);
			pstmt.setString(2, type);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					System.out.println("Manufacturer: " + rs.getString("MANUFACTURER"));
					System.out.println("Type: " + rs.getString("TYPE"));
					System.out.println("Min_Price: " + rs.getBigDecimal("MIN_PRICE"));
					System.out.println("Price: " + rs.getBigDecimal("PRICE"));
					System.out.println();
				}
			}
		}
	}

	private static void InsertCars(Connection conn, Map<String, Object> carData) throws SQLException {

		try (PreparedStatement pstmt = conn.prepareStatement(INSERT_CARS_SQL)) {
			conn.setAutoCommit(false);
			pstmt.setString(1, (String) carData.get("MANUFACTURER"));
			pstmt.setString(2, (String) carData.get("TYPE"));
			pstmt.setBigDecimal(3, (BigDecimal) carData.get("MIN_PRICE"));
			pstmt.setBigDecimal(4, (BigDecimal) carData.get("PRICE"));

			if (pstmt.executeUpdate() > 0) {
				conn.commit();
				System.out.println("新增成功");
			} else {
				conn.rollback();
				System.out.println("新增失敗");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void updateCars(Connection conn, Map<String, Object> carData) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(UPDATE_CAR_SQL);) {
			conn.setAutoCommit(false);
			pstmt.setBigDecimal(1, (BigDecimal) carData.get("MIN_PRICE"));
			pstmt.setBigDecimal(2, (BigDecimal) carData.get("PRICE"));
			pstmt.setString(3, (String) carData.get("MANUFACTURER"));
			pstmt.setString(4, (String) carData.get("TYPE"));

			if (pstmt.executeUpdate() > 0) {
				conn.commit();
				System.out.println("更新成功");
			} else {
				conn.rollback();
				System.out.println("更新失敗");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	private static void deleteCars(Connection conn, String delManufacturer, String delType) throws SQLException {

		try (PreparedStatement pstmt = conn.prepareStatement(DELETE_CAR_SQL);) {
			conn.setAutoCommit(false);
			pstmt.setString(1, delManufacturer);
			pstmt.setString(2, delType);

			if (pstmt.executeUpdate() > 0) {
				conn.commit();
				System.out.println("刪除成功");
			} else {
				conn.rollback();
				System.out.println("刪除失敗");
			}
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
