package cn.baibaisqt.controller;

import cn.baibaisqt.common.Result;
import cn.baibaisqt.domain.LicaiUser;
import cn.baibaisqt.service.LicaiUserService;
import cn.baibaisqt.service.impl.LicaiUserServiceImpl;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * @author xyh
 * @create 2022-01-12 17:44
 */
@WebServlet("/login")
public class LoginServlet extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(LoginServlet.class);

    private LicaiUserService service = new LicaiUserServiceImpl();

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String captcha = request.getParameter("captcha");
        logger.info("username=====>" + username);
        logger.info("password=====>" + password);
        logger.info("captcha=====>" + captcha);
        // 判空数据
        if (StrUtil.isEmptyIfStr(username) || StrUtil.isEmptyIfStr(password) || StrUtil.isEmptyIfStr(captcha)) {
            logger.info("=====>数据值为空");
            getJson(Result.fail("请确保每一项不为空"), response);
            return;
        }
        // 校验验证码
        HttpSession session = request.getSession();
        String code = (String) session.getAttribute("code");
        if (!captcha.equalsIgnoreCase(code)) {
            logger.info("=====>验证码错误");
            getJson(Result.fail("验证码错误！"), response);
            return;
        }

        //校验数据
        LicaiUser user = service.findOneByNameAndPwd(username, SecureUtil.md5(password));

        if (user == null) {
            logger.info("=====>用户名或密码错误");
            getJson(Result.fail("用户名或密码错误！"), response);
            return;
        }

        // 成功返回数据
        logger.info("=====>登陆成功");
        // 将用户数据保存到session中
        session.setAttribute("user",user);
        logger.info("当前登录用户的uName===>"+user.getUName());
        getJson(Result.succ("登录成功!"),response);

    }

    public void logout(HttpServletRequest request ,HttpServletResponse response){
        HttpSession session = request.getSession();
        session.setAttribute("user",null);
        // 重定向到登录页面
        try {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
