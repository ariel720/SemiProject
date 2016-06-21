package com.semi.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ResDTO {

	private int res_num;
	private String id;
	private String r_name;
	private Timestamp start_day;
	private Timestamp last_day;
	private int time_counts;
	private int room_price;
	private int cat_counts;
	private int total_price;
	private String ph1;
	private String ph2;
	private String ph3;
	private String res_days;
	
	
	public String getRes_days() {
		return res_days;
	}
	public void setRes_days(String res_days) {
		this.res_days = res_days;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public Timestamp getStart_day() {
		return start_day;
	}
	public void setStart_day(Timestamp start_day) {
		this.start_day = start_day;
	}
	public Timestamp getLast_day() {
		return last_day;
	}
	public void setLast_day(Timestamp last_day) {
		this.last_day = last_day;
	}
	
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public int getCat_counts() {
		return cat_counts;
	}
	public void setCat_counts(int cat_counts) {
		this.cat_counts = cat_counts;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getPh1() {
		return ph1;
	}
	public void setPh1(String ph1) {
		this.ph1 = ph1;
	}
	public String getPh2() {
		return ph2;
	}
	public void setPh2(String ph2) {
		this.ph2 = ph2;
	}
	public String getPh3() {
		return ph3;
	}
	public void setPh3(String ph3) {
		this.ph3 = ph3;
	}
	
	public int getTime_counts() {
		return time_counts;
	}
	public void setTime_counts(int time_counts) {
		this.time_counts = time_counts;
	}
	
	
	
}
