package com.Dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.Dbutil.Dbutil;
import com.Model.User;

public class UserDao{
	// 获得所有的学生资料
		protected Connection conn = null;
		protected PreparedStatement stmt = null;
		protected ResultSet rs = null;
	
		public ArrayList<User> getAllUsers() {
			ArrayList<User> list = new ArrayList<User>();
			try {
				conn = Dbutil.getConnection();
				String sql = "select * from users;";
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setPass(rs.getInt("pass"));
					list.add(user);
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
