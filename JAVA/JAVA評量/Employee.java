package com.cathaybk.practice.nt50357.b;

public class Employee implements IWork {

	private String name;
	private String department;
	private int salary;

	public Employee(String name, String department, int salary) {
		this.name = name;
		this.department = department;
		this.salary = salary;

	}

	@Override
	public void printInfo() {
		StringBuilder sb = new StringBuilder();
		sb.append("薪資單\n").append( "姓名: "+name).append(" ").append("工作部門: " + department)
		.append("\n").append("月薪: " + salary);
		System.out.println(sb.toString());
	}//stringbuilder

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

}
