(function () {
    $(document).ready(function () {
//        console.log("Test");

        var rowCount,
            newRow =
            '<tr><td><input type="checkbox" name="select"></td><td><input type="radio" name="andOr" value="AND">AND &nbsp <input type="radio" name="andOr" value="OR">OR</td>'+            
            '<td><select name="id"><option value="none" selected disabled hidden>Select an ID</option><option value="id1">ID1</option><option value="id2">ID2</option></select></td>'+
            '<td><select name="condition"><option value="none" selected disabled hidden>Select a Condition</option><option value="=">=</option><option value=">">></option></select></td>'+	
            '<td><select name="value"><option value="none" selected disabled hidden>Select a Value</option><option value="value1">Value 1</option><option value="value2">Value 2</option></select></td></tr>';

        $("#addRow").click(function () {
            $("#mytable tbody").append(newRow);
        });
        
        $("#addGrp").click(function () {
            $("#mytable tbody").append(newRow);
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