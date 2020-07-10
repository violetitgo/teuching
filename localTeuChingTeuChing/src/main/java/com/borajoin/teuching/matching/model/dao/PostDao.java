package com.borajoin.teuching.matching.model.dao;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.matching.model.vo.Post;

import common.util.File_Upload;

@Repository
public class PostDao {
	@Autowired
	SqlSession sqlSession;

	public Post postDetail(Post data) {
		return sqlSession.selectOne("Matching.postDetail", data);
	}

	public List<File_Upload> getFiles(int postIdx) {
		return sqlSession.selectList("File.post_selectFile", postIdx);
	}
	
	public int insertPost(Post post) {
		return sqlSession.insert("Matching.insertPost", post);
	}
	
	public int selectAuto() {
		return sqlSession.selectOne("Matching.selectAuto");
	}
	
	public int updatePost(Post post) {
		return sqlSession.update("Matching.updatePost", post);
	}
	
	public int updateFile(int postIdx) {
		return sqlSession.update("File.post_updateFile", postIdx);
	}
	
	public int insertFile(File_Upload file) {
		return sqlSession.insert("File.post_insertFile", file);
	}
	
	public int deletePost(String postIdx) {
		return sqlSession.delete("Matching.deletePost", postIdx);
	}
}
