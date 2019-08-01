<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cms.eplan.db.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Eplan Project By CMS</title>
<link rel="shortcut icon" type="image/png" href="cms.png"/>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
	<style>.c_box{ float:right; background:blue;}</style>
</head>
<body>
	<%!MSdb msdb = new MSdb();
	public List<Attribute> list;
	int i = 0;
	int j = 1;
	public List<String> list1 = null;
	List<Attribute> list2 = null;
	public String fieldName;%>
	<%
		list = msdb.getAllData();
		List<String> listq = msdb.getAllAttributeData("ID008");
	%>
	<div class="container-fluid">
		<form action="Form2.jsp" method="post">
			<table class="table table-bordered table-hover table-striped" id="mytable">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" name="chk" value="not"> NOT (Select) </th>
						<th scope="col">AND/OR</th>
						<th scope="col">ID</th>
						<th scope="col">Condition</th>
						<th scope="col">
							<button class="btn btn-primary" id="addRow" type="button">Add Row</button>
							<button class="btn btn-warning"  type="button" onclick="createTable()">Add Grp</button>
							<button class="btn btn-danger" id="delrow" type="button">Del Row</button>
						</th>
					</tr>
					<tr>
						<th scope="col"><input type="checkbox" name="select" id="checkbox"></th>
						<th scope="col" id="heard3"><input type="text" name="abc" value=""></th>
						<th scope="col"><select id="heard1" class="FieldId" name="FieldId" onchange="diplayseqDetails()">
								<option value="none" selected disabled hidden>Select an ID</option>
								<%
									for (Attribute u : list) {
										i++;
								%>
								<option value="<%=u.getFieldId()%>"><%=u.getFieldId()%></option>
								<%
									}
								%>
							</select>
							<script>
							    function diplayseqDetails() {
								var sel_prc_no = document.getElementById("heard1").value;
								//	alert(sel_prc_no);
								$.ajax({
									type : 'POST',
									url : 'NewFile.jsp',
									data : {
									prname : sel_prc_no,
									},
									success : function(response) {
									$('#heard3').html(response);
									}
								   });
							       }
						     </script>
						     <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
							<script type="text/javascript">
								$(document).ready(function() {$("select.FieldId").change(function() {
									var selectedCountry = $(
											this)
											.children("option:selected")
											.val();
									});
								});
							</script>
						</th>
						<th scope="col"><select name="condition" id="condition">
								<option value="none" selected disabled hidden>Select a
									Condition</option>
								<option value="=">=</option>
								<option value=">">></option>
								<option value="<"><</option>
							</select>
						</th>
						<th scope="col"><select name="value" id="heard3">
								<option value="none" selected disabled hidden>Select a Value</option>
								<%
									for (String u : listq) {
										i++;
								%>
								<option scope="col" id="heard4"><%=u%></option>
								<%
									}
								%>
							</select>
						</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		
	</div>
	<div class= "container-fluid">
		<table class="table table-bordered table-hover table-striped" id="dynamicTable">
		</table>
		<div class="c_box">
			<button class="btn btn-success" id="next">Next</button>
		</div>
	</div>
	</form>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
	
	
	
	<script>
	(function () {
    $(document).ready(function () {
//        console.log("Test");
        var rowCount,
            newRow =
          	
            '<tr><td><input type="checkbox" name="select"> </td><td><input type="radio" name="andOr" value="AND">AND &nbsp <input type="radio" name="andOr" value="OR">OR</td>'+            
           
            '<td><select     id="FieldId12" class="FieldId1" name="FieldId1" onchange="diplayseqDetails12345()">'+
            
            '<option value="none" selected disabled hidden>Select Id</option>'+
         <%for (Attribute u : list) {
				j++;
				i++;%>
            '<option value="name344"></option><option  name="FieldId"><%=u.getFieldId()%> </option>'+
	<%
	}
            
  String     str23=request.getParameter("FieldId12")  ;      
            System.out.println("str23     "+str23);    
	%>
			'</select></td>'					
		  
			
			<%
		    String name = request.getParameter("prnames");
			System.out.println("  " + name);
			list1 = msdb.getAllAttributeData(name);
			System.out.println("    " + list1);%>      
		  
			+ '<td><select name="condition"><option value="none" selected disabled hidden>Select a Condition</option><option value="=">=</option><option value=">">></option><option value="<"><</option>  </select></td>'                        
		   
		    +'<td><select name="value"   id="abbbbb"  name="FieldId1" ><option value="none"   selected disabled hidden>Select a Value</option>'+
		                        
   <%for (String str : list1) {
				j++;
				
	%>
	       '<option      name="FieldId"><%=str%></option>'
										+
	<%
	}
	%>
		  '</select></td></tr>';

								$("#addRow").click(function() {
									$("#mytable tbody").append(newRow);
								});

								$("#addGrp").click(function() {
									$("#mytable tbody").append(newRow);
								});

								$("#delrow")
										.click(
												function() {
													$("#mytable tbody")
															.find(
																	'input[name="select"]')
															.each(
																	function() {
																		if ($(
																				this)
																				.is(
																						":checked")) {
																			$(
																					this)
																					.parents(
																							"tr")
																					.remove();
																		}
																	});
												});

								$("#next")
										.click(
												function() {
													var formData = [];
													rowCount = document
															.querySelectorAll("#mytable tbody tr");
													var inputs = document
															.querySelectorAll("#mytable tbody tr input");

													rowCount
															.forEach(function(
																	row) {
																var data = {};
																inputs
																		.forEach(function(
																				input) {
																			data[input.name] = input.value;
																		});

																formData
																		.push(data);
															});
													console.log(formData);
													$.post('/', {
														data : formData
													});
												});
							                 });
		                             })();
	                         </script>
	              <script>
	                  var idnum = 1;
		              function diplayseqDetails12345() {
			                       idnum++;
			                  var sel_prc_no11 = document.getElementById("FieldId12").value;
				              alert(sel_prc_no11);
			                  $.ajax({
				              type : 'POST',
				              url : 'Common.jsp',
				              data : {
					          prnames333 : sel_prc_no11,  
				              },
				              success : function(response) {
					          $('#abbbbb').html(response);
				               }
			                  });
		                      }
	                  </script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	               <script type="text/javascript">
		               $(document).ready(
				       function() {
					   $("select.FieldId1").change(
					   function() {
					   var selectedCountry = $(this).children(
						"option:selected").val();
							});
				         });
	</script>
	
	
	
	
	
	
	<script type="text/javascript">
	function createTable() {
	//$("#dynamicTable").append("<br/>");
	$("#dynamicTable").append("<table class='table table-bordered table-hover table-striped'id= 'mytable2'");
	
    $("#dynamicTable").append("<thead>");
    $("#dynamicTable").append("<tr>");
    $("#dynamicTable").append("<th scope="+'col'+"><input type='checkbox' name='select'>"+" NOT (Select)</th>");
    $("#dynamicTable").append("<th scope="+"col"+">AND/OR</th>");
    $("#dynamicTable").append("<th scope="+"col"+">ID</th>");
    $("#dynamicTable").append("<th scope="+"col"+">Condition</th>");
    $("#dynamicTable").append("<th scope="+'col'+"><button class='btn btn-primary' id='addRow2' type='button'>Add Row</button> <button class='btn btn-danger' id='delrow' type='button'>Del Row</button></th>");
    $("#dynamicTable").append("</tr>");
    $("#dynamicTable").append("</thead>");
    
    $("#dynamicTable").append("<tbody>");

    $("#dynamicTable").append("<tr>");
    $("#dynamicTable").append("<td><input type='checkbox' name='chkbox2'></td>");
    $("#dynamicTable").append("<td><input type='radio' name='andOr' value='AND'>AND &nbsp <input type='radio' name='andOr' value='OR'>OR</td>");
    $("#dynamicTable").append("<td><select name='id' id='heard3'> <option value='none' selected disabled hidden>Select an Id</option> </select> </td>");
    $("#dynamicTable").append("<td> <select name='condition' id='condition'> <option value='none' selected disabled hidden>Select a Condition</option>"+
    		"<option value='='>=</option>"+"<option value='>'>></option><option value='<'><</option></select></td>");
    $("#dynamicTable").append("<td><select name='value' id='heard3'> <option value='none' selected disabled hidden>Select a Value</option> </select> </td>");
    $("#dynamicTable").append("</tr>");

    $("#dynamicTable").append("</tbody>");
    
    $("#dynamicTable").append("</table>");
    //$("#dynamicTable").append("<br/>");

    $('#dynamicTable table').addClass("dynamicTable");
    $('#dynamicTable table thead').addClass("dynamicTableTh");
    $('#dynamicTable table tbody td').addClass("dynamicTableTd");
}
	
	</script>
	
	
	
	
	
	
	
	
	</script>
</body>
</html>