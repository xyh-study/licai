package cn.baibaisqt.dao;

import cn.baibaisqt.domain.LicaiUser;

/**
 * @author xyh
 * @create 2022-01-12 19:26
 */
public interface LIcaiUserDao {

    LicaiUser selectOneByUserNameAndPwd(String username,String password);
    LicaiUser selectOneById(String id);
    void updateUserById(String id, String password , String email , String tel);

}
