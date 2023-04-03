package com.yeonoo.sfow.model;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



public class CpmVO {
	private int		no;				//번호
    private String client_Code;    //거래코드
    private String client_Name;    //거래처명
    private String ceo_Name;    //대표자
    private String client_Phone;    //전화번호
    private String client_Email;    //E-mail
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
    private Date create_Date;    //등록
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
    private Date update_Date;    //수정

    public CpmVO() {}
  



	public CpmVO(int no,String client_Code, String client_Name, String ceo_Name, String client_Phone, String client_Email,
			Date create_Date, Date update_Date) {
		this.no =no;
		this.client_Code = client_Code;
		this.client_Name = client_Name;
		this.ceo_Name = ceo_Name;
		this.client_Phone = client_Phone;
		this.client_Email = client_Email;
		this.create_Date = create_Date;
		this.update_Date = update_Date;
	}

	public boolean isEmailValid() {
        // 이메일 주소 정규 표현식
        String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        Pattern pattern = Pattern.compile(emailPattern);
        Matcher matcher = pattern.matcher(client_Email);
        return matcher.matches();
    }

	
	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}


	public String getClient_Code() {
		return client_Code;
	}



	public void setClient_Code(String client_Code) {
		this.client_Code = client_Code;
	}



	public String getClient_Name() {
		return client_Name;
	}



	public void setClient_Name(String client_Name) {
		this.client_Name = client_Name;
	}



	public String getCeo_Name() {
		return ceo_Name;
	}



	public void setCeo_Name(String ceo_Name) {
		this.ceo_Name = ceo_Name;
	}



	public String getClient_Phone() {
		return client_Phone;
	}



	public void setClient_Phone(String client_Phone) {
		this.client_Phone = client_Phone;
	}



	public String getClient_Email() {
		return client_Email;
	}



	public void setClient_Email(String client_Email) {
		this.client_Email = client_Email;
	}



	public Date getCreate_Date() {
		return create_Date;
	}



	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}



	public Date getUpdate_Date() {
		return update_Date;
	}



	public void setUpdate_Date(Date update_Date) {
		this.update_Date = update_Date;
	}

	
	  
    @Override
	public String toString() {
		return "CpmVO [client_Code=" + client_Code + ", client_Name=" + client_Name + ", ceo_Name=" + ceo_Name
				+ ", client_Phone=" + client_Phone + ", client_Email=" + client_Email + ", create_Date=" + create_Date
				+ ", update_Date=" + update_Date + "]";
	}
	
   
}
