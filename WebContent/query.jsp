<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <center>
      <table width="800"  border="0" cellpadding="0" cellspacing="0">
      <s:iterator var="stus" value="#session.users" status="status">
      <tr>
        <td width="20%"><b>ID</b></td>
        <td width="20%"><s:property value="#stus.id"/></td>
      </tr>
      <tr>
         <td width="20%"><b>Pass</b></td>
         <td width="20%"><s:property value="#stus.pass"/></td>
        </tr>
      </s:iterator>
      </table>
      <br>
      <br>
    </center>  
  </body>
</html>