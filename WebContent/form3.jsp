<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/echarts.min.js"></script>
<title>Insert title here</title>
<style> 
	div{float:left} 
</style>
</head>
<body>
	<h1>车列修程诊断决策报告</h1>
	<table id="tab1" cellpadding="1" cellspacing="1" border="1">   
		<tr>   
			<th colspan="11">车列修程诊断决策报告</th>
		</tr>
		<tr>
			<th rowspan="3">车列基本信息</th>
			<th colspan="1">车次</th>
			<th colspan="2">H28116</th>
			<th colspan="1">车型</th>
			<th colspan="2">C80</th>
			<th colspan="1">辆数</th>
			<th colspan="3">56</th>
		</tr>
		<tr>
			<th colspan="1">车列总体技术状态</th>
			<th colspan="1">83</th>
			<th colspan="1">走行里程</th>
			<th colspan="1">270万公里</th>
			<th colspan="1">前次修程</th>
			<th colspan="1">二级修</th>
			<th colspan="1">前次修程后走行里程</th>
			<th colspan="3">33万公里</th>
		</tr>
		<tr>
			<th colspan="1">预计下次修程</th>
			<th colspan="1">一级修</th>
			<th colspan="1">预计一级整备剩余里程</th>
			<th colspan="1">6万公里</th>
			<th colspan="1">预计二级整备剩余里程</th>
			<th colspan="1">8万公里</th>
			<th colspan="1">预计全面修剩余里程</th>
			<th colspan="1">109万公里</th>
			<th colspan="1">是否需在线修</th>
			<th colspan="1">否</th>
		</tr>				
	</table>
	<div style="width:18%;height:200px;">
	<table id="tab11" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">车辆得分情况</th>
			<th colspan="2">分数段</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="2">100~90</th>
			<th colspan="2">7%</th>
		</tr>
		<tr>
			<th colspan="2">90~80</th>
			<th colspan="2">32%</th>
		</tr>
		<tr>
			<th colspan="2">80~70</th>
			<th colspan="2">35%</th>
		</tr>
		<tr>
			<th colspan="2">70~60</th>
			<th colspan="2">25%</th>
		</tr>
		<tr>
			<th colspan="2"><60</th>
			<th colspan="2">1%</th>
		</tr>
	</table>
	</div>
	<div id="chart1" style="width:62%;height:200px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart1'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '车辆得分比例图'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
                data: ["100~90","90~80","80~70","70~60","<60"]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
                data: [7, 32, 35, 25, 1]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
	<div id="blank1" style="width:20%;height:200px;">
	</div>
	<table id="tab111" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th colspan="1">闸瓦剩余厚度预警</th>
			<th colspan="1">20%</th>
			<th colspan="1">关门车辆数</th>
			<th colspan="1">32</th>
			<th colspan="1">轮径差0~2</th>
			<th colspan="1">（65%）</th>
			<th colspan="1">轮径差2~5</th>
			<th colspan="1">（32%）</th>
			<th colspan="1">轮径差>5</th>
			<th colspan="1">（3%）</th>				
		</tr>
	</table>
	<div style="width:18%;height:230px;">
	<table id="tab1111" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">踏面圆周磨耗情况</th>
			<th colspan="2">磨耗量</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="2">0~3</th>
			<th colspan="2">67%</th>
		</tr>
		<tr>
			<th colspan="2">3~4</th>
			<th colspan="2">17%</th>
		</tr>
		<tr>
			<th colspan="2">4~5</th>
			<th colspan="2">9%</th>
		</tr>
		<tr>
			<th colspan="2">5~6</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="2">6~7</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="2">7~8</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="2">>8</th>
			<th colspan="2">1%</th>
		</tr>
	</table>
	</div>
	<div id="chart11" style="width:62%;height:230px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart11'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '踏面圆周磨耗'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
                data: ["0~3",
                	   "3~4",
                	   "4~5",
                	   "5~6",
                	   "6~7",
                	   "7~8",
                	   ">8"]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
                data: [67,
                	   17, 
                	   9, 
                       3, 
                	   3,
                	   3,
                	   1]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
	<div id="blank11" style="width:20%;height:230px;"></div>
	
	<table id="tab11111" cellpadding="1" cellspacing="1" border="1">   
		<tr>
			<th rowspan="10">技术状态监测情况</th>
			<th colspan="2" rowspan="2">监测设备报警记录</th>
			<th colspan="1">序号</th>
			<th colspan="1">报警设备</th>
			<th colspan="1">探测站</th>
			<th colspan="1">报警时间</th>
			<th colspan="1">报警轴位</th>
			<th colspan="1">报警等级</th>
			<th colspan="1">报警内容</th>
			<th colspan="1">处理方式</th>
			<th colspan="1">反馈结果</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="2" rowspan="2">运行品质不良报警情况</th>
			<th colspan="1">序号</th>
			<th colspan="1">车号</th>
			<th colspan="1">探测站</th>
			<th colspan="1">报警时间</th>
			<th colspan="1">报警内容</th>
			<th colspan="1">故障指向</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="2" rowspan="2">动力学特征故障报警</th>
			<th colspan="1">序号</th>
			<th colspan="1">车号</th>
			<th colspan="1">探测站</th>
			<th colspan="1">报警时间</th>
			<th colspan="1">报警内容</th>
			<th colspan="1">故障指向</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="2" rowspan="2">预警信息</th>
			<th colspan="1">序号</th>
			<th colspan="1">预警设备</th>
			<th colspan="1">探测站</th>
			<th colspan="1">预警时间</th>
			<th colspan="1">预警轴位</th>
			<th colspan="1">预警等级</th>
			<th colspan="1">预警内容</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="2" rowspan="2">联合预警情况</th>
			<th colspan="1">序号</th>
			<th colspan="1">预警设备</th>
			<th colspan="1">探测站</th>
			<th colspan="1">预警时间</th>
			<th colspan="1">预警轴位</th>
			<th colspan="1">预警等级</th>
			<th colspan="1">预警内容</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
	</table>
	
	<br>
	<hr>
	<br>
	<table id="tab2" cellpadding="1" cellspacing="1" border="1">   
		<tr>   
			<th colspan="11">在线修建议重点检查内容</th>
		</tr>
		<tr>
			<th colspan="1">序号</th>
			<th colspan="1">车号</th>
			<th colspan="1">辆序</th>
			<th colspan="1">零部件</th>
			<th colspan="1">位置</th>
			<th colspan="1">检修内容</th>
			<th colspan="1">检修原因</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
	</table>
		
	<br>
	
	<table id="tab3" cellpadding="1" cellspacing="1" border="1">   
		<tr>   
			<th colspan="11">整备修重点检修内容</th>
		</tr>
		<tr>
			<th rowspan="2">全寿命更换/检修</th>
			<th colspan="1">序号</th>
			<th colspan="1">车号</th>
			<th colspan="1">辆序</th>
			<th colspan="1">零部件</th>
			<th colspan="1">位置</th>
			<th colspan="1">剩余里程</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th rowspan="2">探伤</th>
			<th colspan="1">序号</th>
			<th colspan="1">车号</th>
			<th colspan="1">辆序</th>
			<th colspan="1">零部件</th>
			<th colspan="1">位置</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th rowspan="2">轴承</th>
			<th colspan="1">序号</th>
			<th colspan="1">车号</th>
			<th colspan="1">辆序</th>
			<th colspan="1">位置</th>
			<th colspan="1">检修原因</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th rowspan="2">车轮</th>
			<th colspan="1">序号</th>
			<th colspan="1">车号</th>
			<th colspan="1">辆序</th>
			<th colspan="1">位置</th>
			<th colspan="1">检修原因</th>
		</tr>
		<tr>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
	</table>
	
	<br>
	
	<table id="tab4" cellpadding="1" cellspacing="1" border="1">   
		<tr>   
			<th colspan="12">车列修程诊断子报告</th>
		</tr>
		<tr>
			<th rowspan="12">车辆得分</th>
			<th colspan="1">辆序-车号</th>
			<th colspan="1">01-0082582</th>
			<th colspan="1">02-0082581</th>
			<th colspan="1">03-0044967</th>
			<th colspan="1">04-0044966</th>
			<th colspan="1">05-0082556</th>
			<th colspan="1">06-0082555</th>
			<th colspan="1">07-0082578</th>
			<th colspan="1">08-0082577</th>
			<th colspan="1">09-0082548</th>
		</tr>
		<tr>
			<th colspan="1">得分</th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="1">辆序-车号</th>
			<th colspan="1">10-0082582</th>
			<th colspan="1">11-0082582</th>
			<th colspan="1">12-0082581</th>
			<th colspan="1">13-0044967</th>
			<th colspan="1">14-0044966</th>
			<th colspan="1">15-0082556</th>
			<th colspan="1">16-0082555</th>
			<th colspan="1">17-0082578</th>
			<th colspan="1">18-0082577</th>
		</tr>
		<tr>
			<th colspan="1">得分</th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="1">辆序-车号</th>
			<th colspan="1">19-0082582</th>
			<th colspan="1">20-0082548</th>
			<th colspan="1">21-0082548</th>
			<th colspan="1">22-0082581</th>
			<th colspan="1">23-0044967</th>
			<th colspan="1">24-0044966</th>
			<th colspan="1">25-0082556</th>
			<th colspan="1">26-0082555</th>
			<th colspan="1">27-0082578</th>
		</tr>
		<tr>
			<th colspan="1">得分</th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="1">辆序-车号</th>
			<th colspan="1">28-0082577</th>
			<th colspan="1">29-0082548</th>
			<th colspan="1">30-0082578</th>			
			<th colspan="1">31-0082582</th>
			<th colspan="1">32-0082581</th>
			<th colspan="1">33-0044967</th>
			<th colspan="1">34-0044966</th>
			<th colspan="1">35-0082556</th>
			<th colspan="1">36-0082555</th>
		</tr>
		<tr>
			<th colspan="1">得分</th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="1">辆序-车号</th>
			<th colspan="1">37-0082578</th>
			<th colspan="1">38-0082577</th>
			<th colspan="1">39-0082548</th>
			<th colspan="1">40-0082555</th>
			<th colspan="1">41-0082582</th>
			<th colspan="1">42-0082581</th>
			<th colspan="1">43-0044967</th>
			<th colspan="1">44-0044966</th>
			<th colspan="1">45-0082556</th>
		</tr>
		<tr>
			<th colspan="1">得分</th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>
		<tr>
			<th colspan="1">辆序-车号</th>
			<th colspan="1">46-0082555</th>
			<th colspan="1">47-0082578</th>
			<th colspan="1">48-0082577</th>
			<th colspan="1">49-0082548</th>
			<th colspan="1">50-0082556</th>
			<th colspan="1">51-0082582</th>
			<th colspan="1">52-0082581</th>
			<th colspan="1">53-0044967</th>
			<th colspan="1">54-0044966</th>
		</tr>
		<tr>
			<th colspan="1">得分</th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
			<th colspan="1">  </th>
		</tr>			
	</table>
	
	<br>
	<hr>
	<h1>全寿命零部件寿命分布情况</h1>
	<div style="width:20%;height:200px;">
	<table id="tab21" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">车体钢结构</th>
			<th colspan="3">剩余里程</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">360~500</th>
			<th colspan="2">21%</th>
		</tr>
		<tr>
			<th colspan="3">240~360</th>
			<th colspan="2">47%</th>
		</tr>
		<tr>
			<th colspan="3">120~240</th>
			<th colspan="2">32%</th>
		</tr>
		<tr>
			<th colspan="3">0~120</th>
			<th colspan="2">0%</th>
		</tr>
		<tr>
			<th colspan="3">剩余里程超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart21" style="width:30%;height:200px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart21'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '剩余里程/万公里'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
                data: ["360~500",
                		"240~360",
                		"120~240",
                		"0~120"
                	]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
                data: [ 21, 
                		47,
                		32,
                		0
                	  ]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <div style="width:20%;height:200px;">
	<table id="tab22" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">侧架</th>
			<th colspan="3">剩余里程</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">360~500</th>
			<th colspan="2">11%</th>
		</tr>
		<tr>
			<th colspan="3">240~360</th>
			<th colspan="2">32%</th>
		</tr>
		<tr>
			<th colspan="3">120~240</th>
			<th colspan="2">50%</th>
		</tr>
		<tr>
			<th colspan="3">0~120</th>
			<th colspan="2">7%</th>
		</tr>
		<tr>
			<th colspan="3">剩余里程超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart22" style="width:30%;height:200px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart22'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '剩余里程/万公里'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
            	data: ["360~500",
            		"240~360",
            		"120~240",
            		"0~120"
            	]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
    			data: [ 11, 
            		32,
            		50,
            		7
            	  ]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <!-- ------------------------------------------------------------------------------------------------ -->
    <div style="width:20%;height:200px;">
	<table id="tab23" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">摇枕</th>
			<th colspan="3">剩余里程</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">360~500</th>
			<th colspan="2">21%</th>
		</tr>
		<tr>
			<th colspan="3">240~360</th>
			<th colspan="2">37%</th>
		</tr>
		<tr>
			<th colspan="3">120~240</th>
			<th colspan="2">32%</th>
		</tr>
		<tr>
			<th colspan="3">0~120</th>
			<th colspan="2">10%</th>
		</tr>
		<tr>
			<th colspan="3">剩余里程超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart23" style="width:30%;height:200px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart23'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '剩余里程/万公里'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
            	data: ["360~500",
            		"240~360",
            		"120~240",
            		"0~120"
            	]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
    			data: [ 21, 
            		37,
            		32,
            		10
            	  ]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <div style="width:20%;height:200px;">
	<table id="tab24" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">车轴</th>
			<th colspan="3">剩余里程</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">360~500</th>
			<th colspan="2">46%</th>
		</tr>
		<tr>
			<th colspan="3">240~360</th>
			<th colspan="2">28%</th>
		</tr>
		<tr>
			<th colspan="3">120~240</th>
			<th colspan="2">20%</th>
		</tr>
		<tr>
			<th colspan="3">0~120</th>
			<th colspan="2">6%</th>
		</tr>
		<tr>
			<th colspan="3">剩余里程超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart24" style="width:30%;height:200px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart24'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '剩余里程/万公里'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
            	data: ["360~500",
            		"240~360",
            		"120~240",
            		"0~120"
            	]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
    			data: [ 46, 
            		28,
            		20,
            		6
            	  ]
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <!-- --------------------------------------------------------------- -->
    
    <br>
    <h4>未完待补充。。。</h4>
	<hr>
	<h1>使用寿命零部件寿命分布情况</h1>
	<div style="width:20%;height:250px;">
	<table id="tab31" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">轮辋厚度</th>
			<th colspan="3">轮辋厚度</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">50~65</th>
			<th colspan="2">8%</th>
		</tr>
		<tr>
			<th colspan="3">40~50</th>
			<th colspan="2">42%</th>
		</tr>
		<tr>
			<th colspan="3">30~40</th>
			<th colspan="2">37%</th>
		</tr>
		<tr>
			<th colspan="3">26~30</th>
			<th colspan="2">11%</th>
		</tr>
		<tr>
			<th colspan="3">23~26</th>
			<th colspan="2">2%</th>
		</tr>
		<tr>
			<th colspan="3"><23</th>
			<th colspan="2">0%</th>
		</tr>
		<tr>
			<th colspan="3">轮辋厚度超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart31" style="width:30%;height:250px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart31'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '轮辋厚度'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
                data: ["50~65","40~50","30~40","26~30","23~26","<23"]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
                data: [8,42,37,11,2,0]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <div style="width:20%;height:250px;">
	<table id="tab32" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">轮径差</th>
			<th colspan="3">轮径差</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">0~2</th>
			<th colspan="2">65%</th>
		</tr>
		<tr>
			<th colspan="3">2~5</th>
			<th colspan="2">32%</th>
		</tr>
		<tr>
			<th colspan="3">>5</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="3">剩余里程超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart32" style="width:30%;height:250px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart32'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '轮径差'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
                data: [">5","5~2","2~0"]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
                data: [65, 32, 3]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <!-- ------------------------------------------------------------------------------------------------ -->
    <div style="width:20%;height:300px;">
	<table id="tab33" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">踏面圆周磨耗</th>
			<th colspan="3">踏面圆周磨耗</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">0~3</th>
			<th colspan="2">67%</th>
		</tr>
		<tr>
			<th colspan="3">3~4</th>
			<th colspan="2">17%</th>
		</tr>
		<tr>
			<th colspan="3">4~5</th>
			<th colspan="2">9%</th>
		</tr>
		<tr>
			<th colspan="3">5~6</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="3">6~7</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="3">7~8</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="3">>8</th>
			<th colspan="2">0%</th>
		</tr>
		<tr>
			<th colspan="3">磨耗量超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart33" style="width:30%;height:300px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart33'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '踏面圆周磨耗'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
                data: [
							"0~3",
							"3~4",
							"4~5",
							"5~6",
							"6~7",
							"7~8",
							">8"
                	]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
                data: [
						67,
						17,
						9,
						3,
						3,
						1,
						0
                	]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <div style="width:20%;height:300px;">
	<table id="tab34" cellpadding="1" cellspacing="1" border="1">
		<tr>
			<th rowspan="10">轮缘厚度</th>
			<th colspan="3">剩余里程</th>
			<th colspan="1">比例</th>
		</tr>
		<tr>
			<th colspan="3">28~32</th>
			<th colspan="2">64%</th>
		</tr>
		<tr>
			<th colspan="3">25~28</th>
			<th colspan="2">32%</th>
		</tr>
		<tr>
			<th colspan="3">23~25</th>
			<th colspan="2">3%</th>
		</tr>
		<tr>
			<th colspan="3"><23</th>
			<th colspan="2">1%</th>
		</tr>
		<tr>
			<th colspan="3">轮缘厚度超过阈值车辆</th>
			<th colspan="2"></th>
		</tr>
	</table>
	</div>
	<div id="chart34" style="width:30%;height:300px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart34'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '轮缘厚度'
            },
            tooltip: {},
            legend: {
                data:['比例']
            },
            xAxis: {
                data: [
					"28~32",
					"25~28",
					"23~25",
					"<23"
                	]
            },
            yAxis: {},
            series: [{
                name: '比例',
                type: 'bar',
    			itemStyle : {
    				normal : {
    					label: {
    				          show: true,
    				          position: 'top',
    				          textStyle: {
    				            color: 'black'
    				      }
    				   }
    				},
    			},
                data: [
        			64,
					32,
					3,
					1
                	]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>		
</body>
</html>