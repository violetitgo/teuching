package com.borajoin.teuching.manager.model.service;

import java.util.List;
import java.util.Map;

import com.borajoin.teuching.manager.model.vo.Quali;
import com.borajoin.teuching.manager.model.vo.ReviewReport;
import com.borajoin.teuching.manager.model.vo.TrainerReport;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.message.model.vo.Match;

import common.util.File_Upload;

public interface ManagerService {

	public Map<String, Object> selectRevReport(int revCurrentPage);

	public Map<String, Object> selectTraReport(int traCurrentPage);

	public TrainerReport traManagerDetail(int traid);

	public ReviewReport revManagerDetail(int revid);

	public int updateManagerDetail_rev(Map<String, Object> commandMap);

	public int updateManagerDetail_tra(Map<String, Object> commandMap);

	public int[] insertReport(Map<String, Object> commandMap);

	public int selectTraReportIdx();

	public int selectRevReportIdx();

	public int insertFile(List<File_Upload> fileData);

	public List<File_Upload> selectTraFile(int table_idx);

	public List<File_Upload> selectRevFile(int table_idx);

	public Map<String, Object> selectQuali(int currentpage);

	public int qualiAllCnt();

	public Quali selectQualiDetail(String qualiidx);

	public String selectQualiFile(String qualiidx);

	public int updateQualiYn(int quali_idx);

	public int selectQualiIdx();

	public int insertQuali(Quali quali);

	public int insertQualiFile(File_Upload file_Upload);

	public List<TrainerReport> selectTraReportMypage(String mem_email);

	public List<Match> selectMemMatchMypage(String mem_email);

	public Trainer selectTrainerforQuali(String qualiidx);

	public List<Quali> selectTraQualiMypage(String tr_email);

	public List<ReviewReport> selectRevReportMypage(String tr_email);

	public List<Match> selectTraMatchMypage(String tr_email);
	
	public int updateBlackYn(String tr_email);
	
	public String selectTremailForReviewDelete(String nick_name);
	
	public int checkForReviewDelete(Map<String, Object> commandMap);
}
