
$(document).ready(function () {
  
    $("#search").click(function () {
        //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
    	//alert("2");
       // var params = $("#selectConditionform").serialize();
        $.ajax({
            url:'../action/GetRSRPList',
            type:'post',
            data:{},
            dataType:'json',
            success:function (data) {
                /*$.each(data.userList, function(i, value){
                 $("#allUser").append("<div>输出了：id:"+value.id+", name: "+value.name+"</div>");
                 });*/
            	
               // $(data.riList).each(function (i, value) {
                   
                	//$("#showarea").append("<div>输出了：lat:" + value.lat+ ", lon: " + value.lon + ", RSRPValue: " + value.RSRPValue + "</div>");
                //});
            	
            	map_test(data);
            	getCurrentRegionData();
            }
        });
        
      
    
})});