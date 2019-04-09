package com.Action;
import java.util.ArrayList;
import com.Dao.CartechDao;
import com.Model.CartechModel;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.Action.SuperAction;

public class CartechAction extends SuperAction {
	private String postdata;
	private  ArrayList<CartechModel> cartechlist=new ArrayList<CartechModel>();


	/**
	 * 车辆评估模型
	 */
	private static final long serialVersionUID = -35087647167251172L;

	public CartechAction() {
		System.out.println("Cartech 构造方法被执行。。。");
	}

	public String query() {
		System.out.println("query方法被执行");
		CartechDao CartechDao = new CartechDao();
		ArrayList<CartechModel> cartech = CartechDao.querysql();
		System.out.println("查询完毕");
		session.setAttribute("cartech",cartech);
		return "cartechqr";
	}

	public String submit() {
		System.out.println("11111111111");
		System.out.println("sumbit方法被执行");
		JSONArray jsonArray = JSONArray.fromObject(postdata);
//		int sn  =Integer.parseInt( request.getParameter("selectednum"));
//		System.out.println(sn);
//		CartechDao CartechDao = new CartechDao();
//		for (int i = 0; i < sn; i++) {
//			System.out.println(request.getParameter("body_parm"+i));
//			CartechModel ctm=new CartechModel();
//			ctm.setCar_type(request.getParameter("id"+i));
//			ctm.setBody_parm(request.getParameter("body_parm"+i));
//			ctm.setUnderframe_parm(request.getParameter("underframe_parm"+i));
//			ctm.setBogie_parm(request.getParameter("bogie_parm"+i));
//			ctm.setFoundation_parm(request.getParameter("foundation_parm"+i));
//			ctm.setAir_parm(request.getParameter("air_parm"+i));
//			ctm.setHook_parm(request.getParameter("hook_parm"+i));
//			ctm.setAxle_parm(request.getParameter("axle_parm"+i));
//			ctm.setModifier(request.getParameter("modifier"+i));
//			ctm.setVersion(request.getParameter("version"+i));
//			CartechDao.editsql(ctm);
//		}
		for (int i = 0; i < jsonArray.size(); i++) {
			System.out.println("???");
			Object o = jsonArray.get(i);
			//防止出现Can't transform property '' from java.lang.String into java.sql.Timestamp的问题
			//JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String []{"yyyy-MM-dd HH:mm:ss"}));
			JSONObject oev = JSONObject.fromObject(o);
			CartechModel ev = (CartechModel) JSONObject.toBean(oev, CartechModel.class);
			CartechDao CartechDao = new CartechDao();
			CartechModel cartechres=CartechDao.editsql(ev);
			System.out.println("222");
			System.out.println(cartechres.getVersion());
			System.out.println(cartechres.getModtime());
			System.out.println(cartechres.toString());
			cartechlist.add(cartechres);
			System.out.println(cartechlist.toString());

		}
		
		System.out.println("修改数据库完毕");
		return "cartechsr";

	}

	public String getPostdata() {
		return postdata;
	}

	public void setPostdata(String postdata) {
		this.postdata = postdata;
	}
	public ArrayList<CartechModel> getCartechlist() {
		return cartechlist;
	}

	public void setCartechlist(ArrayList<CartechModel> cartechlist) {
		this.cartechlist = cartechlist;
	}
}
