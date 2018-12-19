package com.spring.footprint.domain;

public class Search {
	private String word;
	private int count;
	
	public Search() {}

	public Search(String word, int count) {
		super();
		this.word = word;
		this.count = count;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Search [word=" + word + ", count=" + count + "]";
	}

}