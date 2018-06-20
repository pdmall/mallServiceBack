package com.fh.controller.lw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fh.lw.pojo.smallcoment.Store;
import com.fh.lw.service.StoreService;

public class StoreController {

	@Autowired
	private StoreService service;

	/**
	 * 根据用户id查询公司信息
	 * 
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getListStore", method = RequestMethod.GET)
	public ResponseEntity<List<Store>> getListStore(Store Store) {

		try {
			List<Store> pageInfo = this.service.getListStore(Store);

			return ResponseEntity.ok(pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 添加店铺
	 * 
	 * @param Store
	 * @return
	 */
	@RequestMapping(value = "addStore", method = RequestMethod.POST)
	public ResponseEntity<Void> addStore(Store Store) {

		try {
			this.service.addStore(Store);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据店铺id查看店铺详情
	 * 
	 * @param sId
	 * @return
	 */
	@RequestMapping(value = "getStoreDetailById", method = RequestMethod.GET)
	public ResponseEntity<Store> getStoreDetailById(@RequestParam("sId") Long sId) {

		try {
			Store Store = this.service.getStoreDetailById(sId);

			return ResponseEntity.ok(Store);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据用户id查询店铺信息
	 * 
	 * @param uId
	 * @return
	 */
	@RequestMapping(value = "getStoreDetailByuId", method = RequestMethod.GET)
	public ResponseEntity<Store> getStoreDetailByuId(@RequestParam("uId") String uId) {

		try {
			Store Store = this.service.getStoreDetailByuId(uId);

			return ResponseEntity.ok(Store);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 修改店铺信息
	 * 
	 * @param Store
	 * @return
	 */
	@RequestMapping(value = "updateStore", method = RequestMethod.POST)
	public ResponseEntity<Void> updateStore(Store Store) {
		try {
			this.service.updateStore(Store);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 删除产品(团购券/现金券)
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteStore", method = RequestMethod.POST)
	public ResponseEntity<Void> deleteStore(@RequestParam("ids") String ids) {

		try {
			this.service.deleteStore(ids);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
}
