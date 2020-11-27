package in.nit.model;

import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "omtab")
public class OrderMethod {
	
	@Id
	@GeneratedValue(generator = "omidgen")
	@GenericGenerator(name = "omidgen", strategy = "increment")
	@Column(name = "omid")
	private Integer orderId;
	
	@Column(name = "ommode")
	private String orderMode;
	
	@Column(name = "omcode")
	private String orderCode;
	
	@Column(name = "omtype")
	private String orderType;
	
	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "omacpttab",joinColumns = @JoinColumn(name ="omid"))
	@OrderColumn(name = "pos")
	@Column(name = "acpt")
	private List<String> orderAcpt;
	
	@Column(name = "omdesc")
	private String orderDesc;

	public OrderMethod() {
		super();
	}

	public OrderMethod(Integer orderId) {
		super();
		this.orderId = orderId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderMode() {
		return orderMode;
	}

	public void setOrderMode(String orderMode) {
		this.orderMode = orderMode;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public List<String> getOrderAcpt() {
		return orderAcpt;
	}

	public void setOrderAcpt(List<String> orderAcpt) {
		this.orderAcpt = orderAcpt;
	}

	public String getOrderDesc() {
		return orderDesc;
	}

	public void setOrderDesc(String orderDesc) {
		this.orderDesc = orderDesc;
	}

	@Override
	public String toString() {
		return "OrderMethod [orderId=" + orderId + ", orderMode=" + orderMode + ", orderCode=" + orderCode
				+ ", orderType=" + orderType + ", orderAcpt=" + orderAcpt + ", orderDesc=" + orderDesc + "]";
	}
	
	
	
	
}
