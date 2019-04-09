package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Dbutil.Dbutil;
import com.Model.Bar;
import com.Model.BaseInfo;

public class BaseInfoDao {
	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;
	
	public ArrayList<BaseInfo> getAllBaseInfo() {
		ArrayList<BaseInfo> list = new ArrayList<BaseInfo>();
		try {
			conn = Dbutil.getConnection();
			String sql = "SELECT * FROM baseInfo;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				BaseInfo baseInfo = new BaseInfo();
				baseInfo.setTrain_no(rs.getString("train_no"));
				baseInfo.setTrain_type(rs.getString("train_type"));
				baseInfo.setCar_count(rs.getInt("car_count"));
				baseInfo.setTrain_com_score(rs.getInt("train_com_score"));
				baseInfo.setTotal_mile_train(rs.getInt("total_mile_train"));
				baseInfo.setPre_repair(rs.getString("pre_repair"));
				baseInfo.setMile_alrepair(rs.getInt("mile_alrepair"));
				baseInfo.setPe_repair_next(rs.getString("pe_repair_next"));
				baseInfo.setPe_firstr_left_mile(rs.getInt("pe_firstr_left_mile"));
				baseInfo.setPe_secr_left_mile(rs.getInt("pe_secr_left_mile"));
				baseInfo.setPe_allr_left_mile(rs.getInt("pe_allr_left_mile"));
				baseInfo.setOnlinerepair(rs.getString("onlinerepair"));
				list.add(baseInfo);
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
