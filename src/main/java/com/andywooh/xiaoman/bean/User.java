/**
 * @author wuuuxjia
 *
 */
package com.andywooh.xiaoman.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class User{
	private Integer id;
	@NotNull
	@Size(min=5, max=16)
	private String userName;
	private String passWord;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}



}