package cn.baibaisqt.dao.impl;

import cn.baibaisqt.common.JDBCUtils;
import cn.baibaisqt.dao.LicaiFamilyDao;
import cn.baibaisqt.domain.LicaiFamily;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

/**
 * @author xyh
 * @create 2022-01-13 10:52
 */
public class LicaiFamilyDaoImpl implements LicaiFamilyDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDS());

    @Override
    public List<LicaiFamily> selectByUId(String uid) {
        List<LicaiFamily> query = null;
        try {
            query = jdbcTemplate.query("select * from licai_family where u_id = ?", new Object[]{uid}, new BeanPropertyRowMapper<>(LicaiFamily.class));
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return  query;
    }
}
