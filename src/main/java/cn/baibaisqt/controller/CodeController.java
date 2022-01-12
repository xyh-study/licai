package cn.baibaisqt.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author xyh
 * @create 2022-01-12 17:46
 * 获取验证码
 */
@WebServlet("/getCode")
public class CodeController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 使用HuTool 生成验证码
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(116, 38, 4, 10);
        // 生成的验证码放入 session
        HttpSession session = req.getSession();
        session.setAttribute("code", lineCaptcha.getCode());
        // 将生成的图片返回回去
        ServletOutputStream outputStream = resp.getOutputStream();
        lineCaptcha.write(outputStream);
        outputStream.close();
    }
}
