package com.cms.eplan.db;

public class XMLGenerationClass {

	private String fieldID_Name;
	private String field_ID;
	private String condition;
	private String FieldID_Value;
	private String and_OR;

	public XMLGenerationClass() {
		super();
	}

	public XMLGenerationClass(String fieldID_Name, String field_ID, String condition, String fieldID_Value,
			String and_OR) {
		super();
		this.fieldID_Name = fieldID_Name;
		this.field_ID = field_ID;
		this.condition = condition;
		FieldID_Value = fieldID_Value;
		this.and_OR = and_OR;
	}

	public String getFieldID_Name() {
		return fieldID_Name;
	}

	public void setFieldID_Name(String fieldID_Name) {
		this.fieldID_Name = fieldID_Name;
	}

	public String getField_ID() {
		return field_ID;
	}

	public void setField_ID(String field_ID) {
		this.field_ID = field_ID;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFieldID_Value() {
		return FieldID_Value;
	}

	public void setFieldID_Value(String fieldID_Value) {
		FieldID_Value = fieldID_Value;
	}

	public String getAnd_OR() {
		return and_OR;
	}

	public void setAnd_OR(String and_OR) {
		this.and_OR = and_OR;
	}

	@Override
	public String toString() {
		return "XMLGenerationClass [fieldID_Name=" + fieldID_Name + ", field_ID=" + field_ID + ", condition="
				+ condition + ", FieldID_Value=" + FieldID_Value + ", and_OR=" + and_OR + "]";
	}

}
