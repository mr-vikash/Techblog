
<%@page import="com.tech.blog.entities.User"%>

<%@page errorPage="error_page.jsp" %>
<% 
User user = (User)session.getAttribute("currentUser");
if(user==null)
{
	response.sendRedirect("login_page.jsp");
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<!-- navbar -->

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-mortar-board"></span>&nbspCoder_Vikash</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-laptop"></span>&nbspLearn Code With Vikash<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-phone-square"></span>&nbspContact Us</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-check-square-o"></span>&nbspCategories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    
    <ul class="navbar-nav mr-right">
    
    <li class="nav-item">
        <a class="nav-link " href="#!" data-toggle="modal" data-target="#profile-modal"><span class="	fa fa-address-book fa fa-user-circle"></span><%=user.getName() %></a>
      </li>
     <li class="nav-item">
        <a class="nav-link " href="logout_servlet"><span class="	fa fa-address-book fa fa-login"></span>&nbsp Logout</a>
      </li>
    </ul>
    
  </div>
</nav>

<!-- end of navbar -->

<!-- profile modal -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <div class="container text-center"><h5 class="modal-title" id="exampleModalLabel">Techblog</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container  text-center">
               
               <img  style="height:100px; width:100px;" src="img/default.png"> 
              <h5 class="modal-title" id="exampleModalLabel"><%=user.getName() %></h5>
              
              <!-- details -->
              
              <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%=user.getId() %></td>
     
    </tr>
    <tr>
      <th scope="row">email :</th>
      <td><%=user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%=user.getGender() %></td>
      
    </tr>
    
    <tr>
      <th scope="row">Status :</th>
      <td><%=user.getAbout() %></td>
      
    </tr>
    
  </tbody>
</table>

        </div>...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>



<!--  end of profile modal -->


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
 
</body>
</html>