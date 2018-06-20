package com.fh.controller.lw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fh.lw.pojo.smallcoment.Wishes;
import com.fh.lw.service.WishesService;
import com.fh.lw.utils.EasyUIResult;
import com.github.pagehelper.PageInfo;

/**
 * @author YJG 众愿活动后台
 */

@Controller
@RequestMapping("/hou/wishes")
public class WishesController {
	@Autowired
	private WishesService wService;

	/**
	 * 查询众愿list
	 * 
	 * @param phone
	 * @return
	 */
	@RequestMapping(value = "getWishByList", method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getWishByList(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "30") Integer rows) {
		try {
			PageInfo<Wishes> pageInfo = this.wService.getWishByList(page, rows);
			;
			EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
			return ResponseEntity.ok(easyUIResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * @param 根据id查询众愿图片详情
	 * 
	 */
	@RequestMapping(value = "selctWishesById", method = RequestMethod.GET)
	public ResponseEntity<Wishes> selctWishesById(@RequestParam("did") Long did) {
		try {
			Wishes da = this.wService.selctWishesById(did);
			if (da != null) {
				return ResponseEntity.ok(da);
			}
			return ResponseEntity.status(HttpStatus.ACCEPTED).body(null);
		} catch (Exception e) {
			e.printStackTrace();

		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * @param 根据id修改众愿活动
	 * 
	 */
	@RequestMapping(value = "updateWishesById", method = RequestMethod.POST)
	public ResponseEntity<Void> updateWishesById(Wishes wish) {
		try {
			boolean falg = this.wService.updateWishesById(wish);
			if (falg) {
				return ResponseEntity.status(HttpStatus.CREATED).build();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	/**
	 * @param 根据id删除众愿消息
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "deletWishesByIds", method = RequestMethod.POST)
	public Boolean deletWishesByIds(@RequestParam("id") Long id) {
		Boolean flag = false;
		try {
			flag = this.wService.deletWishesById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * @param 根据id批量删除众愿消息
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "deletWishesByIds", method = RequestMethod.POST)
	public Boolean deletWishesByIds(@RequestParam("ids") String ids) {
		try {
			boolean da = this.wService.deletWishesByIds(ids);
			if (da) {
				return da; // 删除成功
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	/**
	 * @param 添加众愿活动消息表
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "addWishes", method = RequestMethod.POST)
	public Boolean addWishes(Wishes wish) {
		try {
			boolean da = this.wService.addWishes(wish);
			if (da) {
				return da; //添加成功
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
