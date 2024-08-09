package com.cathaybk.practice.nt50357.b;

public class Sales extends Employee {

	private int bonus;
	private int payment;

	public Sales(String name, String department, int salary, int bonus1) {
		super(name, department, salary);
		this.bonus = (int) (bonus1 * 0.05);
		this.payment = salary + bonus;
	}

	public void printInfo() {
		super.printInfo();
		System.out.println("業績獎金:"+""+bonus);
		System.out.println("總計:"+""+payment);
	}

	public double getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

	public double getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

}
