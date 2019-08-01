package com.cms.eplan.db;

public class Attribute {
	private int id;
	private String FieldId;
	private String FieldName;
	private String FieldType;

	public Attribute() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attribute(int id, String fieldId, String fieldName, String fieldType) {
		super();
		this.id = id;
		FieldId = fieldId;
		FieldName = fieldName;
		FieldType = fieldType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFieldId() {
		return FieldId;
	}

	public void setFieldId(String fieldId) {
		FieldId = fieldId;
	}

	public String getFieldName() {
		return FieldName;
	}

	public void setFieldName(String fieldName) {
		FieldName = fieldName;
	}

	public String getFieldType() {
		return FieldType;
	}

	public void setFieldType(String fieldType) {
		FieldType = fieldType;
	}
	@Override
	public String toString() {
		return "Attribute [id=" + id + ", FieldId=" + FieldId + ", FieldName=" + FieldName + ", FieldType=" + FieldType
				+ "]";
	}
}
