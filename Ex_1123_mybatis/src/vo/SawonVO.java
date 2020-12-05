package vo;

public class SawonVO {
	//DB의 컬럼값과 VO의 변수명은 무조건 똑같아야한다.
	//DAO의 sqlsession이 vo에 값이 자동으로 입력하기 때문에
	//다르면 값이 들어가지 않는다.
	private int sabun;
	private String saname;
	private String sagen;
	private String sajob;
	private String sahire;
	private int deptno;
	private int samgr;
	private int sapay;
	
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public String getSaname() {
		return saname;
	}
	public void setSaname(String saname) {
		this.saname = saname;
	}
	public String getSagen() {
		return sagen;
	}
	public void setSagen(String sagen) {
		this.sagen = sagen;
	}
	public String getSajob() {
		return sajob;
	}
	public void setSajob(String sajob) {
		this.sajob = sajob;
	}
	public String getSahire() {
		return sahire;
	}
	public void setSahire(String sahire) {
		this.sahire = sahire;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public int getSamgr() {
		return samgr;
	}
	public void setSamgr(int samgr) {
		this.samgr = samgr;
	}
	public int getSapay() {
		return sapay;
	}
	public void setSapay(int sapay) {
		this.sapay = sapay;
	}
	
	
}
