package com.tap.model;

import java.sql.Timestamp;

public class user {

		private int userid;
		private String userName;
		private String email;
		private String phone;
		private String password;
		private String address;
		private String city;
		private String pincode;
		private String role;
		private Timestamp createdDate;
		private Timestamp lastLoginDate;
		
		public user() {
			
		}
		
		@Override
		public String toString() {
			return "user [userid=" + userid + ", userName=" + userName + ", email=" + email
					+ ", phone=" + phone + ", address=" + address + ", city=" + city
					+ ", pincode=" + pincode + ", role=" + role + "]";
		}

		public int getUserid() { return userid; }
		public void setUserid(int userid) { this.userid = userid; }

		public String getUserName() { return userName; }
		public void setUserName(String userName) { this.userName = userName; }

		public String getEmail() { return email; }
		public void setEmail(String email) { this.email = email; }

		public String getPhone() { return phone; }
		public void setPhone(String phone) { this.phone = phone; }

		public String getPassword() { return password; }
		public void setPassword(String password) { this.password = password; }

		public String getAddress() { return address; }
		public void setAddress(String address) { this.address = address; }

		public String getCity() { return city; }
		public void setCity(String city) { this.city = city; }

		public String getPincode() { return pincode; }
		public void setPincode(String pincode) { this.pincode = pincode; }

		public String getRole() { return role; }
		public void setRole(String role) { this.role = role; }

		public Timestamp getCreatedDate() { return createdDate; }
		public void setCreatedDate(Timestamp createdDate) { this.createdDate = createdDate; }

		public Timestamp getLastLoginDate() { return lastLoginDate; }
		public void setLastLoginDate(Timestamp lastLoginDate) { this.lastLoginDate = lastLoginDate; }

		/* Constructor used by RegisterServlet */
		public user(String userName, String email, String phone, String password,
				String address, String city, String pincode, String role) {
			this.userName = userName;
			this.email = email;
			this.phone = phone;
			this.password = password;
			this.address = address;
			this.city = city;
			this.pincode = pincode;
			this.role = role;
		}

		/* Full constructor used by DAO fetch */
		public user(int userid, String userName, String email, String phone, String password,
				String address, String city, String pincode, String role,
				Timestamp createdDate, Timestamp lastLoginDate) {
			this.userid = userid;
			this.userName = userName;
			this.email = email;
			this.phone = phone;
			this.password = password;
			this.address = address;
			this.city = city;
			this.pincode = pincode;
			this.role = role;
			this.createdDate = createdDate;
			this.lastLoginDate = lastLoginDate;
		}
}
