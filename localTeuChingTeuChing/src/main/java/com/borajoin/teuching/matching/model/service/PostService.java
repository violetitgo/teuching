package com.borajoin.teuching.matching.model.service;

import java.util.List;
import java.util.Map;

import com.borajoin.teuching.matching.model.vo.Post;

import common.util.File_Upload;

public interface PostService {
	public Map<String, Object> postDetail(Post post);
	public List<File_Upload> getFiles(int postIdx);
	public int insertPost(Post post, List<File_Upload> uploads);
	public int insertFile(List<File_Upload> uploads);
	public int updatePost(Post post, List<File_Upload> uploads);
	public int deletePost(String postIdx);
}
