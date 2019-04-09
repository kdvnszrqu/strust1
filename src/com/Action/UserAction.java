package com.Action;

import java.util.ArrayList;

//import org.hibernate.classic.Session;

import com.Dao.UserDao;
import com.Model.User;
import com.Action.SuperAction;

public class UserAction extends SuperAction{
	
	public UserAction() {
		// TODO Auto-generated constructor stub
		System.out.println("UserAction 构造方法被执行。。。");
	}
	public String query()
	{	
		UserDao userDao = new UserDao();
		ArrayList<User> users = userDao.getAllUsers();
		session.setAttribute("users", users);//把后台查询到的users 传递给前台的users
		return "show";
	}
}
