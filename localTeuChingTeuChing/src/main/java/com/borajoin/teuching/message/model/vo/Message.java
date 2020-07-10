package com.borajoin.teuching.message.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Message {

	private int message_idx;
	private String tr_email;
	private String mem_email;
	private String msg_title;
	private String msg_cont;
	private Date write_date;
	private String writer;
	private String trainer_name;
	private String nick_name;

	public Message() {
		super();
	}

	public int getMessage_idx() {
		return message_idx;
	}

	public void setMessage_idx(int message_idx) {
		this.message_idx = message_idx;
	}

	public String getTr_email() {
		return tr_email;
	}

	public void setTr_email(String tr_email) {
		this.tr_email = tr_email;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_cont() {
		return msg_cont;
	}

	public void setMsg_cont(String msg_cont) {
		this.msg_cont = msg_cont;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTrainer_name() {
		return trainer_name;
	}

	public void setTrainer_name(String trainer_name) {
		this.trainer_name = trainer_name;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	@Override
	public String toString() {
		return "Message [message_idx=" + message_idx + ", tr_email=" + tr_email + ", mem_email=" + mem_email
				+ ", msg_title=" + msg_title + ", msg_cont=" + msg_cont + ", write_date=" + write_date + ", writer="
				+ writer + ", trainer_name=" + trainer_name + ", nick_name=" + nick_name + "]";
	}

}
