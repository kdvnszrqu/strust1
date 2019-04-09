package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Dbutil.Dbutil;
import com.Model.BaseInfo;
import com.Model.TrainSorce;

public class TrainSorceDao {
	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;
	
	public ArrayList<TrainSorce> getAllTrainSorce() {
		ArrayList<TrainSorce> list = new ArrayList<TrainSorce>();
		try {
			conn = Dbutil.getConnection();
			String sql = "SELECT * FROM trainsorce;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				TrainSorce trainSorce = new TrainSorce();
				trainSorce.setStage(rs.getString("stage"));
				trainSorce.setSorce(rs.getFloat("sorce"));
				list.add(trainSorce);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		return list;
	}
}
