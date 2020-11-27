
package in.nit.model;

import javax.persistence.*;

@Entity
@Table(name ="shiptab")
public class ShipmentType {
	
	public Integer getShipId() {
		return shipId;
	}

	public void setShipId(Integer shipId) {
		this.shipId = shipId;
	}

	public String getShipMode() {
		return shipMode;
	}

	public void setShipMode(String shipMode) {
		this.shipMode = shipMode;
	}

	public String getShipCode() {
		return shipCode;
	}

	public void setShipCode(String shipCode) {
		this.shipCode = shipCode;
	}

	public String getEnbShip() {
		return enbShip;
	}

	public void setEnbShip(String enbShip) {
		this.enbShip = enbShip;
	}

	public String getShipGrade() {
		return shipGrade;
	}

	public void setShipGrade(String shipGrade) {
		this.shipGrade = shipGrade;
	}

	public String getShipDesc() {
		return shipDesc;
	}

	public void setShipDesc(String shipDesc) {
		this.shipDesc = shipDesc;
	}

	@Id
	@GeneratedValue
	@Column(name = "sid")
	private Integer shipId;
	
	@Column(name = "smode")
	private String shipMode;
	
	@Column(name = "scode")
	private String shipCode;
	
	@Column(name = "shipmt")
	private String enbShip;
	
	@Column(name = "sgrade")
	private String shipGrade;
	
	@Column(name = "sdec")
	private String shipDesc;

	public ShipmentType() {
		super();
	}



	public ShipmentType(Integer shipId) {
		super();
		this.shipId = shipId;
	}

	@Override
	public String toString() {
		return "ShipmentType [shipId=" + shipId + ", shipMode=" + shipMode + ", shipCode=" + shipCode + ", enbShip="
				+ enbShip + ", shipGrade=" + shipGrade + ", shipDesc=" + shipDesc + "]";
	}


	
	
	


	}
