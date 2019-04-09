<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一级修车列展示</title>
<link rel="stylesheet" href="static/css/bottom.css">
<!--EasyUI-->
<link rel="stylesheet" type="text/css"
	href="static/jquery-easyui-1.6.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="static/jquery-easyui-1.6.3/themes/icon.css">
<script type="text/javascript"
	src="static/jquery-easyui-1.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.6.3/jquery.easyui.min.js"></script>
<!--JQuery-->
<script src="static/js/jquery-3.3.1.js"></script>
<!-- DataTables-->
<script type="text/javascript" charset="utf8"
	src="static/DataTables-1.10.15/media/js/jquery.js"></script>
<script type="text/javascript" charset="utf8"
	src="static/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8"
	src="static/DataTables-1.10.15/media/js/dataTables.bootstrap.js"></script>
<link
	href="static/DataTables-1.10.15/media/css/dataTables.bootstrap.css"
	rel="stylesheet" />
<!--BootStrap-->
<script src="static/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
<link href="static/bootstrap-3.3.7/dist/css/bootstrap.css"
	rel="stylesheet">


<style>
/*标题*/
div.pageTitleDiv {
	width: 100%;
	background-color: blue;
	height: 75px;
	z-index: 9;
}

div.pageTitleDiv img {
	margin: 0px 0px 10px 30px;
	float: left;
	height: 60px;
	width: 60px;
}

div.pageTitleDiv h1 {
	font-size: 28px;
	color: #ffffff;
	float: left
}

/*左菜单*/
div.leftMenuDiv {
	float: left;
	width: 250px;
	height: 100%;
	margin-left: -2px;
	border: 0;
}

/*状态显示样式*/
div.statusRepairDiv {
	margin: 20px auto;
	float: left;
	width: calc(100% - 250px);
	height: 100%;
}

/*状态表顶部*/
div.topBarDiv {
	/*border: 1px solid #C40000;*/
	
}

div.topBarDiv span {
	display: inline-block;
	margin-left: 8px;
	vertical-align: center;
}

div.topBarDiv span label select.easyui-combobox {
	width: 100px;
	height: 30px;
}

div.topBarDiv span input.easyui-datebox {
	width: 120px;
	height: 30px;
}

/*搜索按钮样式*/
button.searchTipButton {
	width: 60px;
	height: 30px;
}

button.searchTipButton:hover {
	background-color: #5cb85c;
}
/*页面显示数目选项框样式*/
select.searchTipSelect {
	height: 30px;
}

/*状态显示表样式*/
table.carTable {
	font-size: 16px;
	text-align: center;
	border: 1px solid #d9edf7;
}

table.carTable thead tr th {
	text-align: center;
	border: 1px solid #aed0ea;
	/*border-color: #aed0ea;*/
}

table.carTable tbody tr td {
	border: 1px solid #aed0ea;
}

/*整个页面*/
body {
	font-size: 16px;
	font-family: Arial;
}
</style>
<script>
	$(document).ready(function() {
		//修改
		$('#edit').click(function() {
			$(".gai").attr("contenteditable", "true");
			$(".gai").removeClass("jump");
		});
		//暂存
		$('#temp').click(function() {
			$(".gai").attr("contenteditable", "false");
			$(".gai").addClass("jump");
		});
		//全选	
		$('#carTable').DataTable({
			//lengthMenu: [5, 10, 20, 30],//这里也可以设置分页，但是不能设置具体内容，只能是一维或二维数组的方式，所以推荐下面language里面的写法。
			paging : true, //分页
			ordering : true, //是否启用排序
			searching : true, //搜索
			"iDisplayLength" : 10, //默认显示的记录数
			"ordering" : false, // 禁止排序
			language : {
				lengthMenu : '<select class="searchTipSelect form-control input-xsmall">' + '<option value="5">5</option>' + '<option value="10">10</option>' + '<option value="20">20</option>' + '<option value="30">30</option>' + '<option value="40">40</option>' + '<option value="50">50</option>' + '</select> 条记录', //左上角的分页大小显示。
				search : '<button class="searchTipButton btn btn-success">搜索：</button>', //右上角的搜索文本，可以写html标签

				paginate : { //分页的样式内容。
					previous : "上一页",
					next : "下一页",
					first : "第一页",
					last : "最后"
				},
				zeroRecords : "没有内容", //table tbody内容为空时，tbody的内容。
				//下面三者构成了总体的左下角的内容。
				info : "总共_PAGES_ 页，显示第_START_ 到第 _END_ ，筛选之后得到 _TOTAL_ 条，初始_MAX_ 条 ", //左下角的信息显示，大写的词为关键字。
				infoEmpty : "0条记录", //筛选为空时左下角的显示。
				infoFiltered : "" //筛选之后的左下角筛选提示，
			},
			paging : true,
			pagingType : "full_numbers" //分页样式的类型
		});
	});
</script>
</head>

<body>
	<div class="statusRepairPageDiv">
		<div class="pageTitleDiv">
			<img src="static/images/logo.png" title="系统首页" hspace="30px" />

			<h1>铁路货车状态修诊断决策系统</h1>
		</div>

		<div class="leftMenuDiv" style="">
			<iframe src="static/html/left.html" width="250" height="900"
				frameborder="0"> 您的浏览器不支持iframe，请升级 </iframe>
		</div>

		<div class="statusRepairDiv">
			<div class="top">
				<div align="center" id="container">
					<div
						style="position: relative;overflow: hidden;width: 500px;height: 120px;padding:20px;margin: 0px;border-width: 0px;cursor: default;"
						align="center">
						<p style="font-size:30px;">车辆技术状态评估模型</p>
					</div>
				</div>
				<div id="select" style="width: 1200px;height:30px;" align="right">
					<input id="edit" class="searchBotton GreenButtom" type="button"
						value="修改"
						style="border-radius:6px;width:60px;height:30px;border:1px;background:#5dc425;color:#FFFFFF">
					<a href="javascript:location.reload();"><input id="recovery"
						class="searchBotton GreenButtom" type="button" value="恢复"
						style="border-radius:6px;width:60px;height:30px;border:1px;background:#5dc425;color:#FFFFFF"></a>
					<input id="temp" class="searchBotton GreenButtom" type="button"
						value="暂存"
						style="border-radius:6px;width:60px;height:30px;border:1px;background:#5dc425;color:#FFFFFF">
					<input id="submit" class="searchBotton GreenButtom" type="button"
						onclick="submit1()" value="提交"
						style="border-radius:6px;width:60px;height:30px;border:1px;background:#5dc425;color:#FFFFFF">
				</div>
			</div>
<form id="form1" name="form1" method="post" action="./carsysq"> 
　　<input id="car_type" type="hidden" name="car_type" value="C80" /> 
　　<input id="subsystem" type="hidden" name="subsystem" value="轮轴" /> 
</form> 
<!-- <a href="javascript:void(0)" onclick="form1.submit()">HTMer隐藏url参数传递</a> -->
<form id="form2">
<!-- <input type=hidden name="selectednum" id="sn" />	 -->
			<table id="carTable"
				class="carTable display table table-bordered table-striped table-hover table-condensed">
				<tr>
					<th>序号</th>
					<th>车型</th>
					<th>车体权重参数</th>
					<th>底架权重参数</th>
					<th>转向架权重参数</th>
					<th>基础制动装置权重参数</th>
					<th>空气制动装置权重参数</th>
					<th>钩缓装置权重参数</th>
					<th>轮轴权重参数</th>
					<th>修改时间</th>
				    <th>修改人</th> 
					<th>版本号</th>
					<th><input id="allboxs" onclick="allcheck()" type="checkbox"></th>
				</tr>
				
				<s:iterator var="cartech" value="#session.cartech" status="status">
					<tr class="data">
						<td><s:property value="#status.index+1" /></td>
						<td style="display:none;" class="dbclicktd"><s:property
								value="#cartech.id" /></td>
<%-- 						<input type=hidden name="id<s:property value="#status.index+1"/>" class="hid1"/> 		 --%>
						<td><s:property value="#cartech.car_type" /></td>
						
						
						<td class="dbclicktd gai jump" id="body_parm"><s:property value="#cartech.body_parm" /></td>
<%-- 						<input type=hidden name="body_parm<s:property value="#status.index+1"/>" class="hid1"/>  --%>
						
						<td class="dbclicktd gai jump" id="underframe_parm"><s:property
								value="#cartech.underframe_parm" /></td>
<%-- 						<input type=hidden name="underframe_parm<s:property value="#status.index+1"/>" class="hid1"/> --%>
						
						<td class="dbclicktd gai jump" id="bogie_parm"><s:property value="#cartech.bogie_parm" /></td>
<%-- 						<input type=hidden name="bogie_parm<s:property value="#status.index+1"/>" class="hid1"/> --%>
						
						<td class="dbclicktd gai jump" id="foundation_parm"><s:property
								value="#cartech.foundation_parm" /></td>
<%-- 						<input type=hidden name="foundation_parm<s:property value="#status.index+1"/>" class="hid1"/> --%>
						
						<td class="dbclicktd gai jump" id="air_parm"><s:property value="#cartech.air_parm" /></td>
<%-- 						<input type=hidden name="air_parm<s:property value="#status.index+1"/>" class="hid1"/> --%>
						
						<td class="dbclicktd gai jump" id="hook_parm"><s:property value="#cartech.hook_parm" /></td>
<%-- 						<input type=hidden name="hook_parm<s:property value="#status.index+1"/>" class="hid1"/> --%>
						
						<td class="dbclicktd gai jump" id="axle_parm"><s:property value="#cartech.axle_parm" /></td>
<%-- 						<input type=hidden name="axle_parm<s:property value="#status.index+1"/>" class="hid1"/> --%>
						
						
						<td class="dbclicktd" id="modtime"><s:property value="#cartech.modtime" /></td>
						<td class="dbclicktd"><s:property value="#cartech.modifier" /></td>
<%-- 						<input type=hidden name="modifier<s:property value="#status.index+1"/>" class="hid1"/>  --%>
						<td class="dbclicktd" id="version"><s:property value="#cartech.version" /></td>
<%-- 						<input type=hidden name="version<s:property value="#status.index+1"/>" class="hid1"/>  --%>
						<td><input name="boxs" class="checkbox" type="checkbox"></td>
					</tr>
				</s:iterator>
			</table>
</form>
		</div>

	</div>

</body>
<script>
	//跳转
	$(".jump").click(function(){
	if($(this).hasClass("jump")){
	   var subsystem=$(this).attr('id');
	   var type=$(this).parent().children().eq(2).text();
//    alert(param);
//    alert(type);
		$("#car_type").val(type);
		$("#subsystem").val(subsystem);
		$("#form1").submit();
	}
});
	//提交
	function submit1() {
	var mymessage=confirm("确定要提交吗?");
    if(mymessage==true)
    {  

		var sn=0;
		var arr = [];
		//获取勾选的数据
		$(".checkbox").each(function(i) {
			if ($(this).is(':checked')) {
// 				sn++;
// 				var list = $(this).parent().parent().find(".dbclicktd");
// 				list.each(function(i) {
// 				var val=$(this).text();
// 				//alert(val);
// 					$(this).next().val(val);
// 				});
// 				alert(1);
				var list = $(this).parent().parent().find(".dbclicktd");
				//car_type,body_parm,underframe_parm,bogie_parm,foundation_parm,air_parm,hook_parm,axle_parm,modtime,modifier,version				
				var id = list.eq(0).html();
				var body_parm = list.eq(1).html();
				var underframe_parm = list.eq(2).html();
				var bogie_parm = list.eq(3).html();
				var foundation_parm = list.eq(4).html();
				var air_parm = list.eq(5).html();
				var hook_parm = list.eq(6).html();
				var axle_parm = list.eq(7).html();
				var modtime = list.eq(8).html();
				var modifier = list.eq(9).html();
				var version = list.eq(10).html();
				var data = {
					id : id,
					//car_type : car_type,
					body_parm : body_parm,
					underframe_parm : underframe_parm,
					bogie_parm : bogie_parm,
					foundation_parm : foundation_parm,
					air_parm : air_parm,
					hook_parm : hook_parm,
					axle_parm : axle_parm,
					modtime : modtime,
					modifier : modifier,
					version : version
				}
				arr.push(data);
			}
		});
// 		$("#sn").val(sn);
		var postdata = JSON.stringify(arr);
		$.ajax({
			//type : "post",
			url : "cartechs",
	//		data:$("#form2").serialize(),
			data : {
				// 				"username" : 1,
				// 				"pwd" : 2,
				"postdata" : postdata
			},
			//data : param,
			dataType : "json",
			contentType : "application/json",
			async : false,
			success : function(data) {
			$(".gai").attr("contenteditable", "false");
			$(".gai").addClass("jump");
					var i=0;
					$(".checkbox").each(
					function(j, value) {
						if($(this).is(":checked")){
// 						alert(j+" is and i="+i);
									$(".data:eq("+j+") #modtime").text($(data.cartechlist)[i].modtime);
									$(".data:eq("+j+") #version").text($(data.cartechlist)[i].version);
									i++;
						}
					});
				//alert("成功2");
				//window.location.reload();
			},
			error : function(e) {
				alert("error");
			}
		});
	  alert("修改成功！");
	}else{  
	  
	}
	}
	function allcheck() {
		var nn = $("#allboxs").is(":checked"); //判断th中的checkbox是否被选中，如果被选中则nn为true，反之为false
		if (nn == true) {
			var namebox = $("input[name^='boxs']"); //获取name值为boxs的所有input
			for (i = 0; i < namebox.length; i++) {
				namebox[i].checked = true; //js操作选中checkbox
			}
		}
		if (nn == false) {
			var namebox = $("input[name^='boxs']");
			for (i = 0; i < namebox.length; i++) {
				namebox[i].checked = false;
			}
		}
	}
</script>
</html>
