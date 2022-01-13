package cn.baibaisqt.service;

import cn.baibaisqt.domain.LicaiFamily;

import java.util.List;

/**
 * @author xyh
 * @create 2022-01-13 11:00
 */
public interface LicaiFamiluService {
    List<LicaiFamily> findAllByUid(String uid);
}
