package com.petshop.model;

public class Cart extends Product {
	
	private int quantity;

	public Cart() {

	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Cart [quantity=" + quantity + ", getQuantity()=" + getQuantity() + ", getId()=" + getId()
				+ ", getName()=" + getName() + ", getDetails()=" + getDetails() + ", getPrice()=" + getPrice()
				+ ", getImage()=" + getImage() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
