
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.DictNode;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.system.entity.Dict;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.service.DictService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * 字典控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/dict")
public class DictController extends BasicController {

    private String PREFIX = "/modular/system/dict/";

    @Autowired
    private DictService dictService;

    @GetMapping("")
    public String index() {
        return PREFIX + "dict.html";
    }

    @GetMapping(value = "/dict_add")
    public String dictAdd() {
        return PREFIX + "dict_add.html";
    }

    @GetMapping(value = "/dict_edit")
    public String dictEdit(Long dictId, Model model) {
        model.addAttribute("dictId", dictId);
        return PREFIX + "dict_edit.html";
    }

    @GetMapping(value = "/treeSelect")
    @ResponseBody
    public List<DictNode> treeSelect() {
        DictNode root = new DictNode();
        root.setId(0L);
        root.setName("顶级菜单");
        Criteria<Dict> criteria = new Criteria<Dict>();
        criteria.add(Restrictions.isNull("parentId"));
        List<Dict> list = dictService.findList(criteria);
        root.setChildren(list);
        List<DictNode> result = new ArrayList<DictNode>();
        result.add(root);
        return result;
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String condition) {
        Criteria<Dict> criteria = new Criteria<Dict>();
        if (!StringUtils.isEmpty(condition)) {
            criteria.add(Restrictions.or(Restrictions.like("name", condition), Restrictions.like("description", condition)));
        }
        return ResponseData.list(dictService.findList(criteria));
    }

    @PostMapping(value = "/add")
    @ResponseBody
    public ResponseData add(@Valid Dict dict, Long parentId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(dict);
        if (parentId != null && parentId.equals(0L)){
            dict.setParent(null);
        } else {
            dict.setParent(dictService.getOne(parentId));
        }
        dictService.create(dict);
        return SUCCESS_TIP;
    }


    @GetMapping("/detail/{dictId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long dictId) {
        Dict dict = dictService.getOne(dictId);
        return ResponseData.success(dict);
    }

    @PostMapping(value = "/delete/{dictId}")
    @ResponseBody
    @BussinessLog(value = "删除字典记录")
    public ResponseData delete(@PathVariable Long dictId) {
        return ResponseData.success(dictService.getOne(dictId));
    }

}
