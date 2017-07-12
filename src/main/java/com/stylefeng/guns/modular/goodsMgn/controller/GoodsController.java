package com.stylefeng.guns.modular.goodsMgn.controller;

import com.stylefeng.guns.common.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 商品管理控制器
 *
 * @author fengshuonan
 * @Date 2017-07-12 12:22:52
 */
@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {

    private String PREFIX = "/goodsMgn/goods/";

    /**
     * 跳转到商品管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "goods.html";
    }

    /**
     * 跳转到添加商品管理
     */
    @RequestMapping("/goods_add")
    public String goodsAdd() {
        return PREFIX + "goods_add.html";
    }

    /**
     * 跳转到修改商品管理
     */
    @RequestMapping("/goods_update/{goodsId}")
    public String goodsUpdate(@PathVariable Integer goodsId, Model model) {
        return PREFIX + "goods_edit.html";
    }

    /**
     * 获取商品管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return null;
    }

    /**
     * 新增商品管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add() {
        return super.SUCCESS_TIP;
    }

    /**
     * 删除商品管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete() {
        return SUCCESS_TIP;
    }


    /**
     * 修改商品管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update() {
        return super.SUCCESS_TIP;
    }

    /**
     * 商品管理详情
     */
    @RequestMapping(value = "/detail")
    @ResponseBody
    public Object detail() {
        return null;
    }
}
