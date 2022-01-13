package cn.baibaisqt.dao;

import cn.baibaisqt.domain.LicaiFamily;
import com.alibaba.druid.sql.dialect.blink.parser.BlinkStatementParser;

import java.util.List;

/**
 * @author xyh
 * @create 2022-01-13 10:50
 */
public interface LicaiFamilyDao {

    /**
     * 传入用户id 获取家庭成员列表
     * @param uid
     * @return
     */
    List<LicaiFamily> selectByUId(String uid);

}

