<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <title>一级修车列展示</title>
	<link rel="stylesheet" href="static/css/bottom.css">
	<!--EasyUI-->
	<link rel="stylesheet" type="text/css" href="static/jquery-easyui-1.6.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/jquery-easyui-1.6.3/themes/icon.css">
	<script type="text/javascript" src="static/jquery-easyui-1.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="static/jquery-easyui-1.6.3/jquery.easyui.min.js"></script>
	<!--JQuery-->
	<script src="static/js/jquery-3.3.1.js"></script>
	<!-- DataTables-->
	<script type="text/javascript" charset="utf8" src="static/DataTables-1.10.15/media/js/jquery.js"></script>
	<script type="text/javascript" charset="utf8" src="static/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8" src="static/DataTables-1.10.15/media/js/dataTables.bootstrap.js"></script>
	<link href="static/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet" />
	<!--BootStrap-->
	<script src="static/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
	<link href="static/bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet">
	
	
	<style>
	    /*标题*/
	    div.pageTitleDiv {
	        width:100%;
	        background-color:blue;
	        height:75px;
	        z-index:9;
	    }
	    div.pageTitleDiv img {
	        margin:0px 0px 10px 30px;
	        float: left;
	        height: 60px;
	        width:60px;
	    }
	    div.pageTitleDiv h1 {
	        font-size:28px;
	        color:#ffffff;
	        float: left
	    }
	
	    /*左菜单*/
	    div.leftMenuDiv{
	        float:left;
	        width:250px;
	        height:100%;
	        margin-left:-2px;
	        border: 0;
	    }
	
	    /*状态显示样式*/
	    div.statusRepairDiv{
	        margin: 20px auto;
	        float:left;
	        width:calc(100% - 250px);
	        height:100%;
	    }
	
	    /*状态表顶部*/
	    div.topBarDiv{
	        /*border: 1px solid #C40000;*/
	    }
	
	    div.topBarDiv span{
	        display: inline-block;
	        margin-left: 8px;
	        vertical-align: center;
	    }
	
	    div.topBarDiv span label select.easyui-combobox{
	        width: 100px;
	        height: 30px;
	    }
	
	    div.topBarDiv span input.easyui-datebox{
	        width: 120px;
	        height: 30px;
	    }
	    
	    /*搜索按钮样式*/
	    button.searchTipButton{
	        width: 60px;
	        height: 30px;
	    }
	    button.searchTipButton:hover{
	        background-color: #5cb85c;
	    }
	    /*页面显示数目选项框样式*/
	    select.searchTipSelect{
	        height: 30px;
	    }
	
	    /*状态显示表样式*/
	    table.carTable{
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
	    body{
	        font-size: 16px;
	        font-family: Arial;
	    }
	</style>
	<script>
	    $(document).ready(function() {
	        $('#carTable').DataTable({
	            //lengthMenu: [5, 10, 20, 30],//这里也可以设置分页，但是不能设置具体内容，只能是一维或二维数组的方式，所以推荐下面language里面的写法。
	            paging: true,//分页
	            ordering: true,//是否启用排序
	            searching: true,//搜索
	            "iDisplayLength" : 10, //默认显示的记录数
	            "ordering": false, // 禁止排序
	            language: {
	                lengthMenu: '<select class="searchTipSelect form-control input-xsmall">' + '<option value="5">5</option>' + '<option value="10">10</option>' + '<option value="20">20</option>' + '<option value="30">30</option>' + '<option value="40">40</option>' + '<option value="50">50</option>' + '</select> 条记录',//左上角的分页大小显示。
	                search: '<button class="searchTipButton btn btn-success">搜索：</button>',//右上角的搜索文本，可以写html标签
	
	                paginate: {//分页的样式内容。
	                    previous: "上一页",
	                    next: "下一页",
	                    first: "第一页",
	                    last: "最后"
	                },
	                zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
	                //下面三者构成了总体的左下角的内容。
	                info: "总共_PAGES_ 页，显示第_START_ 到第 _END_ ，筛选之后得到 _TOTAL_ 条，初始_MAX_ 条 ",//左下角的信息显示，大写的词为关键字。
	                infoEmpty: "0条记录",//筛选为空时左下角的显示。
	                infoFiltered: ""//筛选之后的左下角筛选提示，
	            },
	            paging: true,
	            pagingType: "full_numbers"//分页样式的类型
	        });
	    });
	</script>
  </head>
  
  <body>
  <div class="statusRepairPageDiv">
 
        <div class="pageTitleDiv">
            <img src="static/images/logo.png" title="系统首页" hspace="30px"/>
            <h1>铁路货车状态修诊断决策系统</h1>
        </div>

        <div class="leftMenuDiv" style="">
            <iframe src="static/html/left.html" width="250" height="900" frameborder="0">
                您的浏览器不支持iframe，请升级
            </iframe>
        </div>

        <div class="statusRepairDiv">
            <div class="topBarDiv">
                <span>
                    车型:
                    <label>
                        <select name="select3" class="easyui-combobox">
                            <option>全部</option>
                            <option>C80</option>
                            <option>C80B</option>
                            <option>C70A</option>
                            <option>C64A</option>
                        </select>
                    </label>
                </span>
                <span>
                    车列号:
                    <label>
                        <select name="select3" class="easyui-combobox">
                            <option>全部</option>
                            <option>254643</option>
                            <option>254644</option>
                        </select>
                    </label>
                </span>

                <span>
                    车号:
                    <label>
                        <select name="select3" class="easyui-combobox">
                            <option>008753</option>
                            <option>全部</option>
                            <option>008754</option>
                            <option>008755</option>
                            <option>008756</option>
                        </select>
                    </label>
                </span>
                <!--操作按钮-->
                <a href="#" class="searchBotton GreenButtom">
                   查询
                </a>

                <span style="float:right;">
                    <a class="partsBotton newButtom" href="lbjstatus.jsp" style="float:right;">
                        <img class="center" src="static/images/find.png" />零部件
                    </a>
                    <a class="analyseBotton newButtom" href="statusre.jsp" style="width:80px">
                        <img class="center" src="static/images/find.png" />趋势分析
                    </a>
                </span>
                <!-- <th width="10%" align="center"><BUTTON style="HEIGHT:25px" onClick="javascript:if (confirm('查询数据？')) location.href='#';else return;"><img src="static/static/images/btn_search.gif" width="16" height="16" align="absmiddle"> 查询</BUTTON></th> -->
                <!--取消浮动样式-->
                <div style="clear: both"></div>
            </div>

            <br>	
				    <table id="carTable" class="carTable display table table-bordered table-striped table-hover table-condensed">
				    		<tr>
								<th>序号</th>
								<th>车型</th>
								<th>车列号</th>
								<th>车次</th>
								<th>得分</th>
								<th>前次修程</th>
								<th>下次修程</th>
								<th>剩余里程</th>
								<th>车列报告id</th>
								<th>报告时间</th>
							</tr>
						
						<s:iterator var="train" value="#session.train" status="status">       
							<tr>
								<td><s:property value="#status.index+1" /></td>
								<td>${train.car_type}<s:property value="#train.car_type" /></td>
								<td><s:property value="#train.train_id" /></td>
								<td><s:property value="#train.train_no" /></td>
								<td><s:property value="#train.train_grade" /></td>
								<td><s:property value="#train.pre" /></td>
								<td><s:property value="#train.next" /></td>
								<td><s:property value="#train.mile" /></td>
								<td><s:property value="#train.report" /></td>
								<td><s:property value="#train.time" /></td>
							</tr>
						</s:iterator>
					</table>
 				</div>
 				<div><form action="car" method="post"><input type="text" name="car_id"/> <br>
                <table>
                    <tr>
                        <td><input type="submit" value="提交"/></td>
                        <td><input type="reset" value="重置" ></td>
                    </tr>
                </table>
        		</form></div>
            <div class="easyui-panel">
		<div class="easyui-pagination" data-options="total:114"></div>
	</div>
    </div>
  </body>
</html>
