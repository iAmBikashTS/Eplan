<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cms.eplan.db.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Eplan Project By CMS</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<style>
.c_box {
	float: right;
	background: blue;
}
</style>
</head>
<body>
	<%!XMLCreation xmlcr = new XMLCreation();
	XMLGenerationClass xmlgc = new XMLGenerationClass();
	MSdb acc = new MSdb();
	List<String> list = null;
	int i;
	List<XMLGenerationClass> listxml=new ArrayList<XMLGenerationClass>();
	%>
	<%
		String name = request.getParameter("abc");
		String id = request.getParameter("FieldId");
		String condition = request.getParameter("condition");
		xmlgc.setFieldID_Name(name);
		xmlgc.setField_ID(id);
		xmlgc.setCondition(condition);
		listxml.add(xmlgc);
		xmlcr.XMlGeneration1223(listxml);	
		list = acc.ActionConnection();
		System.out.println(list);
	%>
	<div class="container-fluid">
		<form action="Form3.jsp" method="post">
			<table class="table table-bordered table-hover table-striped"
				id="mytable">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" name="chk" value="not">
							NOT (Select)</th>
						<th scope="col">AND/OR</th>
						<th scope="col">ID</th>
						<th scope="col">Value</th>
						<th scope="col">
							<button class="btn btn-primary" id="addRow" type="button">Add
								Row</button>
							<button class="btn btn-warning" id="addGrp" type="button">Add
								Grp</button>
							<button class="btn btn-danger" id="delrow" type="button">Del
								Row</button>
						</th>
					</tr>
					<tr>
						<th scope="col"><input type="checkbox" name="select"
							id="checkbox"></th>
						<th scope="col" id="heard3"><input type="text" name="abc"
							value="<%=name%>"></th>
						<th scope="col"><input type="text" name="dba" value="<%=id%>"></th>
						<th scope="col"><select name="condition" id="condition">
								<option value="none" selected disabled hidden>Select a
									Condition</option>
								<option value="=">=</option>
								<option value=">">></option>
								<option value="<"><</option>
						</select></th>
						<th scope="col"><select name="value">
								<option value="none" selected disabled hidden>Select a
									Action</option>
								<%
									for (String str : list) {
										i++;
								%>
								<option scope="col"><%=str%></option>
								<%
									}
								%>
						</select></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="c_box">
				<button type="submit" class="btn btn-success" value="Submit">Finish</button>
			</div>
		</form>
	</div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
	<script src="./script.js"></script>
</body>
</html>
