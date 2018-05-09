package com.yc.wyyyy.util;

public class PageInfo {
	private int pageNo;
	private int pageSize;
	private int totalPage;
	private int totalSize;
	public PageInfo(int pageNo, int pageSize, int totalSize) {
		super();
		this.setPageNo(pageNo);
		this.setPageSize(pageSize);
		this.setTotalSize(totalSize);
		//求总页数
		this.totalPage=totalSize%pageSize==0?totalSize/pageSize:(totalSize/pageSize)+1;
	}
	public PageInfo(){}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		if(pageNo<=0){
			pageNo=1;
		}
		this.pageNo = pageNo;
		
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize<=0){
			pageSize=5;
		}
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	@Override
	public String toString() {
		return "PageInfo [pageNo=" + pageNo + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", totalSize="
				+ totalSize + "]";
	}
	
	//上一页
	public  void getFront(){
		pageNo-=1;
		if(pageNo<=0){
			pageNo=1;
			
		}
	}
	//下一页
		public  void getNext(){
			pageNo+=1;
			if(pageNo>totalPage){
				pageNo=totalPage;
				
			}
		}
	
}
