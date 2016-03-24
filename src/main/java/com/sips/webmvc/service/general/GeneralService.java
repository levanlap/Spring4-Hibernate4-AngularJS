package com.sips.webmvc.service.general;

import com.sips.webmvc.dto.general.GeneralDTO;
import com.sips.webmvc.model.general.General;

public interface GeneralService {

	GeneralDTO findSetting();

	General toEntity(GeneralDTO dto);

	GeneralDTO saveGeneral(GeneralDTO generalDto);

}
