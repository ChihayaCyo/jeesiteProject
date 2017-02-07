/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test.entity.GeoDistribution;

/**
 * 地域分布DAO接口
 * @author 张航
 * @version 2017-01-17
 */
@MyBatisDao
public interface GeoDistributionDao extends CrudDao<GeoDistribution> {
	
}