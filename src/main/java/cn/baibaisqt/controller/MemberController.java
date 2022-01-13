package cn.baibaisqt.controller;

import cn.baibaisqt.common.Result;
import cn.baibaisqt.common.TableResult;
import cn.baibaisqt.dao.LicaiFamilyDao;
import cn.baibaisqt.domain.LicaiFamily;
import cn.baibaisqt.domain.LicaiUser;
import cn.baibaisqt.service.LicaiFamiluService;
import cn.baibaisqt.service.LicaiUserService;
import cn.baibaisqt.service.impl.LicaiFamiluServiceImpl;
import cn.baibaisqt.service.impl.LicaiUserServiceImpl;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.json.JSONUtil;
import com.sun.org.apache.regexp.internal.RE;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author xyh
 * @create 2022-01-13 9:36
 */
@WebServlet("/system/member")
public class MemberController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(MemberController.class);

    private LicaiUserService service = new LicaiUserServiceImpl();
    private LicaiFamiluService familuService = new LicaiFamiluServiceImpl();


    public void memberInfo(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        logger.info("=====>当前登录用户id " + id);
        LicaiUser user = service.findOneById(id);
        // 将javabean 转成 map
        Map<String, Object> map = BeanUtil.beanToMap(user);
        List<Map> list = new ArrayList<>();
        list.add(map);
        // 使用tableResult 对表格数据进行封装
        TableResult<Object> tableResult = new TableResult(0, "ok", list.size(), list);
        try {
            getJson(tableResult, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void editAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");

        logger.info("====>修改参数id  " + id);
        logger.info("====>修改参数username  " + username);
        logger.info("====>pass  " + pass);
        logger.info("====>修改参数repass  " + repass);
        logger.info("====>修改参数email  " + email);
        logger.info("====>修改参数tel  " + tel);
        // 判空
        if (StrUtil.isEmptyIfStr(id) || StrUtil.isEmptyIfStr(username) || StrUtil.isEmptyIfStr(repass) || StrUtil.isEmptyIfStr(pass) || StrUtil.isEmptyIfStr(email) || StrUtil.isEmptyIfStr(tel)) {
            logger.info("====>参数值为空");
            getJson(Result.fail("参数值为空"), response);
            return;
        }

        // 密码校验
        if (!pass.equals(repass)) {
            logger.info("====>两次输入的密码不一致");
            getJson(Result.fail("两次输入的密码不一致"), response);
            return;
        }

        // 密码加密
        String password = SecureUtil.md5(pass);
        service.modifyOneById(id, password, email, tel);

        getJson(Result.succ("修改成功"), response);


    }

    public void familyInfo(HttpServletRequest request, HttpServletResponse response) {
        String uid = request.getParameter("id");
        // 对LicaiFamily 的增删改查
        List<LicaiFamily> licaiFamilies = familuService.findAllByUid(uid);
        // 将集合中的对象 转成map
        List<Map> resultMap = new ArrayList<>();
        for (LicaiFamily licaiFamily:licaiFamilies) {
                resultMap.add(BeanUtil.beanToMap(licaiFamily));
        }
        // 返回数据
        TableResult result = new TableResult(0,"ok", resultMap.size(),resultMap);
        try {
            getJson(result,response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
