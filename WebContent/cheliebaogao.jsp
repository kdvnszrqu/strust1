<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	
	<script src="js/echarts.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<title>Insert title here</title>
		<style>
			div {
				float: left
			}
		</style>
</head>
<body>
	<h1>车列修程诊断决策报告</h1>
	<table id="tab1" cellpadding="1" cellspacing="1" border="1">
		<s:iterator var="stus" value="#session.baseInfos" status="status">   
			<tr>   
				<th colspan="11">车列修程诊断决策报告</th>
			</tr>
			<tr>
				<th rowspan="3">车列基本信息</th>
				<th colspan="1">车次</th>
				<th colspan="2"><s:property value="#stus.train_no"/></th>
				<th colspan="1">车型</th>
				<th colspan="2"><s:property value="#stus.train_type"/></th>
				<th colspan="1">辆数</th>
				<th colspan="3"><s:property value="#stus.car_count"/></th>
			</tr>
			<tr>
				<th colspan="1">车列总体技术状态</th>
				<th colspan="1"><s:property value="#stus.train_com_score"/></th>
				<th colspan="1">走行里程</th>
				<th colspan="1"><s:property value="#stus.total_mile_train"/></th>
				<th colspan="1">前次修程</th>
				<th colspan="1"><s:property value="#stus.pre_repair"/></th>
				<th colspan="1">前次修程后走行里程</th>
				<th colspan="3"><s:property value="#stus.mile_alrepair"/></th>
			</tr>
			<tr>
				<th colspan="1">预计下次修程</th>
				<th colspan="1"><s:property value="#stus.pe_repair_next"/></th>
				<th colspan="1">预计一级整备剩余里程</th>
				<th colspan="1"><s:property value="#stus.pe_firstr_left_mile"/></th>
				<th colspan="1">预计二级整备剩余里程</th>
				<th colspan="1"><s:property value="#stus.pe_secr_left_mile"/></th>
				<th colspan="1">预计全面修剩余里程</th>
				<th colspan="1"><s:property value="#stus.pe_allr_left_mile"/></th>
				<th colspan="1">是否需在线修</th>
				<th colspan="1"><s:property value="#stus.onlinerepair"/></th>
			</tr>
		</s:iterator>				
	</table>
	<div style="width:18%;height:200px;">
	<table id="tab11" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">车辆得分情况</th>
			<th colspan="2">分数段</th>
			<th colspan="1">比例</th>
		</tr>
		<s:iterator var="stus" value="#session.list" status="status">
		<tr>
			<th colspan="2"><s:property value="#stus.stage"/></th>
			<th colspan="2"><s:property value="#stus.sorce"/></th>
		</tr>
		</s:iterator>
		<tr>

		</tr>
	</table>
	</div>
	<div id="chart1" style="width:62%;height:200px;"></div>
		<script type="text/javascript">
				// 基于准备好的dom，初始化echarts图表
				var myChart = echarts.init(document.getElementById('chart1'));
		          // 显示标题，图例和空的坐标轴
		          myChart.setOption({
		              title: {
		                  text: '车辆得分情况'
		              },
		              tooltip: {},
		              legend: {
		                  data: ['百分比']
		              },
		              xAxis: {
		                  data: ['100~90', '90~80', '80~70','70~60', '<60']
		              },
		              yAxis: {},
		              series: [{
		                  name: '比例',
		                  type: 'bar',
		                  data: []
		              }]
		          });

 		          myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
		          var y = [];    //销量数组（实际用来盛放Y坐标值）

		          $.ajax({
		              type: "post",
		              async: true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
		              url: 'TrainSorcetable',    
		              data: {},
		              dataType: "json",        //返回数据形式为json
		              success: function (result) {
		                  //请求成功时执行该函数内容，result即为服务器返回的json对象
		                  if (result) {
		                      for (var i = 0; i < result.length; i++) {
		                          y.push(result[i].sorce);    //挨个取出销量并填入销量数组
		                      }
		                      myChart.hideLoading();    //隐藏加载动画
		                      myChart.setOption({        //加载数据图表
		                          series: [{
		                              data: y
		                          }]
		                      });
		                  }
		              },
		              error: function (errorMsg) {
		                  //请求失败时执行该函数
		                  alert("图表请求数据失败!");
		                  myChart.hideLoading();
		              }
		          })
		</script>
	<div id="blank1" style="width:20%;height:200px;">
	</div>	
</body>
</html>