package cn.baibaisqt.service;

import cn.baibaisqt.domain.LicaiUser;

/**
 * @author xyh
 * @create 2022-01-12 21:20
 */
public interface LicaiUserService {

    LicaiUser findOneByNameAndPwd(String username , String password);
    LicaiUser findOneById(String id);
    void modifyOneById(String id ,String password,String email ,String tel);
}
