
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.DictNode;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.system.entity.Dict;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.service.DictService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import io.swagger.annotations.Api;
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
@Api(tags = "字典管理", description = "字典管理")
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
            criteria.add(Restrictions.or(Restrictions.like("name", condition), Restrictions.like("code", condition), Restrictions.like("description", condition)));
        }
        return ResponseData.list(dictService.findList(criteria));
    }

    @PostMapping(value = "/add")
    @ResponseBody
    public ResponseData add(@Valid Dict dict, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(dict);
        if (dict.getParentId() != null && dict.getParentId().equals(0L)){
            dict.setParentId(null);
            dict.setParentName(null);
        }
        dictService.create(dict);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/edit")
    @ResponseBody
    public ResponseData edit(@Valid Dict dict, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Dict dbdict = dictService.getOne(dict.getId());
        update(dbdict);
        if (dict.getParentId() != null && dict.getParentId().equals(0L)){
            dbdict.setParentId(null);
            dbdict.setParentName(null);
        } else {
            dbdict.setParentId(dict.getParentId());
            dbdict.setParentName(dict.getParentName());
        }
        dbdict.setCode(dict.getCode());
        dbdict.setName(dict.getName());
        dbdict.setDescription(dict.getDescription());
        dbdict.setSort(dict.getSort());
        dictService.update(dbdict);
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
        dictService.delete(dictId);
        return SUCCESS_TIP;
    }

}
