function GetQianTaiNeiRong() {
		var info = $("#text_aaa").val();

//		var param = "time=" + time + "&" + "type=" + type;
		var param = "qiantaiString=" + info;
		$.ajax({
			url : 'qiantaichuanhoutai',
			data : param,
			dataType : "json",
			success : function(data) {
				$(data.infolist).each(function(i, value) {
					alert(value.qiantaiString);
				});
			},
			error : function(e) {
				alert(e);
			}
		});
	}