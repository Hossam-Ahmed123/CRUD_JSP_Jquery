<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">


</head>
<body>

	<nav class="navbar navbar-dark bg-primary">
		<h3 style="color: white;">Product management system</h3>

	</nav>
	</br>
	<!--Category Description Price Quantity Rate-->
	<div class="row">

		<div class="col-sm-4">
			<div class="container">
				<form id="productform" name="productform">


					<div class="form-group">
						<label>Product name</label> <input type="text"
							class="form-control" name="pname" id="pname"
							placeholder="Product name" size="30px" required>
					</div>
					<div class="form-group">
						<label>Category</label> <input type="text" class="form-control"
							name="category" id="category" placeholder="Category" size="30px">
					</div>

					<div class="form-group">
						<label>Description</label> <input type="text" class="form-control"
							name="description" id="description" placeholder="Description"
							size="30px">
					</div>

					<div class="form-group">
						<label>Price</label> <input type="text" name="price"
							class="form-control" id="price" placeholder="Price" size="30px">
					</div>
					<div class="form-group">
						<label>Quantity</label> <input type="text" class="form-control"
							name="quantity" id="quantity" placeholder="Quantity" size="30px">
					</div>
					<div class="form-group">
						<label>Rate</label> <input type="text" name="rate"
							class="form-control" id="rate" placeholder="Rate" size="30px">
					</div>
					<div class="form-group" align="right">
						<button type="button" class="btn btn-info" id="save"
							onclick="addproduct()">Save</button>

						 
					</div>



				</form>



			</div>


		</div>
		<div class="col-sm-8">

			<!--Category Description Price Quantity Rate-->
			<div class="panel-body">

				<table id="tbl-product" class="table table-bordered">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>

					</thead>
				</table>
			</div>
		</div>
	</div>
	<script src="component/jquery/jquery.js" type="text/javascript"></script>
	<script src="component/jquery/jquery.min.js" type="text/javascript"></script>

	<script src="component/jquery.validate.min.js" type="text/javascript"></script>

	<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"
		type="text/javascript"></script>



	<script>
		getall();
		var isNew = true;
		var productId = null;
		function addproduct() {
			if ($("#productform").valid()) {

				var url = "";
				var data = "";
				var method;
				if (isNew == true) {

					url = 'add.jsp';
					console.log(url);
					data = $("#productform").serialize();
					method = 'POST';
				} else {
					url = 'update.jsp';
					console.log(url);
					data = $("#productform").serialize() + "&productId="
							+ productId;
					method = 'POST';

				}

				$.ajax({
					type : method,
					url : url,
					dataType : 'JSON',
					data : data,
					success : function(data) {
						if (isNew == true) {
							getall();
							alert("reccorded new product");
						} else {
							getall();
							alert("product updated");

						}
					}

				});
			}

		}

		function getall() {

			$("#tbl-product").dataTable().fnDestroy();
			$
					.ajax({
						url : "allProducts.jsp",
						type : "GET",
						dataType : 'JSON',
						success : function(data) {

							$("#tbl-product")
									.dataTable(
											{
												"aaData" : data,
												"scrollX" : true,
												"aoColumns" : [
														{
															"sTitle" : "Product Id",
															"mData" : "id"
														},
														{
															"sTitle" : "Product Name",
															"mData" : "name"
														},
														{
															"sTitle" : "Category",
															"mData" : "category"
														},
														{
															"sTitle" : "Description",
															"mData" : "description"
														},
														{
															"sTitle" : "price",
															"mData" : "price"
														},
														{
															"sTitle" : "Quantity",
															"mData" : "quan"
														},
														{
															"sTitle" : "Rate",
															"mData" : "rate"
														},
														{
															"sTitle" : "Edit",
															mData : "id",
															"render" : function(
																	mData,
																	type, row,
																	meta) {

																return '<button class="btn btn-success" onclick="get_details('
																		+ mData
																		+ ')">Edit</button>';
															}

														},
														{
															"sTitle" : "Delete",
															"mData" : "id",
															"render" : function(
																	mData,
																	type, row,
																	meta) {

																return '<button class="btn btn-danger"  onclick="getdelete('
																		+ mData
																		+ ')">Delete</button> ';
															}

														}, ]

											});
						}

					});
		}

		function get_details(id) {

			$.ajax({
				type : "POST",
				url : "edit_return.jsp",
				data : {
					"id" : id
				},

				success : function(data) {
					console.log(data);
					console.log(JSON.stringify(data));
					isNew = false
					var obj = JSON.parse(data);
					productId = obj[0].id
					$('#pname').val(obj[0].name);
					$('#category').val(obj[0].category);
					$('#description').val(obj[0].description);
					$('#price').val(obj[0].price);
					$('#quantity').val(obj[0].quan);
					$('#rate').val(obj[0].rate);

				}
			});

		}

		function getdelete(id) {

			$.ajax({
				type : "POST",
				url : "delete.jsp",
				data : {
					"id" : id
				},

				success : function(data) {
					getall();
					alert("product deleted");

				}
			});

		}
	</script>



















</body>
</html>