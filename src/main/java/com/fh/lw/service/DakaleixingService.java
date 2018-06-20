package com.fh.lw.service;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.smallcoment.Dakaleixing;

/**
 * 打卡类型金额表
 * 
 * @author 00
 *
 */
@Service
public class DakaleixingService extends BaseService<Dakaleixing> {

	/**
	 * 修改打卡类型信息
	 * 
	 * @author 00
	 *
	 */
	public boolean updateDakaLeiXing(Long xid, Integer gold, double tiCheng) {
		Dakaleixing dx = new Dakaleixing();
		dx.setId(xid);
		dx.setJine(gold);
		dx.setTi_cheng(tiCheng);
		super.updateSelective(dx);
		boolean flag = true;
		return flag;
	}

}
