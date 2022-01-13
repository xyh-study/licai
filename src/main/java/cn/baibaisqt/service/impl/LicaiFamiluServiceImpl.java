package cn.baibaisqt.service.impl;

import cn.baibaisqt.dao.LicaiFamilyDao;
import cn.baibaisqt.dao.impl.LicaiFamilyDaoImpl;
import cn.baibaisqt.domain.LicaiFamily;
import cn.baibaisqt.service.LicaiFamiluService;

import java.util.List;

/**
 * @author xyh
 * @create 2022-01-13 11:01
 */
public class LicaiFamiluServiceImpl implements LicaiFamiluService {
    private LicaiFamilyDao dao = new LicaiFamilyDaoImpl();

    @Override
    public List<LicaiFamily> findAllByUid(String uid) {
        return dao.selectByUId(uid);
    }
}
