package com.Action;

import java.util.ArrayList;

//import org.hibernate.classic.Session;

import com.Dao.UserDao;
import com.Model.User;
import com.Action.SuperAction;

public class UserAction extends SuperAction{
	
	public UserAction() {
		// TODO Auto-generated constructor stub
		System.out.println("UserAction ���췽����ִ�С�����");
	}
	public String query()
	{	
		UserDao userDao = new UserDao();
		ArrayList<User> users = userDao.getAllUsers();
		session.setAttribute("users", users);//�Ѻ�̨��ѯ����users ���ݸ�ǰ̨��users
		return "show";
	}
}
