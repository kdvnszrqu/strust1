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
	// ������еĳ���״̬����ģ��
	protected Connection conn = null;
	protected PreparedStatement stmt = null;
	protected ResultSet rs = null;

	public ArrayList<CarsysModel> querysql(String car_type,String subsystem) {
		String subsystemc="";
		System.out.println("��ѯcarsys���ݱ�");
        switch(subsystem){
        case "body_parm":
        	subsystemc="����";
            break;
        case "underframe_parm":
        	subsystemc="�׼�";
            break;
        case "bogie_parm":
        	subsystemc="ת���";
            break;
        case "foundation_parm":
        	subsystemc="�����ƶ�װ��";
            break;
        case "air_parm":
        	subsystemc="�����ƶ�װ��";
            break;
        case "hook_parm":
            subsystemc="����װ��";
            break;
        case "axle_parm":
        	subsystemc="����";
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
				System.out.println("�н��");
				CarsysModel carsysModel = new CarsysModel();
				carsysModel.setId(rs.getInt("id"));
				System.out.println(rs.getInt("id"));
				carsysModel.setPartweight(rs.getString("partweight"));
				carsysModel.setCar_type(rs.getString("car_type"));
				carsysModel.setSubsystem(rs.getString("subsystem"));
				carsysModel.setPartname(rs.getString("partname"));
				//��timestampתΪDate
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
		System.out.println("�޸�carsys���ݱ�");
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
