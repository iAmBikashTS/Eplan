<%@page import="java.util.List"%>
<%@page import="com.cms.eplan.db.*"%>

<%!MSdb msa = new MSdb();
	public List<String> list1 = null;

	List<Attribute> list2 = null;

	public String fieldName;

	int i = 1;%>
<%
	String selrwmatno = request.getParameter("prname");
	//System.out.println("selprfhfgc------------" + selrwmatno);
	String name = "gggg";

	//System.out.println("Data is Matching data" + selrwmatno);

	list2 = msa.getAllData();

	for (Attribute att : list2) {

		if (att.getFieldId().equals(selrwmatno)) {
		//	System.out.println("Data is Matching data");

			fieldName = att.getFieldName();

			list1 = msa.getAllAttributeData(selrwmatno);

			session=request.getSession();
			session.setAttribute("select",list1);

		}
	}
%>
	<th scope="col"  id="heard3"     class="FieldValue"  ><input type="text" name="abc" value="<%=fieldName%>"></th>
		<th scope="col"  class="FieldValue">
		<select name="value" id="heard3">									  
		<option value="none" selected disabled hidden     >Select a Value</option>
		<%
			for (String u : list1) {
				i++;
		%>
		<option scope="col"  ><%=u%></option>
		<%
			}
		%>
</select>
</th>

