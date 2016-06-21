package com.semi.dto;

import java.sql.Date;

public class GalHoDTO {
	private int num;
	private String id;
	private String title;
	private String contents;
	private int counts;
	private Date reg_date;
	private String imagefile;
	private int re_counts;
	
	public int getRe_counts() {
		return re_counts;
	}
	public void setRe_counts(int re_counts) {
		this.re_counts = re_counts;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getImagefile() {
		return imagefile;
	}
	public void setImagefile(String imagefile) {
		this.imagefile = imagefile;
	}
	
	

	
	
}
