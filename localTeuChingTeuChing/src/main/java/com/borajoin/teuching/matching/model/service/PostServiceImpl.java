package com.borajoin.teuching.matching.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.borajoin.teuching.matching.model.dao.PostDao;
import com.borajoin.teuching.matching.model.vo.Post;

import common.util.File_Upload;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDao postDao;

	public Map<String, Object> postDetail(Post data) {
		Post post = postDao.postDetail(data);
		List<File_Upload> fList = getFiles(data.getPostIdx());
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("post", post);
		resMap.put("fList", fList);
		
		return resMap;
	}

	public List<File_Upload> getFiles(int postIdx) {
		return postDao.getFiles(postIdx);
	}
	
	public int insertPost(Post post, List<File_Upload> uploads) {
		int res = postDao.insertPost(post);
		int auto = postDao.selectAuto();
		for (File_Upload file_Upload : uploads) {
			file_Upload.setTable_idx(auto - 1);
		}
		insertFile(uploads);
		return res;
	}

	public int updatePost(Post post, List<File_Upload> uploads) {
		int res = postDao.updatePost(post);
		if(uploads.size() > 0) {
			updateFile(post.getPostIdx());
			insertFile(uploads);
		}
		return res;
	}
	
	public int updateFile(int postIdx) {
		return postDao.updateFile(postIdx);
	}
	
	public int insertFile(List<File_Upload> uploads) {
		int res = 0;

		for (File_Upload file : uploads) {
			res = postDao.insertFile(file);
			MultipartFile mf = (MultipartFile) file.getObj();
			File f = new File((String) file.getSavepath());
			try {
				mf.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return res;
	}

	@Override
	public int deletePost(String postIdx) {
		return postDao.deletePost(postIdx);
	}
}
