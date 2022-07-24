<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</head>
<body>
	<!-- navbar -->


	<%@include file="normal_navbar.jsp"%>

	<main class="d-flex align-items-center primary-background p-5"
		style="padding-top: 50px; padding-bottom: 50px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-plus fa-2x"></span>
						<p>Register here</p>
						<br>
					</div>
					<div class="card-body">
						<form id="reg-form" action="reg" method="post">

							<div class="form-group">
								<label for="name">User Name:</label> <input type="text"
									class="form-control" name="user_name" id=""
									placeholder="Enter Your Name">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" name="user_email"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll ne ver share your
									email with anyone else.</small>
							</div>




							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="user_password"
									id="exampleInputPassword1" placeholder="Password">
							</div>



							<div class="form-group">
								<label for="name">Select Gender:</label><br> <input
									type="radio" id="gender" name="gender" value="male"> <label
									for="name">Male</label> <input type="radio" id="gender"
									name="gender" value="female"> <label for="name">Female</label>
							</div>



							<div class="form-group">
								<textarea name="user_about" rows="5" class="form-control"
									placeholder="Somthing About Yourserlf"></textarea>
							</div>

							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms And Conditions</label>
							</div>
							<br>				
                             <div class="container text-center" id="loader" style="display:none;">
                                   <span class="fa fa-refresh fa-spin fa-4x"></span>
                                   <h4>Please wait..</h4>
                             </div>
                             <br>
                             <br>
							<div class="container text-center"><button type="submit"  id="submit-btn" class="btn btn-primary">Submit</button></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			console.log("Loaded....")

			$('#reg-form').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);

				$('#submit-btn').hide();
				$('#loader').show();
				//send data to register servlet

				$.ajax({
					url : "Reg_Servlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {

						console.log(data)
						
						$('#submit-btn').show();
						$('#loader').hide();
						
						if(data.trim()==='done')
						{
							swal("Registered Successfully.. we are redirecting to login page")
							.then((value) => {
							  window.location="login_page.jsp"
							});

						}
						else
							{
							  swal(data);
							}
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						
						$('#submit-btn').show();
						$('#loader').hide();
						swal("Something went wrong.. Try again");
						
						
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>

</body>
</html>