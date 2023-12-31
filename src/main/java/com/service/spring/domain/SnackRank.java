package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class SnackRank {
    private Long snackId;
    private String name;
    private int rank;
    private int count;
    private String imgUrl;
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
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "SnackRank{" +
				"snackId=" + snackId +
				", name='" + name + '\'' +
				", rank=" + rank +
				", count=" + count +
				'}';
	}
}
