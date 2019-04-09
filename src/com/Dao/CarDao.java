package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Dbutil.Dbutil;
import com.Model.car;

public class CarDao {
	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;
	public ArrayList<car> getAllCars() {
		ArrayList<car> list = new ArrayList<car>();
		try {
			conn = Dbutil.getConnection();
			String sql = "select * from car;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				car car = new car();
				car.setCar_type(rs.getString("car_type"));
				car.setTrain(rs.getString("train"));
				car.setCar(rs.getString("car"));
				car.setNo(rs.getString("train_no"));
				car.setGrade(rs.getInt("car_grade"));
				car.setPre(rs.getString("car_pre"));
				car.setNext(rs.getString("car_next"));
				car.setMile(rs.getInt("car_mile"));
				car.setReport(rs.getString("car_report"));
				car.setTime(rs.getString("car_time"));
				list.add(car);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
//			return null;
		} 
		return list;
//		finally {
//			this.destoryResource();
//		}
	}
	public ArrayList<car> getCars(String S) {
		ArrayList<car> list = new ArrayList<car>();
		try {
			conn = Dbutil.getConnection();
			String sql = "select * from car where train ="+S+";";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				car car = new car();
				car.setCar_type(rs.getString("car_type"));
				car.setTrain(rs.getString("train"));
				car.setCar(rs.getString("car"));
				car.setNo(rs.getString("train_no"));
				car.setGrade(rs.getInt("car_grade"));
				car.setPre(rs.getString("car_pre"));
				car.setNext(rs.getString("car_next"));
				car.setMile(rs.getInt("car_mile"));
				car.setReport(rs.getString("car_report"));
				car.setTime(rs.getString("car_time"));
				list.add(car);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
//			return null;
		} 
		return list;
//		finally {
//			this.destoryResource();
//		}
	}
}
