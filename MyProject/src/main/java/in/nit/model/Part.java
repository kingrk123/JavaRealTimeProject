package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "parttab")
public class Part {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "pcode")
	private String partCode;
	
	@Column(name = "plen")
	private Double partLen;
	@Column(name = "pwid")
	private Double partWid;
	@Column(name = "phgt")
	private Double partHgt;
	@Column(name = "pbcost")
	private Double baseCost;
	@Column(name = "pbcurrency")
	private String baseCurrency;
	@Column(name = "pdesc")
	private String note;
	
	@ManyToOne
	@JoinColumn(name = "uomIdFk")
	private Uom uomOb;
	
	public Part() {
		super();
	}
	public Part(Integer id) {
		super();
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPartCode() {
		return partCode;
	}
	public void setPartCode(String partCode) {
		this.partCode = partCode;
	}
	public Double getPartLen() {
		return partLen;
	}
	public void setPartLen(Double partLen) {
		this.partLen = partLen;
	}
	public Double getPartWid() {
		return partWid;
	}
	public void setPartWid(Double partWid) {
		this.partWid = partWid;
	}
	public Double getPartHgt() {
		return partHgt;
	}
	public void setPartHgt(Double partHgt) {
		this.partHgt = partHgt;
	}
	public Double getBaseCost() {
		return baseCost;
	}
	public void setBaseCost(Double baseCost) {
		this.baseCost = baseCost;
	}
	public String getBaseCurrency() {
		return baseCurrency;
	}
	public void setBaseCurrency(String baseCurrency) {
		this.baseCurrency = baseCurrency;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Uom getUomOb() {
		return uomOb;
	}
	public void setUomOb(Uom uomOb) {
		this.uomOb = uomOb;
	}
	@Override
	public String toString() {
		return "Part [id=" + id + ", partCode=" + partCode + ", partLen=" + partLen + ", partWid=" + partWid
				+ ", partHgt=" + partHgt + ", baseCost=" + baseCost + ", baseCurrency=" + baseCurrency + ", note="
				+ note + ", uomOb=" + uomOb + "]";
	}
	
	
	
}
