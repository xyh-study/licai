package cn.baibaisqt.dao.impl;

import cn.baibaisqt.common.JDBCUtils;
import cn.baibaisqt.dao.LIcaiUserDao;
import cn.baibaisqt.domain.LicaiUser;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 * @author xyh
 * @create 2022-01-12 19:57
 */
public class LicaiUserDaoImpl implements LIcaiUserDao {


    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDS());

    @Override
    public LicaiUser selectOneByUserNameAndPwd(String username, String password) {

        LicaiUser user = null;
        try {
            user =   jdbcTemplate.queryForObject("select * from licai_user where u_name =? and u_password = ?",new Object[]{username,password},new BeanPropertyRowMapper<>(LicaiUser.class));
        } catch (Exception e){

        }
        return user;
    }


}



