package com.borajoin.teuching.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.borajoin.teuching.manager.model.vo.Quali;
import com.borajoin.teuching.manager.model.vo.ReviewReport;
import com.borajoin.teuching.manager.model.vo.TrainerReport;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.message.model.vo.Match;

import common.util.File_Upload;
import common.util.Paging;

@Repository
public class ManagerDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<ReviewReport> selectRevReport(Paging pagingRev) {
		return sqlSession.selectList("Manager.selectRevReport", pagingRev);
	}

	public List<TrainerReport> selectTraReport(Paging pagingTra) {
		return sqlSession.selectList("Manager.selectTraReport", pagingTra);
	}

	public int revCnt() {
		return sqlSession.selectOne("Manager.revCnt");
	}

	public int traCnt() {
		return sqlSession.selectOne("Manager.traCnt");
	}

	public TrainerReport traManagerDetail(int traid) {
		return sqlSession.selectOne("Manager.traManagerDetail", traid);
	}

	public ReviewReport revManagerDetail(int revid) {
		return sqlSession.selectOne("Manager.revManagerDetail", revid);
	}

	public int updateManagerDetail_tra(Map<String, Object> commandMap) {
		return sqlSession.update("Manager.updateManagerDetail_tra", commandMap);
	}

	public int updateManagerDetail_rev(Map<String, Object> commandMap) {
		return sqlSession.update("Manager.updateManagerDetail_rev", commandMap);
	}

	public int insertReportTra(Map<String, Object> commandMap) {
		return sqlSession.insert("Manager.insertReportTra", commandMap);
	}

	public int insertReportRev(Map<String, Object> commandMap) {
		return sqlSession.insert("Manager.insertReportRev", commandMap);
	}

	public int selectTraReportIdx() {
		return sqlSession.selectOne("Manager.selectTraReportIdx");
	}

	public int selectRevReportIdx() {
		return sqlSession.selectOne("Manager.selectRevReportIdx");
	}

	public int insertFile(File_Upload file) {
		return sqlSession.insert("File.report_insertFile", file);
	}

	public List<File_Upload> selectTraFile(int table_idx) {
		return sqlSession.selectList("Manager.selectTraFile", table_idx);
	}

	public List<File_Upload> selectRevFile(int table_idx) {
		return sqlSession.selectList("Manager.selectRevFile", table_idx);
	}

	public List<Quali> selectQuali(Paging paging) {
		return sqlSession.selectList("Manager.selectQuali", paging);
	}

	public int qualiAllCnt() {
		return sqlSession.selectOne("Manager.qualiAllCnt");
	}
	
	public Quali selectQualiDetail(String qualiidx) {
		return sqlSession.selectOne("Manager.selectQualiDetail", qualiidx);
	}
	
	public String selectQualiFile (String qualiidx) {
		return sqlSession.selectOne("File.selectQualiFile", qualiidx);
	}
	
	public int updateQualiYn(int quali_idx) {
		return sqlSession.update("Manager.updateQualiYn", quali_idx);
	}
	
	public int selectQualiIdx() {
		return sqlSession.selectOne("Manager.selectQualiIdx");
	}
	
	public int insertQuali(Quali quali) {
		return sqlSession.insert("Manager.insertQuali", quali);
	}
	
	public int insertQualiFile(File_Upload file_Upload) {
		return sqlSession.insert("File.insertQualiFile", file_Upload);
	}

	public Trainer selectTrainerforQuali(String qualiidx) {
		String tr_email = sqlSession.selectOne("Manager.selectEmailForQuali", qualiidx);
		return sqlSession.selectOne("Manager.selectTrainerforQuali",tr_email);
	}
	
	public List<Quali> selectTraQualiMypage(String tr_email) {
		return sqlSession.selectList("Manager.selectTraQualiMypage", tr_email);
	}
	
	public List<ReviewReport> selectRevReportMypage(String tr_email) {
		return sqlSession.selectList("Manager.selectRevReportMypage", tr_email);
	}
	
	public List<Match> selectTraMatchMypage(String tr_email){
		return sqlSession.selectList("Manager.selectTraMatchMypage", tr_email);
	}
	
	//회원의 마이페이지에 표시할 트레이너 신고내역
	public List<TrainerReport> selectTraReportMypage(String mem_email){
		return sqlSession.selectList("Manager.selectTraReportMypage", mem_email);
	}
	
	//회원의 마이페이지에 표시할 매칭 내역
	public List<Match> selectMemMatchMypage(String mem_email){
		return sqlSession.selectList("Manager.selectMemMatchMypage", mem_email);
	}
	
	public int updateBlackYn(String tr_email) {
		return sqlSession.update("Manager.updateBlackYn", tr_email);
	}
	
	public String selectTremailForReviewDelete(String nick_name) {
		return  sqlSession.selectOne("Manager.selectTremailForReviewDelete", nick_name);
	}
	
	public int checkForReviewDelete(Map<String, Object> commandMap) {
		return sqlSession.selectOne("Manager.checkForReviewDelete", commandMap);
	}

}
