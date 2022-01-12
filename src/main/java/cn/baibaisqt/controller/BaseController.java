package cn.baibaisqt.controller;

import cn.hutool.json.JSON;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

/**
 * @author xyh
 * @create 2022-01-12 18:02
 */
abstract class BaseController  extends HttpServlet {


    public static String PROJECT_REDIRECT; //项目做重定向的根路径，避免重定向时候出现http404错误
    public static String PROJECT_FORWARD; //项目做转发的根路径，避免在转发的过程中找不到页面

    @Override
    public void init() throws ServletException { //Servlet初始化会被调用方法
        PROJECT_REDIRECT = "r:" + getServletContext().getContextPath();
        PROJECT_FORWARD = "f:";
    }

    /**
     * service包含doPost和doGet
     * 凡事POST和GET请求都会走这个方法
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8"); //解决所有子控制器的乱码问题

        //方法名称，等会利用请求去指定方法名称
        String methodName = request.getParameter("method");
        Class clazz = this.getClass(); //子类的运行时类
        try {
            if (methodName == null) {
                return; //如果方法名称的参数不存在则终止程序
            }
            Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class); //子类的方法名称
            String path = (String) method.invoke(this, request, response); //运行子类的方法名称

            //得到子控制器返回的页面地址，需要完成下面如下几个响应页面的处理
            //1.Ajax
            //2.页面跳转（重定向），页面地址定义一个以 r:/html/default/edit.html 开头前缀
            //3.转发，页面地址定义一个以 f:/html/default/edit.html 开头前缀
            if (path == null) { //Ajax技术
                return;
            }

            if ("r:".equals(path.substring(0,2))) {
                response.sendRedirect(path.substring(2)); //重定向
            } else if ("f:".equals(path.substring(0, 2))) {
                request.getRequestDispatcher(path.substring(2)).forward(request, response); //转发，可以带数据给前端页面
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 通过ajax返回json数据
     * @param object
     * @param response
     * @throws IOException
     */
    protected void getJson(Object object, HttpServletResponse response) throws IOException {
        response.setContentType("text/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        String json = JSONUtil.toJsonStr(object);
        out.write(json);
        out.flush();
        out.close();
    }

}
