package com.borajoin.teuching.index.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.borajoin.teuching.index.model.dao.IndexDao;
import com.borajoin.teuching.member.model.vo.Trainer;

@Service
public class IndexServiceImpl implements IndexService {
	@Autowired
	IndexDao indexDao;

	@Override
	public List<Trainer> topTrainers() {
		return indexDao.topTrainers();
	}
}
