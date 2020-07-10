package com.borajoin.teuching.matching.model.service;

import java.util.List;
import java.util.Map;

import com.borajoin.teuching.matching.model.vo.Post;

public interface MatchingService {
	public List<Post> searchword(Map<String, String> data);
	public List<Post> keyword(Map<String, String> data);
}
