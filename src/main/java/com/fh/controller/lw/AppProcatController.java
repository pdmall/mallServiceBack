/*package com.fh.controller.lw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fh.lw.pojo.ktjr.Activitys;
import com.fh.lw.pojo.ktjr.Citylist;
import com.fh.lw.pojo.ktjr.Guidephoto;
import com.fh.lw.pojo.ktjr.IntegralType;
import com.fh.lw.pojo.ktjr.Products;
import com.fh.lw.pojo.ktjr.Typephoto;
import com.fh.lw.pojo.ktjr.UserCase;
import com.fh.lw.pojo.ktjr.UserPlan;
import com.fh.lw.pojo.ktjr.UserTickling;
import com.fh.lw.pojo.ktjr.jineguanli;
import com.fh.lw.pojo.pdt.Shop;
import com.fh.lw.pojo.user.AppUser;
import com.fh.lw.service.ActivitysService;
import com.fh.lw.service.AppUserService;
import com.fh.lw.service.CaseService;
import com.fh.lw.service.CitylistService;
import com.fh.lw.service.GuidephotoService;
import com.fh.lw.service.IntegralTypeService;
import com.fh.lw.service.ProductsService;
import com.fh.lw.service.ShopService;
import com.fh.lw.service.TypephotoService;
import com.fh.lw.service.UserPlanService;
import com.fh.lw.service.UserTicklingService;
import com.fh.lw.service.jineguanliService;
import com.fh.lw.utils.EasyUIResult;
import com.github.pagehelper.PageInfo;

*//**
 * 1.分页查询活动列表<br>
 * 2.删除单个活动信息<br>
 * 3.批量删除活动信息<br>
 * 
 * 50.分页查询商家信信息<br>
 * 51.商家转账<br>
 * 52.分页查询转账记录<br>
 * 53.金额管理列表查询<br>
 * 54.修改金额<br>
 * 55.获取引导页图片<br>
 * 56.添加引导页图片<br>
 * 57.修改引导页图片<br>
 * 58.删除引导页图片<br>
 * 59.分页查询类型图片列表<br>
 * 60.添加类型列表<br>
 * 61.修改类型<br>
 * 62.删除类型信息<br>
 * 63.分页查询店铺入驻<br> 
 * 64.删除商家入驻信息<br>
 * 65.修改商家入驻信息<br>
 * 66.根据id查询商家入驻详情<br>
 * @author a55660000
 *
 *//*
@CrossOrigin
@Controller
@RequestMapping(value="app/user/")
public class AppProcatController {
	@Autowired
	private ActivitysService aService;//活动列表
	@Autowired
	private ProductsService pService;//产品列表
	@Autowired
	private CaseService ucService;
	
	@Autowired
	private ShopService sService;
	@Autowired
	private AppUserService service;

	@Autowired
	private CitylistService cService;
	
	@Autowired
	private jineguanliService jlService;
	@Autowired
	private GuidephotoService gService;
	@Autowired
	private TypephotoService tService;
	@Autowired
	private UserTicklingService utService;//反馈列表
	@Autowired
	private IntegralTypeService itService;//类别列表
	@Autowired
	private UserPlanService upService;
	*//**
	 * 1.分页查询活动列表
	 * 
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "getactivityslist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getactivityslist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			
			PageInfo<Activitys> pageInfo = this.aService.getactivityslist(page, rows);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 2.删除单个活动信息
	 * @param id
	 * @return
	 *//*
	@RequestMapping(value = "deleteactivity",method = RequestMethod.POST)
	public ResponseEntity<Void> deleteactivity(@RequestParam("ids")Long id){
		try {
			this.aService.deleteById(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 3.批量删除活动信息
	 * @return
	 *//*
	@RequestMapping(value = "deleteactivitys",method = RequestMethod.POST)
	public ResponseEntity<Void> deleteactivitys(@RequestParam("ids")String ids){
		try {
			this.aService.deleteByIds(ids);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 4.分页查询产品信息
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "getproductslist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getproductslist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			
			PageInfo<Products> pageInfo = this.pService.getproductslist(page, rows);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 5.添加产品信息
	 * @param p
	 * @return
	 *//*
	@RequestMapping(value = "postProducts",method = RequestMethod.POST)
	public ResponseEntity<Void> postProducts(Products p){
		try {
			this.pService.saveSelective(p);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 6.删除产品信息
	 * @return
	 *//*
	@RequestMapping(value = "deleteProducts",method = RequestMethod.POST)
	public ResponseEntity<Void> deleteProducts(@RequestParam("ids")Long id ){
		try {
			this.pService.deleteById(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 7.批量删除产品信息
	 * @return
	 *//*
	@RequestMapping(value = "deleteProductss",method = RequestMethod.POST)
	public ResponseEntity<Void> deleteProductss(@RequestParam("ids")String id ){
		try {
			this.pService.deleteByIds(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 8.修改产品信息
	 * @return
	 *//*
	@RequestMapping(value = "updatedProducts",method = RequestMethod.POST)
	public ResponseEntity<Void> updatedProducts(Products p){
		try {
			this.pService.updateSelective(p);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 9.根据id查询产品信息
	 * @return
	 *//*
	@RequestMapping(value = "getproductsByid",method = RequestMethod.GET)
	public ResponseEntity<Products> getproductsByid(@RequestParam("id")Long id){
		try {
			Products p =this.pService.queryById(id);
			return ResponseEntity.ok(p);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 10分页查询案例列表
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "getusercaselist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getusercaselist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			
			PageInfo<UserCase> pageInfo = this.ucService.getusercaselist(page, rows);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 11.删除案例信息
	 * @param id
	 * @return
	 *//*
	@RequestMapping(value = "deletecase",method = RequestMethod.POST)
	public ResponseEntity<Void> deletecase(@RequestParam("ids")Long id){
		try {
			this.ucService.deleteById(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 12.批量删除案例信息
	 * @param id
	 * @return
	 *//*
	@RequestMapping(value = "deletecases",method = RequestMethod.POST)
	public ResponseEntity<Void> deletecases(@RequestParam("ids")String id){
		try {
			this.ucService.deleteByIds(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	
	*//**
	 * 13分页查询用户列表
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "getappuserlist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getappuserlist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows,@RequestParam("keys")String keys,@RequestParam("type")Integer type) {
		try {
			String key = new String(keys.getBytes("iso8859-1"),"UTF-8");
			PageInfo<AppUser> pageInfo = this.service.getappuserlist(page, rows,type,key);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 14.修改用户工作室权限
	 * @return
	 *//*
	@RequestMapping(value = "updateappuserstar",method = RequestMethod.POST)
	public ResponseEntity<Void> updateappuserstar(@RequestParam("userid")String userid,@RequestParam("roleId")String star){
		try {
			this.service.updateappuserstar(userid,star);
			return ResponseEntity.status(HttpStatus.CREATED).body(null);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 15.删除用户
	 * @return
	 *//*
	@RequestMapping(value = "deletepricelist",method = RequestMethod.POST)
	public ResponseEntity<Void> deletepricelist(@RequestParam("ids")String ids){
		try {
			AppUser u = new AppUser();
			u.setUserId(ids);
			this.service.deleteByWhere(u);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	*//**
	 * 16.积分管理列表查询
	 * @return
	 *//*
	@RequestMapping(value = "getjineguanli",method = RequestMethod.GET)
	public ResponseEntity<List<jineguanli>> getjineguanli(){
		try {
			List<jineguanli> list = this.jlService.getjineguanli();
			return ResponseEntity.ok(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 17.修改积分
	 * @return
	 *//*
	@RequestMapping(value = "updatedjine",method = RequestMethod.POST)
	public ResponseEntity<Void> updatedjine(jineguanli j){
		try {
			this.jlService.updatedjine(j);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 18.分页获取反馈列表
	 * @param page
	 * @param rows
	 * @param keys
	 * @param type
	 * @return
	 *//*
	@RequestMapping(value = "getticklinglist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getticklinglist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			
			PageInfo<UserTickling> pageInfo = this.utService.getticklinglist(page, rows);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 19根据id查询反馈信息详情
	 * @return
	 *//*
	@RequestMapping(value = "getticklingByid",method = RequestMethod.GET)
	public ResponseEntity<UserTickling> getticklingByid(@RequestParam("id")Long id){
		try {
			UserTickling q = this.utService.queryById(id);
			return ResponseEntity.ok(q);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 20.获取类别列表
	 * @return
	 *//*
	@RequestMapping(value = "getintegraltype",method = RequestMethod.GET)
	public ResponseEntity<List<IntegralType>> getintegraltype(@RequestParam("id")Long id){
		try {
			IntegralType t = new IntegralType();
			t.setPid(id);
			List<IntegralType> q = this.itService.queryListByWhere(t);
			return ResponseEntity.ok(q);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 21.添加计划类别
	 * @return
	 *//*
	@RequestMapping(value = "postplantype",method = RequestMethod.POST)
	public ResponseEntity<Void> postplantype(IntegralType i){
		try {
			this.itService.saveSelective(i);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 22.删除类型信息
	 * @return
	 *//*
	@RequestMapping(value = "deleteplantype",method = RequestMethod.POST)
	public ResponseEntity<String> deleteplantype(@RequestParam("id")Long id){
		try {
			IntegralType i = new IntegralType();
			i.setPid(id);
			List<IntegralType> q = this.itService.queryListByWhere(i);
			if(q.size()==0) {
				this.itService.deleteById(id);
				return ResponseEntity.ok("201");
			}
			return ResponseEntity.ok("202");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 23.修改计划类型信息
	 * @return
	 *//*
	@RequestMapping(value = "updatedplantype",method = RequestMethod.POST)
	public ResponseEntity<Void> updatedplantype(IntegralType i){
		try {
			this.itService.updateSelective(i);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 24.分页查询计划列表
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "getplanlist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getplanlist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			
			PageInfo<UserPlan> pageInfo = this.upService.getplanlist(page, rows);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 25.添加计划列表
	 * @return
	 *//*
	@RequestMapping(value = "postplan",method = RequestMethod.POST)
	public ResponseEntity<Void> postplan(UserPlan u){
		try {
			this.upService.saveSelective(u);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 26.修改计划列表
	 * @return
	 *//*
	@RequestMapping(value = "updatedplan",method = RequestMethod.POST)
	public ResponseEntity<Void> updatedplan(UserPlan u){
		try {
			this.upService.updateSelective(u);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 27.删除信息
	 * @return
	 *//*
	@RequestMapping(value = "deletePlan",method = RequestMethod.POST)
	public ResponseEntity<Void> deletePlan(@RequestParam("id")Long id){
		try {
			this.upService.deleteById(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 28.批量删除信息
	 * @return
	 *//*
	@RequestMapping(value = "deletePlans",method = RequestMethod.POST)
	public ResponseEntity<Void> deletePlans(@RequestParam("ids")String id){
		try {
			this.upService.deleteByIds(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 29.根据id查询计划详情
	 * @return
	 *//*
	@RequestMapping(value = "getplanByid",method = RequestMethod.GET)
	public ResponseEntity<UserPlan> getplanByid(@RequestParam("id")Long id){
		try {
			UserPlan q = this.upService.queryById(id);
			return ResponseEntity.ok(q);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	*//**
	 * 11.添加店铺
	 * @param shop
	 * @return
	 *//*
	@RequestMapping(value = "postshop",method = RequestMethod.POST)
	public ResponseEntity<Integer> postshop(Shop shop){
		try {
			Integer l = this.sService.postshop(shop);
			if(l==1) {
				return ResponseEntity.ok(1);
			}else if(l==3) {
				return ResponseEntity.ok(3);
			}
			return ResponseEntity.ok(2);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 12.根据id查询店铺信息
	 * @param id
	 * @return
	 *//*
	@RequestMapping(value = "getshopByid",method = RequestMethod.GET)
	public ResponseEntity<Shop> getshopByid(@RequestParam("id")Long id){
		try {
			Shop s = this.sService.getshopByid(id);
			return ResponseEntity.ok(s);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 13.删除店铺信息
	 * @return
	 *//*
	@RequestMapping(value = "deleteshop",method = RequestMethod.POST)
	public ResponseEntity<Void> deleteshop(@RequestParam("id")Long id){
		try {
			this.sService.deleteshop(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 14.获取城市表
	 * @return
	 *//*
	@RequestMapping(value = "getcitylists",method = RequestMethod.GET)
	public ResponseEntity<List<Citylist>>  getcitylists(){
		try {
			List<Citylist> list = this.cService.getcitylists();
			return ResponseEntity.ok(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 15.修改店铺信息
	 * @return
	 *//*
	@RequestMapping(value = "updeleteshop",method = RequestMethod.POST)
	public ResponseEntity<Void> updeleteshop(Shop id){
		try {
			this.sService.updeleteshop(id);
			return ResponseEntity.status(HttpStatus.CREATED).build();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	
	
	*//**
	 * 50.分页查询商家信信息
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "getappuserslist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getappuserslist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows,@RequestParam("keys")String keys) {
		try {
			String phone = new String(keys.getBytes("iso8859-1"),"UTF-8");
			PageInfo<AppUser> pageInfo = this.service.getappuserslist(page, rows,phone);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	
	
	
	*//**
	 * 55.获取引导页图片
	 * @param page
	 * @param rows
	 * @param phone
	 * @return
	 *//*
	@RequestMapping(value = "getguidephotolist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getguidephotolist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			PageInfo<Guidephoto> pageInfo = this.gService.getguidephotolist(page, rows);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 56.添加引导页图片
	 * @param g
	 * @return
	 *//*
	@RequestMapping(value = "getguidephotolist",method = RequestMethod.POST)
	public ResponseEntity<Void> postguidephoto(Guidephoto g){
		try {
			this.gService.postguidephoto(g);
			return ResponseEntity.status(HttpStatus.CREATED).body(null);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 57.修改引导页图片
	 * @param g
	 * @return
	 *//*
	@RequestMapping(value = "updatedguidephoto",method = RequestMethod.POST)
	public ResponseEntity<Void> updatedguidephoto(Guidephoto g){
		try {
			this.gService.updatedguidephoto(g);
			return ResponseEntity.status(HttpStatus.CREATED).body(null);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 58.删除引导页图片
	 * @param id
	 * @return
	 *//*
	@RequestMapping(value = "deleteguidephoto",method = RequestMethod.POST)
	public ResponseEntity<Void> deleteguidephoto(@RequestParam("ids")Long id){
		try {
			this.gService.deleteguidephoto(id);
			return ResponseEntity.status(HttpStatus.CREATED).body(null);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 59.分页查询类型图片列表
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "gettypephotolist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> gettypephotolist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			PageInfo<Typephoto> pageInfo = this.tService.gettypephotolist(page, rows);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 60.添加类型列表
	 * @return
	 *//*
	@RequestMapping(value = "posttypephoto",method = RequestMethod.POST)
	public ResponseEntity<Void> posttypephoto(Typephoto t){
		try {
			this.tService.posttypephoto(t);
			return ResponseEntity.status(HttpStatus.CREATED).body(null);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 61.修改类型
	 * @param t
	 * @return
	 *//*
	@RequestMapping(value = "updatedtypephoto",method = RequestMethod.POST)
	public ResponseEntity<Void> updatedtypephoto(Typephoto t){
		try {
			this.tService.updatedtypephoto(t);
			return ResponseEntity.status(HttpStatus.CREATED).body(null);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	*//**
	 * 62.删除类型信息
	 * @param a
	 * @return
	 *//*
	@RequestMapping(value = "deletetypephoto",method = RequestMethod.POST)
	public ResponseEntity<Void> deletetypephoto(@RequestParam("ids")Long id){
		try {
			this.tService.deletetypephoto(id);
			return ResponseEntity.status(HttpStatus.CREATED).body(null);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	*//**
	 * 67.分页查询店铺列表
	 * @param page
	 * @param rows
	 * @return
	 *//*
	@RequestMapping(value = "getshoplist",method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getshoplist(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "12") Integer rows,@RequestParam("keys")String keys) {
		try {
			String phone = new String(keys.getBytes("iso8859-1"),"UTF-8");
			PageInfo<Shop> pageInfo = this.sService.getshoplist(page, rows,phone);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	
}
*/