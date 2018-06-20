package com.fh.lw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fh.lw.pojo.smallcoment.DakaRule;
import com.fh.lw.pojo.smallcoment.Rules;
import com.github.pagehelper.PageInfo;

@Service
public class DakaService extends BaseService<DakaRule> {
	@Autowired
	private RulesService rueservice;
	static Integer folat = 0;
	Boolean flag=false;

	/**
	 * 倒序排序
	 * 
	 * @param page
	 * @param rows
	 * @param record
	 * @return
	 */

	public PageInfo<DakaRule> getDakaByPage(Integer page, Integer rows) {
		DakaRule dak = new DakaRule();
		return super.queryPageListByWhereDesc(page, rows, dak);
	}

	/**
	 * 根据时间查询并排序
	 * 
	 * @param page
	 * @param rows
	 * @param record
	 * @return
	 */
	public PageInfo<DakaRule> getDakaByDay(Integer page, Integer rows, String day, Integer status) {
		DakaRule dak = new DakaRule();
		PageInfo<DakaRule> pa = null;
			if(status==0) {
				dak.setDkStauts(0);
				dak.setDay(day);
				pa = super.queryPageListByWhere(page, rows, dak);
				
			}else if(status==1) {
				
				dak.setDkStauts(1);
				dak.setDay(day);
				pa = super.queryPageListByWhere(page, rows, dak);
			}else if(status==2) {
				
				dak.setDkStauts(2);
				dak.setDay(day);
				pa = super.queryPageListByWhere(page, rows, dak);
			}else {
				dak.setDay(day);
				pa=super.queryPageListByWhere(page, rows, dak);
			}
		     if(pa!=null) {
					return pa;
		     }
		    return null;
	}
	/**
	 * 根据id查询打卡人员的详情
	 * 
	 * @param did
	 * @return DakaRule
	 */
	public DakaRule selctDakaById(Long did) {
		
		
		return super.queryById(did);
	}
	/**
	 * 根据ids批量删除打卡人员
	 * 
	 * @param did
	 * @return boolean
	 */
	public boolean  deletDakaByIds(String dids) {
		
		super.deleteByIds(dids);;
		
		return true;
	}
	/**
	 * 根据id删除打卡人员
	 * 
	 * @param did
	 * @return boolean
	 */
	public boolean  deletDakaById(Long did) {
		
		super.deleteById(did);;
		
		return true;
	}
	/**
	 * 根据id修改规则
	 * 
	 * @param did
	 * @return boolean
	 */
	public boolean  updateDakaById(Long id,String content) {
	
		Rules r=new Rules();
		r.setId(id);
		r.setRule(content);
		this.rueservice.updateSelective(r);
		flag=true;
		return flag;
	}

}
