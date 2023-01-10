package com.teamProject.cdcd.dto;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchOption {
	private Integer page = 1;
	private Integer pageSize = 10;
	private String keyword="";
	private ArrayList<Integer> hashtag = new ArrayList<Integer>();
	private String sort = "G";

	public SearchOption() {}

	
	public SearchOption(ArrayList<Integer> hashtag) {
		super();
		this.hashtag = hashtag;
	}



	public SearchOption(ArrayList<Integer> hashtag, String sort) {
		super();
		this.hashtag = hashtag;
		this.sort = sort;
	}



	public SearchOption(String keyword, String sort) {
		super();
		this.keyword = keyword;
		this.sort = sort;
	}



	public SearchOption(String keyword, ArrayList<Integer> hashtag, String sort) {
		super();
		this.keyword = keyword;
		this.hashtag = hashtag;
		this.sort = sort;
	}

	public SearchOption(Integer page, Integer pageSize, ArrayList<Integer> hashtag, String sort) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.hashtag = hashtag;
		this.sort = sort;
	}



	public SearchOption(Integer page, Integer pageSize, String keyword, String sort) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.keyword = keyword;
		this.sort = sort;
	}



	public SearchOption(Integer page, Integer pageSize, String keyword, ArrayList<Integer> hashtag, String sort) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.keyword = keyword;
		this.hashtag = hashtag;
		this.sort = sort;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	
	
	public ArrayList<Integer> getHashtag() {
		return hashtag;
	}

	public void setHashtag(ArrayList<Integer> hashtag) {
		this.hashtag = hashtag;
	}

	
	
	public Integer getOffset() {
		return (page-1)*pageSize;
	}
	
	public String getQueryString(Integer page) {
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.build().toString();
	}
	
	public String getQueryString() {
		return getQueryString(page);
	}


	@Override
	public String toString() {
		return "SearchOption [page=" + page + ", pageSize=" + pageSize + ", keyword=" + keyword
				+ ", hashtag=" + hashtag + ", sort=" + sort + "]";
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	


}
