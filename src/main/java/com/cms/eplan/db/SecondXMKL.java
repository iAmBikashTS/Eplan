package com.cms.eplan.db;

public class SecondXMKL {
	private String Field_name;
	private String field_id;
	private String condition;
	private String Action;

	public String getField_name() {
		return Field_name;
	}

	public void setField_name(String field_name) {
		Field_name = field_name;
	}

	public String getField_id() {
		return field_id;
	}

	public void setField_id(String field_id) {
		this.field_id = field_id;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getAction() {
		return Action;
	}

	public void setAction(String action) {
		Action = action;
	}

	public SecondXMKL(String field_name, String field_id, String condition, String action) {
		super();
		Field_name = field_name;
		this.field_id = field_id;
		this.condition = condition;
		Action = action;
	}

	public SecondXMKL() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "SecondXMKL [Field_name=" + Field_name + ", field_id=" + field_id + ", condition=" + condition
				+ ", Action=" + Action + "]";
	}

}
