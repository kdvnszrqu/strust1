package com.Model;

public class CartechModel{
		private int id;
		private String car_type;
		private String body_parm;
		private String underframe_parm;
		private String bogie_parm;
		private String foundation_parm;
		private String air_parm;
		private String hook_parm;
		private String axle_parm;
		private String modtime;
		private String modifier;
		private String version;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getCar_type() {
			return car_type;
		}
		public void setCar_type(String car_type) {
			this.car_type = car_type;
		}
		public String getBody_parm() {
			return body_parm;
		}
		public void setBody_parm(String body_parm) {
			this.body_parm = body_parm;
		}
		public String getUnderframe_parm() {
			return underframe_parm;
		}
		public void setUnderframe_parm(String underframe_parm) {
			this.underframe_parm = underframe_parm;
		}
		public String getBogie_parm() {
			return bogie_parm;
		}
		public void setBogie_parm(String bogie_parm) {
			this.bogie_parm = bogie_parm;
		}
		public String getFoundation_parm() {
			return foundation_parm;
		}
		public void setFoundation_parm(String foundation_parm) {
			this.foundation_parm = foundation_parm;
		}
		public String getAir_parm() {
			return air_parm;
		}
		public void setAir_parm(String air_parm) {
			this.air_parm = air_parm;
		}
		public String getHook_parm() {
			return hook_parm;
		}
		public void setHook_parm(String hook_parm) {
			this.hook_parm = hook_parm;
		}
		public String getAxle_parm() {
			return axle_parm;
		}
		public void setAxle_parm(String axle_parm) {
			this.axle_parm = axle_parm;
		}
		public String getModtime() {
			return modtime;
		}
		public void setModtime(String modtime) {
			this.modtime = modtime;
		}
		public String getModifier() {
			return modifier;
		}
		public void setModifier(String modifier) {
			this.modifier = modifier;
		}
		public String getVersion() {
			return version;
		}
		public void setVersion(String version) {
			this.version = version;
		}
		public String toString(){
			String str=	id+" "+car_type+" "+body_parm+" "+modtime+" "+underframe_parm+" "+modtime+" "+modifier+" "+version;
			return str;
			
		}	
}

