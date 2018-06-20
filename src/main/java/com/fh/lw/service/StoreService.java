package com.fh.lw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.lw.mapper.StoreMapper;
import com.fh.lw.pojo.smallcoment.Store;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class StoreService extends BaseService<Store> {
	@Autowired
	private StoreMapper mapper;

	public PageInfo<Store> getStoreByPage(Integer page, Integer rows) {
		return super.queryPageListByWhere(page, rows, null);
	}

	public void addStore(Store Store) {
		super.saveSelective(Store);

	}

	public void updateStore(Store Store) {
		super.updateSelective(Store);

	}

	public void deleteStore(String ids) {
		super.deleteByIds(ids);

	}

	public Store getStoreDetailById(Long sId) {

		return super.queryById(sId);
	}

	public Store getStoreDetailByuId(String uId) {
		Store Store = new Store();
		Store.setShopUserId(uId);
		return super.queryOne(Store);
	}

	public List<Store> getListStore(Store s) {
		List<Store> a;
		
		String aa = s.getShopUserId();
		
		if("1".equals(aa)) {
			a = super.queryAll();
		}else {
			a = super.queryListByWhere(s);
		}
		return a;
	}
	/**
	 * 查询商铺列表(前台接口)
	 * @return
	 */
	public List<Store> getStorelist() {
		List<Store> i = super.queryAll();
		return i;
	}
	 

	
	public PageInfo<Store> getStorelist(Integer page, Integer rows,Integer type,double mayx,double mayy) {
		PageHelper.startPage(page, rows);
		Store product = new Store();
		Example example = new Example(product.getClass());
		
		example.setOrderByClause("created DESC ");
		example.createCriteria().andEqualTo("Storeclass", type);
		List<Store> list = this.mapper.selectByExample(example);
		
		return new PageInfo<Store>(list);
	}
	
				
}









