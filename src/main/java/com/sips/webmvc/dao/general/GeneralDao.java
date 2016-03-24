package com.sips.webmvc.dao.general;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.general.General;

public interface GeneralDao extends GenericDao<General, Integer> {

	General findSetting();

	General saveGeneral(General entity);

}