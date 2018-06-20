package com.fh.lw.service;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.smallcoment.RedGold;

@Service
public class RedGoldService extends BaseService<RedGold>{

	public boolean updatedRedGold(RedGold red) {
		RedGold rg=new RedGold();
		rg.setId(red.getId());
		rg.setGudingNum(red.getGudingNum());//设置固定红包的个数
		rg.setHongbaoGold(red.getHongbaoGold());//设置固定红包每个的大小
		rg.setMoneyMin(red.getMoneyMin());//设置随机分配时产生的最小红包金豆数
		super.updateSelective(rg);
		boolean flag=true;
		return flag;
	}
}
