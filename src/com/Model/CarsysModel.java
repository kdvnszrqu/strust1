package com.Model;

public class CarsysModel{
		private int id;
		private String car_type;
		private String subsystem;
		private String partname;
		private String partweight;
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
		public String getSubsystem() {
			return subsystem;
		}
		public void setSubsystem(String subsystem) {
			this.subsystem = subsystem;
		}
		public String getPartname() {
			return partname;
		}
		public void setPartname(String partname) {
			this.partname = partname;
		}
		public String getPartweight() {
			return partweight;
		}
		public void setPartweight(String partweight) {
			this.partweight = partweight;
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
			String str=	id+" "+car_type+" "+subsystem+" "+partname+" "+partweight+" "+modtime+" "+modifier+" "+modifier+" "+version+" ";
			return str;
			
		}
}

