package com.cathaybk.practice.nt50357.b;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

public class HRMain {

	public static void main(String[] args) {

		List<Employee> employeeList = new ArrayList<>();
		employeeList.add(new Sales("張志誠", "信用卡部", 35000, 6000));
		employeeList.add(new Sales("林大鈞", "保代部", 38000, 4000));
		employeeList.add(new Supervisor("李中白", "資訊部", 65000));
		employeeList.add(new Supervisor("林小中", "理財部", 80000));
		for (Employee employee : employeeList) {

			employee.printInfo();
		}
		BufferedWriter writer = null;

		try {
			writer = new BufferedWriter(new FileWriter("C:\\Users\\Admin\\Desktop\\output.csv"));

			for (Employee employee : employeeList) {

				String name = employee.getName();
				int payment;
				if (employee instanceof Sales) {
					payment = (int) ((Sales) employee).getPayment();
				} else {
					payment = (int) employee.getSalary();
				}
				writer.write(name + "," + payment);
				writer.newLine();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (writer != null)
					writer.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}