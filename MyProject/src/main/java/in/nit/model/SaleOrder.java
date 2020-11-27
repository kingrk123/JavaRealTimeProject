package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="saletab")
public class SaleOrder {
	@Id
	@GeneratedValue
	@Column(name = "sid")
	private Integer saleId;
	@Column(name = "ordCod")
	private String ordCode;
	@Column(name = "shpCod")
	private String shipCode;
	@Column(name = "cust")
	private String customer;
	@Column(name = "refNo")
	private String refNum;
	@Column(name = "stMod")
	private String stMode;
	@Column(name = "stSource")
	private String stSource;
	@Column(name = "sStatus")
	private String status;
	@Column(name = "sDesc")
	private String saleDesc;
	public SaleOrder() {
		super();
	}
	public SaleOrder(Integer saleId) {
		super();
		this.saleId = saleId;
	}
	public Integer getSaleId() {
		return saleId;
	}
	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public String getShipCode() {
		return shipCode;
	}
	public void setShipCode(String shipCode) {
		this.shipCode = shipCode;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getRefNum() {
		return refNum;
	}
	public void setRefNum(String refNum) {
		this.refNum = refNum;
	}
	public String getStMode() {
		return stMode;
	}
	public void setStMode(String stMode) {
		this.stMode = stMode;
	}
	public String getStSource() {
		return stSource;
	}
	public void setStSource(String stSource) {
		this.stSource = stSource;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSaleDesc() {
		return saleDesc;
	}
	public void setSaleDesc(String saleDesc) {
		this.saleDesc = saleDesc;
	}
	@Override
	public String toString() {
		return "SaleOrder [saleId=" + saleId + ", ordCode=" + ordCode + ", shipCode=" + shipCode + ", customer="
				+ customer + ", refNum=" + refNum + ", stMode=" + stMode + ", stSource=" + stSource + ", status="
				+ status + ", saleDesc=" + saleDesc + "]";
	}

}
