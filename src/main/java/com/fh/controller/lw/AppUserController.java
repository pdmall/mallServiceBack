package com.fh.controller.lw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.fh.lw.pojo.smallcoment.AppUser;
import com.fh.lw.pojo.smallcoment.MemberUser;
import com.fh.lw.service.AppUserService;
import com.fh.lw.utils.EasyUIResult;
import com.github.pagehelper.PageInfo;


public class AppUserController {
	@Autowired
	private AppUserService service;
	
	
	
	
	/**
	 * 查询所有用户
	 * @param phone
	 * @return
	 */
	@RequestMapping(value= "getAppUser",method = RequestMethod.GET)
	public ResponseEntity<List<AppUser>> getAppUser(){
		try {
			List<AppUser> user = this.service.getAppUser();
			return ResponseEntity.ok(user);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * 根据手机号查询名字
	 * @param phone
	 * @return
	 */
	@RequestMapping(value= "getnameByphone",method = RequestMethod.GET)
	public ResponseEntity<AppUser> getnameByphone(@RequestParam("phone")String phone){
		try {
			AppUser user = this.service.getnameByphone(phone);
			return ResponseEntity.ok(user);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * 根据名字查询列表
	 * @param phone
	 * @return
	 */
	@RequestMapping(value= "getphoneByname",method = RequestMethod.GET)
	public ResponseEntity<List<AppUser>> getphoneByname(@RequestParam("name")String name){
		try {
			List<AppUser> user = this.service.getphoneByname(name);
			return ResponseEntity.ok(user);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**
	 * 查询所有的会员
	 * @param phone
	 * @return
	 */
	@RequestMapping(value= "getMemberByList",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getMemberByList(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows){
		try {
			PageInfo<MemberUser> pageInfo=this.service.getMemberByList(page,rows);;
			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
}
