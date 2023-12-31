package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.json.JSONObject;

@Getter @Setter
@ToString
public class Snack {
	private Long snackId;
    private String name;
    private int price;    
    private String category;
	private String brand;
    private int quantity;
    private String imgUrl;

	private String link;
    
    public Snack() {
    	
    }
	public Snack(Long id, String name, int price, int quantity) {
		this.snackId = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	public Snack(String name, int price, String brand, String category, int quantity, String imgUrl, String link) {
		super();
		this.name = name;
		this.price = price;
		this.brand = brand;
		this.category = category;
		this.quantity = quantity;
		this.imgUrl = imgUrl;
		this.link = link;
	}
	public Snack(Long snackId, String name, int price, String category, int quantity, String imgUrl) {
		super();
		this.snackId = snackId;
		this.name = name;
		this.price = price;
		this.category = category;
		this.quantity = quantity;
		this.imgUrl = imgUrl;
	}

	private static String parseName(String name) {
		String[] token = name.split(" ");
		StringBuilder ret = new StringBuilder();
		for (String tok : token) {
			if (tok.isEmpty() || tok.charAt(tok.length() - 1) == 'g' || tok.charAt(tok.length() - 1) == 'G') continue;
			if (tok.contains("농심") || tok.contains("오리온") || tok.contains("해태") || tok.contains("삼양")
		|| tok.contains("롯데") || tok.contains("노브랜드") || tok.contains("크라운")) continue;
			if (tok.contains("중국") || tok.contains("미국") || tok.contains("서울")) continue;
			if (tok.contains("[") || tok.contains("]")) continue;
			ret.append(tok).append(" ");
		}
		return ret.toString().trim();
	}

	public Snack(JSONObject item, String category, int quantity) {
		this.snackId = Long.parseLong(item.getString("productId"));
		this.name = parseName(item.getString("title"));
		this.price = Integer.parseInt(item.getString("lprice"));
		this.brand = item.getString("brand");
		this.imgUrl = item.getString("image");
		this.link = item.getString("link");
		this.category = category;
		this.quantity = quantity;
	}
	
    public Snack(Long snackId) {
    	this.snackId = snackId;
    }
    
	public Long getSnackId() {
		return snackId;
	}
	public void setSnackId(Long snackId) {
		this.snackId = snackId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "Snack{" +
				"snackId=" + snackId +
				", name='" + name + '\'' +
				", price=" + price +
				", category='" + category + '\'' +
				", brand='" + brand + '\'' +
				", quantity=" + quantity +
				", imgUrl='" + imgUrl + '\'' +
				", link='" + link + '\'' +
				'}';
	}
}
