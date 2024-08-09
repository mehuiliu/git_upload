package com.cathaybk.practice.nt50357.b;

public class Supervisor extends Employee {

	
private int payment;
	
	public Supervisor(String name, String department, int salary) {
		super(name,department,salary);
		this.payment=salary;
		
	}
	
	public double getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public void printInfo() {
		super.printInfo();
		System.out.println("總計:"+""+payment);
		
		}

}
