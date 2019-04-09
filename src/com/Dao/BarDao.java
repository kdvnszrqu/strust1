package com.Dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.Dbutil.Dbutil;
import com.Model.Bar;

public class BarDao{

    public int a(){

       int b=0;
    }


	// ������е�ѧ������
		protected Connection conn = null;
		protected PreparedStatement stmt = null;
		protected ResultSet rs = null;
		public ArrayList<Bar> getAllBars() {
			ArrayList<Bar> list = new ArrayList<Bar>();
			try {
				conn = Dbutil.getConnection();
				String sql = "SELECT * FROM bar;";
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Bar bar = new Bar();
					bar.setName(rs.getString("name"));
					bar.setNum(rs.getInt("num"));
					list.add(bar);
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
