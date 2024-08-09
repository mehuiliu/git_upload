package com.cathaybk.practice.nt50357.b;

public class Employee implements IWork{

	private String name;
	private String department;
	private int salary;
	
	public Employee() {}
		
		public Employee(String name, String department, int salary ) {
			this.name = name;
			this.department = department;
			this.salary = salary;
			
		}
	
	
	@Override
	public void printInfo() {
		// TODO Auto-generated method stub
		System.out.println("薪資單\n"+"姓名:" + name +" "+"工作部門:" + department +"\n"+ "月薪:" + ""+salary);
	}

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
