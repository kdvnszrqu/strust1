package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//所有业务逻辑的父类
public class SuperDao {

	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;

	protected void destoryResource() {
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
				conn = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}
