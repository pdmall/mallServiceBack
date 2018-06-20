package com.fh.lw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fh.lw.mapper.WishesMapper;
import com.fh.lw.pojo.smallcoment.Wishes;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service
public class WishesService extends BaseService<Wishes> {
	@Autowired
	private WishesMapper wMapper;
	public PageInfo<Wishes> getWishByList(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		Wishes whise = new Wishes();
		Example example = new Example(whise.getClass());
		example.setOrderByClause("created DESC ");
		List<Wishes> list = this.wMapper.selectByExample(example);
		return new PageInfo<Wishes>(list);
	}
	/**
	 * 根据id查询众愿活动详情
	 * 
	 * @param did
	 * @return DakaRule
	 */
	public Wishes selctWishesById(Long did) {
		
		
		return super.queryById(did);
	}
	/**
	 * 根据ids批量删除众愿活动
	 * 
	 * @param did
	 * @return boolean
	 */
	public boolean  deletWishesByIds(String dids) {
		
		super.deleteByIds(dids);;
		
		return true;
	}
	/**
	 * 根据id删除众愿活动
	 * 
	 * @param did
	 * @return boolean
	 */
	public boolean  deletWishesById(Long did) {
		
		super.deleteById(did);;
		
		return true;
	}
	public boolean updateWishesById(Wishes wish) {
		
		super.updateSelective(wish);
		return true;
	}
	public boolean addWishes(Wishes wish) {
		if(wish!=null) {
			
			super.saveSelective(wish);
			return true;
		}
		
		return false;
	}
	
}