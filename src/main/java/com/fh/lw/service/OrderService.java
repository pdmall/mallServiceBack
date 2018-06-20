package com.fh.lw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.lw.mapper.OrderMapper;
import com.fh.lw.pojo.smallcoment.Order;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Service
public class OrderService extends BaseService<Order>{

	@Autowired
	private OrderMapper oMapper;

	public void updateOrder(Order order) {

		this.updateOrder(order);

	}

	public void addOrder(Order order) {
		super.saveSelective(order);

	}

	public void deleteOrder(String ids) {

		super.deleteByIds(ids);
	}

	public Order getOrderDetailById(Long orderId) {

		return super.queryById(orderId);
	}

	public List<Order> getListOrderByUserId(String uId, Integer orderStatus) {
		Order order = new Order();
		order.setOrderuserid(uId);
		order.setOrderstatus(orderStatus);
		return super.queryListByWhere(order);
	}

	public PageInfo<Order> getOrderByPage(Integer page, Integer rows, Integer orderStatus) {
		// 设置分页参数
		PageHelper.startPage(page, rows);

		List<Order> list = new ArrayList<Order>();
		Order order = new Order();
		Example example = new Example(order.getClass());
		example.setOrderByClause("created DESC ");
		if (orderStatus == 100) {
			list = this.oMapper.selectByExample(example);
		} else {
			example.createCriteria().andEqualTo("orderStatus", orderStatus);
			list = this.oMapper.selectByExample(example);
		}
		return new PageInfo<Order>(list);
	}

	public List<Order> getOrderAllList() {
		Order order = new Order();
		Example example = new Example(order.getClass());
		example.setOrderByClause("created DESC ");
		return this.oMapper.selectByExample(example);
	}
	/**
	 * 根据订单编号查询信息
	 * @param orderNo
	 * @return
	 */
	public List<Order> getOrder(String orderNo) {
		Order o = new Order();
		o.setOrderno(orderNo);
		List<Order> queryListByWhere = super.queryListByWhere(o);
		return queryListByWhere;
	}
	/**
	 * 通过订单查询
	 * @param page
	 * @param rows
	 * @param orderno
	 * @return
	 */
	public PageInfo<Order> getOrderByorder(Integer page, Integer rows, String orderno) {
		PageHelper.startPage(page, rows);

		List<Order> list = new ArrayList<Order>();
		Order order = new Order();
		Example example = new Example(order.getClass());
		example.setOrderByClause("created DESC ");
		
			example.createCriteria().andEqualTo("orderNo", orderno);
			list = this.oMapper.selectByExample(example);
		
		return new PageInfo<Order>(list);
	}

}
