/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statistics.service;

import com.thinkgem.jeesite.modules.statistics.commons.DateUtil;
import com.thinkgem.jeesite.modules.statistics.dao.MostVisitedPageDao;
import com.thinkgem.jeesite.modules.statistics.dao.ReportDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.*;

/**
 * 网站概述Service
 *
 * @author 张航
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class ReportService {

    @Autowired
    ReportDao reportDao;

    public List<Map<String, String>> topTenPageByDay(String currentDate, Integer day) {
        return reportDao.topTenPageByDay(currentDate, day);
    }

    public List<Map<String, String>> reportByDayList(String currentDate, Integer day) {

        List<Map<String, String>> list = reportDao.reportByDayList();
        List<Map<String, String>> resList = new ArrayList<Map<String, String>>();
        Map<String, String> resMap = new HashMap<String, String>();

        Date nowDate = null;
        try {
            nowDate = DateUtil.parse(currentDate, "yyyy-MM-dd");
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (day == 1) {
            nowDate = DateUtil.addDay(nowDate, -1);
//            System.out.println(DateUtil.format(nowDate,"yyyy-MM-dd"));
            for (Map<String, String> item : list) {
                /*System.out.println(item.get("days"));
                System.out.println(item.get("days").equals(DateUtil.format(nowDate,"yyyy-MM-dd")));*/
                if (item.get("days").equals(DateUtil.format(nowDate,"yyyy-MM-dd"))){
                    resMap = item;
                    resList.add(resMap);
                    return resList;
                }
            }
        } else if (day == -1) {
            nowDate = DateUtil.addDay(nowDate, -2);
            for (Map<String, String> item : list) {
                if (item.get("days").equals(DateUtil.format(nowDate,"yyyy-MM-dd"))) {
                    resMap = item;
                    resList.add(resMap);
                    return resList;
                }
            }
        } else {
            for (int i = 0; i < day; i++) {
                resList.add(list.get(i));
            }
            return resList;
        }
        return resList;
    }

}