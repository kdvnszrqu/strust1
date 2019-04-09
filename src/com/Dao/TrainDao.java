package com.Dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.Dbutil.Dbutil;
import com.Model.train;

public class TrainDao{
	// 获得所有的学生资料
		protected Connection conn = null;
		protected PreparedStatement stmt = null;
		protected ResultSet rs = null;
		public ArrayList<train> getAllTrains() {
			ArrayList<train> list = new ArrayList<train>();
			try {
				conn = Dbutil.getConnection();
				String sql = "select distinct train,car_type,train_no,train_grade,train_pre,train_next,train_mile,train_report,train_time from car;";
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					train train = new train();
					train.setCar_type(rs.getString("car_type"));
					train.setTrain_id(rs.getString("train"));
					train.setTrain_no(rs.getString("train_no"));
					train.setTrain_grade(rs.getInt("train_grade"));
					train.setPre(rs.getString("train_pre"));
					train.setNext(rs.getString("train_next"));
					train.setMile(rs.getInt("train_mile"));
					train.setReport(rs.getString("train_report"));
					train.setTime(rs.getString("train_time"));
					list.add(train);
				}
				
			} catch (Exception ex) {
				ex.printStackTrace();
//				return null;
			} 
			return list;
//			finally {
//				this.destoryResource();
//			}
		}
}
