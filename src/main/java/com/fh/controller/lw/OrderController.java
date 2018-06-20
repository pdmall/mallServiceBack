package com.fh.controller.lw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fh.lw.pojo.smallcoment.Order;
import com.fh.lw.service.OrderService;
import com.fh.lw.utils.EasyUIResult;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @author YJG
 *
 */
@RequestMapping("hou/order/")
@Controller
public class OrderController {

	@Autowired
	private OrderService service;

	/**
	 * 根据用户id查询公司信息
	 * 
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getOrderByPage", method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getOrderByPage(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "10") Integer rows,
			@RequestParam("orderStatus") Integer orderStatus) {

		try {
			PageInfo<Order> pageInfo = this.service.getOrderByPage(page, rows, orderStatus);

			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**
	 * 通过订单查询信息
	 * @param page
	 * @param rows
	 * @param orderno
	 * @return
	 */
	@RequestMapping(value = "/getOrderByorder", method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getOrderByorder(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "10") Integer rows,
			@RequestParam("orderno") String orderno) {
		
		try {
			PageInfo<Order> pageInfo = this.service.getOrderByorder(page, rows, orderno);
			
			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 添加产品
	 * 
	 * @param Order
	 * @return
	 */
	@RequestMapping(value = "addOrder", method = RequestMethod.POST)
	public ResponseEntity<Void> addOrder(Order Order) {

		try {
			this.service.addOrder(Order);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据订单id查询订单详情
	 * 
	 * @param orderId
	 * @return
	 */
	@RequestMapping(value = "getOrderDetailById", method = RequestMethod.GET)
	public ResponseEntity<Order> getOrderDetailById(@RequestParam("orderId") Long orderId) {

		try {
			Order order = this.service.getOrderDetailById(orderId);

			return ResponseEntity.ok(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 获取所有订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "getOrderAllList", method = RequestMethod.GET)
	public ResponseEntity<List<Order>> getOrderAllList() {

		try {
			List<Order> order = this.service.getOrderAllList();

			return ResponseEntity.ok(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据用户id与订单状态查询订单列表
	 * 
	 * @param uId
	 * @param orderStatus
	 * @return List<Order>
	 */
	@RequestMapping(value = "getListOrderByUserId", method = RequestMethod.GET)
	public ResponseEntity<List<Order>> getListOrderByUserId(@RequestParam("uId") String uId,
			@RequestParam("orderStatus") Integer orderStatus) {

		try {
			List<Order> order = this.service.getListOrderByUserId(uId, orderStatus);

			return ResponseEntity.ok(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 修改产品
	 * 
	 * @param Order
	 * @return
	 */
	@RequestMapping(value = "updateOrder", method = RequestMethod.POST)
	public ResponseEntity<Void> updateOrder(Order Order) {

		try {
			this.service.updateOrder(Order);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 删除产品
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteOrder", method = RequestMethod.POST)
	public ResponseEntity<Void> deleteOrder(@RequestParam("ids") String ids) {

		try {
			this.service.deleteOrder(ids);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**
	 * 根据订单编号查询信息
	 * @param orderNo
	 * @return
	 */
	@RequestMapping(value = "getOrder", method = RequestMethod.GET)
	public ResponseEntity<List<Order>> getOrder(@RequestParam("orderNo") String orderNo) {
		
		try {
			
			String types = new String(orderNo.getBytes("iso8859-1"),"UTF-8");
			List<Order> list = this.service.getOrder(types);
			
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	

} 
