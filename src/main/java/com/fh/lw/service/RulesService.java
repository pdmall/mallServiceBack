package com.fh.lw.service;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.smallcoment.Rules;

/**
 * @author yjg
 *
 */

@Service
public class RulesService extends BaseService<Rules> {

	public Rules selctDakaRuleById(Long rid) {
		
		
		Rules s=this.queryById(rid);
		
		
		return s!=null?s:null;
	}

}
