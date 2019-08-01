(function () {
    $(document).ready(function () {

        var rowCount,
            newRow =
            '<tr><td><input type="checkbox" name="select"></td><td><input type="radio" name="andOr" value="AND">AND &nbsp <input type="radio" name="andOr" value="OR">OR</td>'+            
            '<td><select name="id"><option value="none" selected disabled hidden>Select an ID</option><option value="id1">ID1</option><option value="id2">ID2</option></select></td>'+
            '<td><select name="condition"><option value="none" selected disabled hidden>Select a Condition</option><option value="=">=</option><option value=">">></option></select></td>'+	
            '<td><select name="value"><option value="none" selected disabled hidden>Select a Value</option><option value="value1">Value 1</option><option value="value2">Value 2</option></select></td></tr>';

        
        $("#addGrp").click(function () {
            var table = $('<table></table>').addClass('mytable');
          for (var i = 0; i < 10; i++) {
                  row = $('<tr></tr>');
                  for (var j = 0; j < 10; j++) {
                      var rowData = $('<td></td>').addClass('bar').text('result ' + j);
                      row.append(rowData);
                  }
                  table.append(row);
              }

          if ($('table').length) {
               $("#someContainer tr:first").after(row);
          }
          else {
              $('#someContainer').append(table);
          }
      });
        
        
        $("#addRow").click(function () {
            $("#mytable tbody").append(newRow);
        });
        
        $("#addRow2").click(function () {
            $("#dynamicTable tbody").append(newRow);
        });
        
        $("#delrow").click(function(){
            $("#mytable tbody").find('input[name="select"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });   

        $("#next").click(function () {
            var formData = [];
            rowCount = document.querySelectorAll("#mytable tbody tr");
            var inputs = document.querySelectorAll("#mytable tbody tr input");

            rowCount.forEach(function (row) {
                var data = {};
                inputs.forEach(function (input) {
                    data[input.name] = input.value;
                });

                formData.push(data);
            });

            console.log(formData);

            $.post('/', {data: formData});
        });
    });
})();


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
    $("#dynamicTable").append("<td>what</td>");
    $("#dynamicTable").append("<td>now</td>");
    $("#dynamicTable").append("<td>cow</td>");
    $("#dynamicTable").append("<td>bach</td>");
    $("#dynamicTable").append("<td>v</td>");
    $("#dynamicTable").append("</tr>");

    $("#dynamicTable").append("</tbody>");
    
    $("#dynamicTable").append("</table>");
    //$("#dynamicTable").append("<br/>");

    $('#dynamicTable table').addClass("dynamicTable");
    $('#dynamicTable table thead').addClass("dynamicTableTh");
    $('#dynamicTable table tbody td').addClass("dynamicTableTd");
}