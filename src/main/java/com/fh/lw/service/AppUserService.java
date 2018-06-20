package com.fh.lw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.controller.base.BaseController;
import com.fh.lw.pojo.smallcoment.AppUser;
import com.fh.lw.pojo.smallcoment.MemberUser;
import com.fh.lw.utils.RandomString;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author 00
 *
 */
@Service
public class AppUserService extends BaseService<AppUser> {

  @Autowired
  private MemberUserService mService;
	public String selectUserByUphone(String uPhone) {
		AppUser user = new AppUser();
		user.setPhone(uPhone);
		AppUser u = super.queryOne(user);
		if (u == null) {
			String authCode = RandomString.getRandomString(4);
			return authCode;
		} else {
			return "z";
		}
	}

	public AppUser loginByPhoneName(String uPhone, String uPwd) {
		AppUser user = new AppUser();
		user.setPhone(uPhone);
		user.setPassword(RandomString.md5JM(uPwd, "nihaofffff"));
		AppUser u = super.queryOne(user);
		if (u == null) {
			return null;
		} else {
			return u;
		}
	}
	/**
	 * 根据手机号查询名字
	 * @param phone
	 * @return
	 */
	public AppUser getnameByphone(String phone) {
		AppUser user = new AppUser();
		user.setPhone(phone);
		
		AppUser queryOne = super.queryOne(user);
		if(queryOne==null) {
			BaseController baseController = new BaseController();
			user.setUserId(baseController.get32UUID());
			super.saveSelective(user);
			return user;
		}else {
		return queryOne;
		}
	}
	/**
	 * 通过名字查询列表
	 * @param phone
	 * @return
	 */
	public List<AppUser> getphoneByname(String name) {
		AppUser user =new AppUser();
		user.setName(name);
		List<AppUser> queryListByWhere = super.queryListByWhere(user);
		return queryListByWhere;
	}

	public List<AppUser> getAppUser() {
		
		return super.queryAll();
	}

	public PageInfo<MemberUser> getMemberByList(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<MemberUser> list=this.mService.queryAll();
		return  new PageInfo<MemberUser>(list);
	}
}
