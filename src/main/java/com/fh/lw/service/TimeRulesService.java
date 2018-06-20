package com.fh.lw.service;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.smallcoment.TimeRules;

@Service
public class TimeRulesService extends BaseService<TimeRules> {

	public boolean updateTimeRule(TimeRules timeRules) {
		TimeRules tr=new TimeRules();
		String s=timeRules.getDkStart().substring(11, 16);//打卡开始时间2017-02-18 11:00:00
		
		String d=timeRules.getDkEnd().substring(11, 16);//打卡结束时间
		String c=timeRules.getDakaClose().substring(11, 16);//参与打卡活动每天结束时间
		tr.setId(timeRules.getId());
		tr.setDkStart(s);
		tr.setDkEnd(d);
		tr.setDakaClose(c);
		super.updateSelective(tr);
		
		return true;
	}

}
