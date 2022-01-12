package cn.baibaisqt.service.impl;

import cn.baibaisqt.dao.LIcaiUserDao;
import cn.baibaisqt.dao.impl.LicaiUserDaoImpl;
import cn.baibaisqt.domain.LicaiUser;
import cn.baibaisqt.service.LicaiUserService;

/**
 * @author xyh
 * @create 2022-01-12 21:21
 */
public class LicaiUserServiceImpl  implements LicaiUserService {

    private LIcaiUserDao lIcaiUserDao = new LicaiUserDaoImpl();
    @Override
    public LicaiUser findOneByNameAndPwd(String username, String password) {
        return lIcaiUserDao.selectOneByUserNameAndPwd(username, password);
    }
}
