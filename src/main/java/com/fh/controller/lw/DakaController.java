package com.fh.controller.lw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fh.lw.pojo.smallcoment.DakaRule;
import com.fh.lw.pojo.smallcoment.Dakaleixing;
import com.fh.lw.pojo.smallcoment.RedGold;
import com.fh.lw.pojo.smallcoment.Rules;
import com.fh.lw.pojo.smallcoment.TimeRules;
import com.fh.lw.service.DakaService;
import com.fh.lw.service.DakaleixingService;
import com.fh.lw.service.RedGoldService;
import com.fh.lw.service.RulesService;
import com.fh.lw.service.TimeRulesService;
import com.fh.lw.utils.EasyUIResult;
import com.github.pagehelper.PageInfo;

/**
 * @author YJG 早起打开后台管理
 */
@RequestMapping("hou/daka/")
@Controller
public class DakaController {
	@Autowired
	private DakaService dService;// 打卡表
	@Autowired
	private DakaleixingService dlService;// 打卡区域类型
	@Autowired
	private RulesService rulService;// 打卡规则描述
	@Autowired
	private TimeRulesService timeRuleservice;// 打卡规则描述
	@Autowired
	private RedGoldService redService;// 打卡规则描述

	/**
	 * @param 查询所有打卡用户信息
	 * 
	 */
	@RequestMapping(value = "getDakaAll", method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getDakaAll(@RequestParam("page") Integer page, @RequestParam(value = "rows", defaultValue = "20") Integer rows) {
		PageInfo<DakaRule> pa = this.dService.getDakaByPage(page, rows);
		EasyUIResult easyUIResult = new EasyUIResult(pa.getTotal(), pa.getList());
		return ResponseEntity.ok(easyUIResult);
	}

	/**
	 * @param 根据时间和状态查询打卡用户信息
	 * 
	 */
	@RequestMapping(value = "getDakaAllByDay", method = RequestMethod.POST)
	public ResponseEntity<EasyUIResult> getDakaAllByDay(@RequestParam("page") Integer page, @RequestParam(value = "rows", defaultValue = "20")Integer rows,
			@RequestParam("day") String day, @RequestParam("status") Integer status) {
		try {
			PageInfo<DakaRule> pa = this.dService.getDakaByDay(page, rows, day, status);
			if(pa==null) {
				return ResponseEntity.status(HttpStatus.ACCEPTED).body(null);
			}
			EasyUIResult easyUIResult = new EasyUIResult(pa.getTotal(), pa.getList());
			
			  return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	/**
	 * @param 根据id查询打卡用户信息详情
	 * 
	 */
	@RequestMapping(value = "selctDakaById", method = RequestMethod.GET)
	public ResponseEntity<DakaRule> selctDakaById(@RequestParam("did") Long did) {
		try {
			DakaRule da = this.dService.selctDakaById(did);
			if(da!=null) {
				return ResponseEntity.ok(da);
			}
			return ResponseEntity.status(HttpStatus.ACCEPTED).body(null);
		} catch (Exception e) {
			e.printStackTrace();

		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * @param 根据id删除打卡用户
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "deletDakaById", method = RequestMethod.POST)
	public Boolean deletDakaById(@RequestParam("id") Long id) {
		   Boolean flag=false;
		try {
			flag = this.dService.deletDakaById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	/**
	 * @param 根据id批量删除打卡用户
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "deletDakaByIds", method = RequestMethod.POST)
	public Boolean deletDakaByIds(@RequestParam("ids") String ids) {
		try {
			boolean da = this.dService.deletDakaByIds(ids);
			if (da) {
				return  da;  // 删除成功
			}
			return  false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * @param 查询打卡规则
	 * 
	 */
	@RequestMapping(value = "getRules", method = RequestMethod.GET)
	public ResponseEntity<List<Rules>> getRules() {
		try {
			List<Rules> s = this.rulService.queryAll();
			if (s != null) {
				return ResponseEntity.status(HttpStatus.CREATED).body(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * @param 查询打卡时间规则
	 * 
	 */
	@RequestMapping(value = "getTimeRules", method = RequestMethod.GET)
	public ResponseEntity<List<TimeRules>> getTimeRules() {
		try {
			List<TimeRules> s = this.timeRuleservice.queryAll();
			if (s != null) {
				return ResponseEntity.status(HttpStatus.CREATED).body(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);

}
	/**
	 * @param 根据id修改时间规则
	 * 
	 */
	@RequestMapping(value = "updateTimeRules", method = RequestMethod.POST)
	public ResponseEntity<Void> updateTimeRules(TimeRules timeRules) {
		try {
			boolean falg =this.timeRuleservice.updateTimeRule(timeRules);
			if (falg) {
				return ResponseEntity.status(HttpStatus.CREATED).build();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}
	/**
	 * @param 根据id查询规则详情
	 * 
	 */
	@RequestMapping(value = "selctDakaRuleById", method = RequestMethod.GET)
	public ResponseEntity<Rules> selctDakaRuleById(@RequestParam("rid") Long rid) {
		try {
			Rules re = this.rulService.selctDakaRuleById(rid);
			if(re!=null) {
				return ResponseEntity.ok(re);
			}
			return ResponseEntity.status(HttpStatus.ACCEPTED).body(null);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * @param 根据id修改规则详情
	 * 
	 */
	@RequestMapping(value = "updateDakaById", method = RequestMethod.POST)
	public ResponseEntity<Void> getRulesById(@RequestParam("rid") Long rid,@RequestParam("content") String  content) {
		try {
			boolean falg = this.dService.updateDakaById(rid,content);
			if (falg) {
				return ResponseEntity.status(HttpStatus.CREATED).build();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}
	/**
	 * @param 查询区域类型
	 * 
	 */
	@RequestMapping(value = "getDakaleixing", method = RequestMethod.GET)
	public ResponseEntity<List<Dakaleixing>> getDakaleixing() {
		try {
			List<Dakaleixing> s = this.dlService.queryAll();
			if (s != null) {
				return ResponseEntity.status(HttpStatus.CREATED).body(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * @param 根据id修改区域类型如：打卡金额/提成比例
	 * 
	 */
	@RequestMapping(value = "updateDakaleixing", method = RequestMethod.POST)
	public ResponseEntity<Void> updateDakaleixing(@RequestParam("xid") Long xid,@RequestParam("gold") Integer  gold,@RequestParam("tiCheng") double  tiCheng) {
		try {
			boolean falg = this.dlService.updateDakaLeiXing(xid,gold,tiCheng);
			if (falg) {
				return ResponseEntity.status(HttpStatus.CREATED).build();//修改成功
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}
	
	/**
	 * @param 查询红包说明详情
	 * 
	 */
	@RequestMapping(value = "getHongBao", method = RequestMethod.GET)
	public ResponseEntity<RedGold> getHongBao() {
		try {
			RedGold s = this.redService.queryById(1l);
			if (s != null) {
				return ResponseEntity.status(HttpStatus.CREATED).body(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * @param 根据id修改区域类型如：打卡金额/提成比例
	 * 
	 */
	@RequestMapping(value = "updateHongBao", method = RequestMethod.POST)
	public ResponseEntity<Void> updatedHongBao(RedGold redGold) {
		try {
			boolean falg = this.redService.updatedRedGold(redGold);
			if (falg) {
				return ResponseEntity.status(HttpStatus.CREATED).build();//修改成功
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}
}
