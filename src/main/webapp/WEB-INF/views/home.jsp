<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Movies Online</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="../../css/home.css">
  <script src="../../js/home.js"></script>

</head>
<body>
   <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-dark">
     <a class="navbar-brand" href="/">Online Movie</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
       <ul class=" mr-auto nav nav-pills">
         <li class="nav-item">
           <a class="nav-link" href="/country">Country</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="/movie">Movie</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="/genre">Genre</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="/releaseYear">Release Year</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="/serial">Serial</a>
         </li>
           <li>
             <a class="nav-link" href="/user">Users</a>
           </li>
         <li class="nav-item">
           <button id="logIn" class="btn btn-secondary btn-sm" type="button">Log In</button>
         </li>
       </ul>
       <form class="form-inline my-2 my-lg-0">
         <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
         <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
       </form>
     </div>
   </nav>

   <div id="registration-form" class="container hidden">
     <div class="container">
       <div id="loginbox" class="mainbox col-md-5 col-md-offset-4 col-sm-7 col-sm-offset-3">
         <div class="panel panel-primary" >
           <div class="panel-heading">
             <div class="panel-title text-center"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</div>
             <div class="forgotPassword"><a href="#">Forgot password?</a></div>
           </div>

           <div class="panel-body" >

             <div id="login-alert" class="alert alert-danger col-sm-12"></div>

             <form id="loginform" class="form-horizontal" role="form">

               <div class="input-group col-sm-offset-3 col-sm-7">
                 <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                 <input id="login-username" type="text" class="form-control input-sm" name="username" value="" placeholder="username or email">
               </div>

               <div class="input-group col-sm-offset-3 col-sm-7">
                 <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                 <input id="login-password" type="password" class="form-control input-sm" name="password" placeholder="password">
               </div>



               <div class="input-group col-sm-offset-3 col-sm-7">
                 <div class="checkbox">
                   <label>
                     <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                   </label>
                 </div>
               </div>


               <div class="form-group">
                 <!-- Button -->

                 <div class="col-sm-12 controls text-center">
                   <a id="btn-login" href="#" class="btn btn-primary btn-sm"> Login <i class="fa fa-sign-in" aria-hidden="true"></i>   </a>
                 </div>
               </div>


               <div class="form-group">
                 <div class="col-md-12 control">
                   <div class="dontAcc">
                     Don't have an account!
                     <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                       Sign Up Here
                     </a>
                   </div>
                 </div>
               </div>
             </form>



           </div>
         </div>
       </div>
       <div id="signupbox" class="mainbox col-md-5 col-md-offset-4 col-sm-7 col-sm-offset-3">
         <div class="panel panel-primary">
           <div class="panel-heading">
             <div class="panel-title text-center">Sign Up <i class="fa fa-user-plus"></i></div>
             <div class="signIn"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
           </div>
           <div class="panel-body" >
             <form id="signupform" class="form-horizontal" role="form">

               <div id="signupalert" class="alert alert-danger">
                 <p>Error:</p>
                 <span></span>
               </div>



               <div class="form-group">
                 <label for="email" class="col-md-4 control-label">Email</label>
                 <div class="col-md-8">
                   <input type="text" class="form-control input-sm" name="email" placeholder="Email Address">
                 </div>
               </div>

               <div class="form-group">
                 <label for="firstname" class="col-md-4 control-label">First Name</label>
                 <div class="col-md-8">
                   <input type="text" class="form-control input-sm" name="firstname" placeholder="First Name">
                 </div>
               </div>
               <div class="form-group">
                 <label for="lastname" class="col-md-4 control-label">Last Name</label>
                 <div class="col-md-8">
                   <input type="text" class="form-control input-sm" name="lastname" placeholder="Last Name">
                 </div>
               </div>
               <div class="form-group">
                 <label for="password" class="col-md-4 control-label">Password</label>
                 <div class="col-md-8">
                   <input type="password" class="form-control input-sm" name="passwd" placeholder="Password">
                 </div>
               </div>

               <div class="form-group">
                 <label for="icode" class="col-md-4 control-label">Invitation Code</label>
                 <div class="col-md-8">
                   <input type="text" class="form-control input-sm" name="icode" placeholder="">
                 </div>
               </div>

               <div class="form-group">
                 <!-- Button -->
                 <div class="col-md-offset-4 col-md-8">
                   <button id="btn-signup" type="button" class="btn btn-primary btn-sm"> Sign Up <i class="fa fa-user-plus"></i></button>
                   <!--<span style="margin-left:8px;">or</span>  -->
                 </div>
               </div>


               <div class="form-group">
                 <div class="col-md-12 control">
                   <div class="logInText">
                     Do you have an account!
                     <a href="#" onClick="$('#signupbox').hide(); $('#loginbox').show()">
                       Login Here
                     </a>
                   </div>
                 </div>
               </div>


             </form>
           </div>
         </div>




       </div>
     </div>

   </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>--%>
</body>
</html>