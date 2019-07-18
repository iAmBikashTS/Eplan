<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Eplan Project By CMS</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
	<style>.c_box{ float:right; background:blue;}</style>
</head>
<body>
	<div class="container-fluid">
		<table class="table table-bordered table-hover table-striped" id="mytable">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" name="chk" value="not"> NOT (Select) </th>
					<th scope="col">AND/OR</th>
					<th scope="col">ID</th>
					<th scope="col">Condition</th>
					<th scope="col">
						<button class="btn btn-primary" id="addRow" type="button">Add Row</button>
						<button class="btn btn-warning" id="addGrp" type="button">Add Grp</button>
						<button class="btn btn-danger" id="delrow" type="button">Del Row</button>
					</th>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox" name="select"></th>
					<th scope="col">Name</th>
					<th scope="col"><select name="id">
							<option value="none" selected disabled hidden>Select an
								ID</option>
							<option value="id1">ID1</option>
							<option value="id2">ID2</option>
							<option value="id3">ID3</option>
					</select></th>
					<th scope="col"><select name="condition">
							<option value="none" selected disabled hidden>Select a
								Condition</option>
							<option value="=">=</option>
							<option value=">">></option>
							<option value="<"><</option>
					</select></th>
					<th scope="col"><select name="value">
							<option value="none" selected disabled hidden>Select a
								Value</option>
							<option value="value1">Value1</option>
							<option value="value2">Value2</option>
							<option value="value3">Value3</option>
					</select></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div class="c_box">
			<button class="btn btn-success" id="next">Next</button>
		</div>
	</div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
	<script src="./script.js"></script>
</body>
</html>
