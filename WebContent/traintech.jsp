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
table.trainTable {
	font-size: 16px;
	text-align: center;
	border: 1px solid #d9edf7;
}

table.trainTable thead tr th {
	text-align: center;
	border: 1px solid #aed0ea;
	/*border-color: #aed0ea;*/
}

table.trainTable tbody tr td {
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
			$(".g").attr("contenteditable", "true");
		});
		//暂存
		$('#temp').click(function() {
			$(".g").attr("contenteditable", "false");
		});
		//全选	
		$('#trainTable').DataTable({
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
						<p style="font-size:30px;">车列技术状态评估模型</p>
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

			<table id="trainTable"
				class="trainTable display table table-bordered table-striped table-hover table-condensed">
				<tr>
					<th>序号</th>
					<th>车型</th>
					<th>修程</th>
					<th>阈值设定部件</th>
					<th>阈值</th>
					<th>超限百分比</th>
					<th>修改时间</th>
					<th>修改人</th>
					<th>版本号</th>
					<th><input id="allboxs" onclick="allcheck()" type="checkbox"></th>
				</tr>
				<s:iterator var="traintech" value="#session.traintech" status="status">
					<tr class="data">
						<td><s:property value="#status.index+1" /></td>
						<td style="display:none;" class="dbclicktd"><s:property
								value="#traintech.id" /></td>
						<td><s:property value="#traintech.car_type" /></td>
						<td class="dbclicktd g"><s:property value="#traintech.repairprocess" /></td>
						<td class="dbclicktd g"><s:property value="#traintech.thresholdpart" /></td>
						<td class="dbclicktd g"><s:property
								value="#traintech.threshold" /></td>
						<td class="dbclicktd g"><s:property value="#traintech.overper" /></td>		
						<td class="dbclicktd"><s:property value="#traintech.modtime" /></td>
						<td class="dbclicktd"><s:property value="#traintech.modifier" /></td>
						<td class="dbclicktd"><s:property value="#traintech.version" /></td>
						<td><input name="boxs" class="checkbox" type="checkbox"></td>
					</tr>
				</s:iterator>
			</table>
		</div>

	</div>

</body>
<script>
	//提交
	function submit1() {
		var arr = [];
		//获取勾选的数据
		$(".checkbox").each(function(i) {
			if ($(this).is(':checked')) {
				var list = $(this).parent().parent().find(".dbclicktd");
				//car_type,body_parm,underframe_parm,bogie_parm,foundation_parm,air_parm,hook_parm,axle_parm,modtime,modifier,version				
				var id = list.eq(0).html();
				var repairprocess = list.eq(1).html();
				var thresholdpart = list.eq(2).html();
				var threshold = list.eq(3).html();
				var overper = list.eq(4).html();
				var modtime = list.eq(5).html();
				var modifier = list.eq(6).html();
				var version = list.eq(7).html();
				var data = {
					id : id,
					//car_type : car_type,
					repairprocess : repairprocess,
					thresholdpart : thresholdpart,
					threshold : threshold,
					overper : overper,			
					modtime : modtime,
					modifier : modifier,
					version : version
				}
				arr.push(data);
			}
		});
		var postdata = JSON.stringify(arr);
		$.ajax({
			//type : "post",
			url : "traintechs",
			data : {
				// 				"username" : 1,
				// 				"pwd" : 2,
				"postdata" : postdata
			},
			//data : param,
			dataType : "json",
			contentType : "application/json",
			async : true,
			success : function(data) {
				alert("修改成功！");
				window.location.reload();
			},
			error : function(e) {
				alert("error");
			}
		});
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
