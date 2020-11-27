package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author:RAGHU SIR 
 *  Generated F/w:SHWR-Framework 
 */
@Entity
@Table(name = "whusertypetab")
public final class WhUserType {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	@Column(name = "usrtype")
	private String userType;
	
	@Column(name = "usrfor")
	private String userFor;
	
	@Column(name = "usremail")
	private String userMail;
	
	@Column(name = "usrcnt")
	private String userContact;
	
	@Column(name = "usridtyp")
	private String idType;
	
	@Column(name = "usrcode")
	private String userCode;
	
	@Column(name = "usrothr")
	private String ifOther;
	
	@Column(name = "uidnum")
	private String idNum;
	
	@Column(name = "usrdesc")
	private String note;
	
	public WhUserType() {
		super();
	}
	public WhUserType(Integer id) {
		super();
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserFor() {
		return userFor;
	}
	public void setUserFor(String userFor) {
		this.userFor = userFor;
	}
	
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserContact() {
		return userContact;
	}
	public void setUserContact(String userContact) {
		this.userContact = userContact;
	}
	
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getIfOther() {
		return ifOther;
	}
	public void setIfOther(String ifOther) {
		this.ifOther = ifOther;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getIdNum() {
		return idNum;
	}
	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}
	@Override
	public String toString() {
		return "WhUserType [id=" + id + ", userType=" + userType + ", userFor=" + userFor + ", userEmail=" + userMail
				+ ", userContact=" + userContact + ", idType=" + idType + ", userCode=" + userCode
				+ ", ifOther=" + ifOther + ", idNum=" + idNum + ", note=" + note + "]";
	}
	

}

