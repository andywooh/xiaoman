package com.andywooh.xiaoman.bean;

import java.util.Map;

import com.google.common.collect.Maps;

public class Condition<K, V> {
	private K key;
	private V value;
	Map<K, V> condition = Maps.newHashMap();
	public K getKey() {
		return key;
	}
	public void setKey(K key) {
		this.key = key;
	}
	public V getValue() {
		return value;
	}
	public void setValue(V value) {
		this.value = value;
	}
	public Map<K, V> getCondition() {
		return condition;
	}
	public void setCondition(Map<K, V> condition) {
		this.condition = condition;
	}
	
	
	
}
