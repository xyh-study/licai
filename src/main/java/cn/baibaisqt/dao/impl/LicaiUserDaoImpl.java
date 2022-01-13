package cn.baibaisqt.dao.impl;

import cn.baibaisqt.common.JDBCUtils;
import cn.baibaisqt.dao.LIcaiUserDao;
import cn.baibaisqt.domain.LicaiUser;
import org.springframework.dao.DataAccessException;
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


    @Override
    public LicaiUser selectOneById(String id) {

        LicaiUser licaiUser = null;
        try {
            licaiUser = jdbcTemplate.queryForObject("select * from licai_user where id = ?", new Object[]{id}, new BeanPropertyRowMapper<>(LicaiUser.class));
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return licaiUser;

    }



    @Override
    public void updateUserById(String id, String password, String email, String tel) {
        try {
            jdbcTemplate.update("update licai_user set u_password =? , u_email = ? , u_tel = ? where id = ?" , new Object[]{password,email,tel,id});
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
    }


}



