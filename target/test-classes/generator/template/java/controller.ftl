package ${basePackage}.project.web;
import ${basePackage}.core.Result;
import ${basePackage}.core.ResultGenerator;
import ${basePackage}.project.model.${modelNameUpperCamel};
import ${basePackage}.project.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;
import java.util.List;

/**
 * ${title} ${functionName}
 * Created by ${author} on ${date}.
 */
@RestController
@RequestMapping("${baseRequestMapping}")
public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    /*
     * 增加 ${functionName}
     */
    @PostMapping("/add")
    public Result add(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.insert${modelNameUpperCamel}(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    /*
    * 删除 ${functionName}
    */
    @GetMapping("/delete")
    public Result remove(@RequestParam ${pkColumn.javaType} ${pkColumn.smallColumnName}) {
        ${modelNameLowerCamel}Service.delete${modelNameUpperCamel}ById(${pkColumn.smallColumnName});
        return ResultGenerator.genSuccessResult();
    }

    /*
    * 批量删除 ${functionName}
    */
    @DeleteMapping("/{${pkColumn.smallColumnName}s}")
    public Result remove(@PathVariable ${pkColumn.javaType}[] ${pkColumn.smallColumnName}s) {
        ${modelNameLowerCamel}Service.delete${modelNameUpperCamel}ByIds(${pkColumn.smallColumnName}s);
        return ResultGenerator.genSuccessResult();
    }

    /*
    * 更新 ${functionName}
    */
    @PostMapping("/update")
    public Result edit(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update${modelNameUpperCamel}(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    /*
    * 单条数据详情 ${functionName}
    */
    @GetMapping("/detail")
    public Result detail(@RequestParam ${pkColumn.javaType} ${pkColumn.smallColumnName}) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.select${modelNameUpperCamel}ById(${pkColumn.smallColumnName});
        return ResultGenerator.genSuccessResult(${modelNameLowerCamel});
    }

    /*
    * 查询所有 ${functionName}
    */
    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size,${modelNameUpperCamel} ${modelNameLowerCamel}) {
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.select${modelNameUpperCamel}List(${modelNameLowerCamel});
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
