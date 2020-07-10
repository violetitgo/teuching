package com.borajoin.teuching.manager.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.borajoin.teuching.manager.model.dao.ManagerDao;
import com.borajoin.teuching.manager.model.vo.Quali;
import com.borajoin.teuching.manager.model.vo.ReviewReport;
import com.borajoin.teuching.manager.model.vo.TrainerReport;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.borajoin.teuching.message.model.vo.Match;

import common.util.File_Upload;
import common.util.Paging;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDao md;

	@Override
	public Map<String, Object> selectRevReport(int revCurrentPage) {
		Map<String, Object> res = new HashMap<String, Object>();
		Paging pagingRev = new Paging(md.revCnt(), revCurrentPage, 3);
		res.put("pagingRev", pagingRev);
		res.put("selectRevReport", md.selectRevReport(pagingRev));
		return res;
	}

	@Override
	public Map<String, Object> selectTraReport(int traCurrentPage) {
		Map<String, Object> res = new HashMap<String, Object>();
		Paging pagingTra = new Paging(md.traCnt(), traCurrentPage, 3);
		res.put("pagingTra", pagingTra);
		res.put("selectTraReport", md.selectTraReport(pagingTra));
		return res;
	}

	@Override
	public TrainerReport traManagerDetail(int traid) {
		return md.traManagerDetail(traid);
	}

	@Override
	public ReviewReport revManagerDetail(int revid) {
		return md.revManagerDetail(revid);
	}

	@Override
	public int updateManagerDetail_rev(Map<String, Object> commandMap) {
		return md.updateManagerDetail_rev(commandMap);
	}

	@Override
	public int updateManagerDetail_tra(Map<String, Object> commandMap) {
		return md.updateManagerDetail_tra(commandMap);
	}

	@Override
	public int[] insertReport(Map<String, Object> commandMap) {
		int[] res = { 0, 0 };
		if (commandMap.get("type").equals("tra")) {
			res[0] = selectTraReportIdx();
			res[1] = md.insertReportTra(commandMap);
		}
		if (commandMap.get("type").equals("rev")) {
			res[0] = selectRevReportIdx();
			res[1] = md.insertReportRev(commandMap);
		}
		return res;
	}

	@Override
	public int selectTraReportIdx() {
		return md.selectTraReportIdx();
	}

	@Override
	public int selectRevReportIdx() {
		return md.selectRevReportIdx();
	}

	@Override
	public int insertFile(List<File_Upload> fileData) {
		int res = 0;
		for (File_Upload file : fileData) {
			res = md.insertFile(file);
			MultipartFile mf = (MultipartFile) file.getObj();
			File f = new File(file.getSavepath());
			try {
				mf.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

	@Override
	public List<File_Upload> selectTraFile(int table_idx) {
		return md.selectTraFile(table_idx);
	}

	@Override
	public List<File_Upload> selectRevFile(int table_idx) {
		return md.selectRevFile(table_idx);
	}

	@Override
	public Map<String, Object> selectQuali(int currentpage) {
		Map<String, Object> res = new HashMap<String, Object>();
		Paging paging = new Paging(qualiAllCnt(), currentpage, 4);
		List<Quali> quali = md.selectQuali(paging);
		res.put("paging", paging);
		res.put("quali", quali);
		return res;
	}

	@Override
	public int qualiAllCnt() {
		return md.qualiAllCnt();
	}

	@Override
	public Quali selectQualiDetail(String qualiidx) {
		return md.selectQualiDetail(qualiidx);
	}
	
	@Override
	public String selectQualiFile(String qualiidx) {
		return md.selectQualiFile(qualiidx);
	}


	@Override
	public int updateQualiYn(int quali_idx) {
		return md.updateQualiYn(quali_idx);
	}

	@Override
	public int selectQualiIdx() {
		return md.selectQualiIdx();
	}

	@Override
	public int insertQuali(Quali quali) {
		return md.insertQuali(quali);
	}

	@Override
	public int insertQualiFile(File_Upload file_Upload) {
		File file = new File(file_Upload.getSavepath());
		MultipartFile mf = (MultipartFile) file_Upload.getObj();
		try {
			mf.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return md.insertQualiFile(file_Upload);
	}


	@Override
	public Trainer selectTrainerforQuali(String qualiidx) {
		return md.selectTrainerforQuali(qualiidx);
	}
	//트레이너 마이페이젱 표시할 리뷰신고 내역
	@Override
	public List<Quali> selectTraQualiMypage(String tr_email) {
		return md.selectTraQualiMypage(tr_email);
	}
	//트레이너 마이페이지에 표시할 자격증명 내역
	@Override
	public List<ReviewReport> selectRevReportMypage(String tr_email) {
		return md.selectRevReportMypage(tr_email);
	}

	@Override
	public List<Match> selectTraMatchMypage(String tr_email) {
		return md.selectTraMatchMypage(tr_email);
	}
	
	
	//회원의 마이페이지에 표시할 트레이너 신고내역
	@Override
	public List<TrainerReport> selectTraReportMypage(String mem_email) {
		return md.selectTraReportMypage(mem_email);
	}

	//회원의 마이페이지에 표시할 매칭 내역
	@Override
	public List<Match> selectMemMatchMypage(String mem_email) {
		return md.selectMemMatchMypage(mem_email);
	}

	@Override
	public int updateBlackYn(String tr_email) {
		return md.updateBlackYn(tr_email);
	}

	@Override
	public String selectTremailForReviewDelete(String nick_name) {
		return md.selectTremailForReviewDelete(nick_name);
	}

	@Override
	public int checkForReviewDelete(Map<String, Object> commandMap) {
		return md.checkForReviewDelete(commandMap);
	}



}
