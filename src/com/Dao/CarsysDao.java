package com.Dao;

import java.util.ArrayList;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.Dbutil.Dbutil;
import com.Model.CarsysModel;

public class CarsysDao {
	// 获得所有的车辆状态评估模型
	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;

	public ArrayList<CarsysModel> querysql(String car_type,String subsystem) {
		String subsystemc="";
		System.out.println("查询carsys数据表");
        switch(subsystem){
        case "body_parm":
        	subsystemc="车体";
            break;
        case "underframe_parm":
        	subsystemc="底架";
            break;
        case "bogie_parm":
        	subsystemc="转向架";
            break;
        case "foundation_parm":
        	subsystemc="基础制动装置";
            break;
        case "air_parm":
        	subsystemc="空气制动装置";
            break;
        case "hook_parm":
            subsystemc="钩缓装置";
            break;
        case "axle_parm":
        	subsystemc="轮轴";
            break;
            default:
            	subsystemc=subsystem;
        }
		ArrayList<CarsysModel> list = new ArrayList<CarsysModel>();
		try {
			//
			conn = Dbutil.getConnection();
			System.out.println(car_type+"!!!!"+subsystemc);
			String sql = "select distinct id,car_type,subsystem,partname,partweight,"
					+ "modtime,modifier,version from car_sys "
					+ "where car_type='"+car_type+"' and subsystem='"+subsystemc+"';";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				System.out.println("有结果");
				CarsysModel carsysModel = new CarsysModel();
				carsysModel.setId(rs.getInt("id"));
				System.out.println(rs.getInt("id"));
				carsysModel.setPartweight(rs.getString("partweight"));
				carsysModel.setCar_type(rs.getString("car_type"));
				carsysModel.setSubsystem(rs.getString("subsystem"));
				carsysModel.setPartname(rs.getString("partname"));
				//将timestamp转为Date
				Date time1=new Date(rs.getTimestamp("modtime").getTime());//java.util.Date
				SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String pubtime=formattime.format(time1);
				carsysModel.setModtime(pubtime);
				carsysModel.setModifier(rs.getString("modifier"));
				carsysModel.setVersion(rs.getString("version"));
				list.add(carsysModel);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public boolean editsql(CarsysModel carsys) {
		System.out.println("修改carsys数据表");
		Date date = new Date();       
		Timestamp modtime = new Timestamp(date.getTime());
		System.out.println(" modtime:" + modtime);
		int id = carsys.getId();;
		String partweight = carsys.getPartweight();
		//String modtime = ev.getModtime();
		String modifier = carsys.getModifier();
		Double d =Double.parseDouble(carsys.getVersion())+0.1;
		
		DecimalFormat df = new DecimalFormat("#.0");
		String  str= df.format(d);
		String version =  String.valueOf(str);
		System.out.println(version);
		String sql = "UPDATE car_sys SET " + 
//		"car_type='" + car_type + 
//		"' ,body_parm='" + body_parm+ 
		"partweight='" + partweight+
		"' ,modtime='" + modtime + 
		"' ,modifier='" + modifier + 
		"' ,version='" + version+ 
		"' where id=" + id;
		try {
			conn = Dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			int a = stmt.executeUpdate();
			System.out.println("a:" + a);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return true;
	}
}
