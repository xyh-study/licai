package cn.baibaisqt.service;

import cn.baibaisqt.domain.LicaiUser;

/**
 * @author xyh
 * @create 2022-01-12 21:20
 */
public interface LicaiUserService {

    LicaiUser findOneByNameAndPwd(String username , String password);
}
