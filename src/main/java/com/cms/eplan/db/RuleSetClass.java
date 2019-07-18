package com.cms.eplan.db;

public class RuleSetClass {

	private int Id;
	private String RuleSetId;
	private String XmlRule;
	private String RuleCondition;

	public RuleSetClass() {
		super();

	}

	public RuleSetClass(int id, String ruleSetId, String xmlRule, String ruleCondition) {
		super();
		Id = id;
		RuleSetId = ruleSetId;
		XmlRule = xmlRule;
		RuleCondition = ruleCondition;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getRuleSetId() {
		return RuleSetId;
	}

	public void setRuleSetId(String ruleSetId) {
		RuleSetId = ruleSetId;
	}

	public String getXmlRule() {
		return XmlRule;
	}

	public void setXmlRule(String xmlRule) {
		XmlRule = xmlRule;
	}

	public String getRuleCondition() {
		return RuleCondition;
	}

	public void setRuleCondition(String ruleCondition) {
		RuleCondition = ruleCondition;
	}

	@Override
	public String toString() {
		return "RuleSetClass [Id=" + Id + ", RuleSetId=" + RuleSetId + ", XmlRule=" + XmlRule + ", RuleCondition="
				+ RuleCondition + "]";
	}

}
