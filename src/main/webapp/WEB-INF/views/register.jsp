<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>What's Next</title>
	<link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css" />" rel="stylesheet"  type="text/css" />
	<link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/style.css" />" rel="stylesheet" type="text/css" />
  <link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/social-buttons-3.css" />" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
  function myFunction() {
        var ps1 = document.getElementById("p1").value;
        var ps2 = document.getElementById("p2").value;
        var ok = true;
        if (ps1 != ps2) {
            //alert("Passwords Do not match");
            document.getElementById("p1").style.borderColor = "#E34234";
            document.getElementById("p2").style.borderColor = "#E34234";
            ok = false;
        }
        return ok;
    }
</script>
<body id="body_register_page">
<div class="container-fluid" style="margin-bottom:3em;">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                          <div class="s0_bg"></div>
                            <div class="page-header">
                              <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-5">
                                <a href="/main">
                                	<img alt="" src="resources/bootstrap-3.3.6-dist/css/images/title.png">
                                </a>
                                </div>
                                <div class="col-md-5">
                                	<ul id="home_page_nav"class="nav nav-tabs">
                                    <form class="navbar-form navbar-left" action="/main/search" id="search" method="post">
                                      <div class="form-group">
                                        <input type="text" class="form-control" name="searchContent" placeholder="search" style="width:23em"/>
                                      </div> 
                                      <button type="submit" name="submit" class="btn btn-default">
                                        <span class="glyphicon glyphicon-search"></span>
                                      </button>
                                    </form>
                                    <li class="dropdown pull-right">
                                        <a href="#" data-toggle="dropdown" class="dropdown-toggle"><span class="glyphicon glyphicon-list"></span>  Menu<strong class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                        <li>
                                        		<a href="#">Home</a>
                                  		</li>
                                        <sec:authorize access="!hasAnyAuthority('admin','user')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="#">Login</a>
                                            </li>
                                        </sec:authorize>
                                        <sec:authorize access="hasAnyAuthority('user')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="/main/user/${register.getRegisterId()}">User Page</a>
                                            </li>
                                        </sec:authorize>
                                        <sec:authorize access="hasAnyAuthority('admin')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="/main/admin/${register.getRegisterId()}">Admin Page</a>
                                            </li>
                                        </sec:authorize>
                                            <li class="divider"></li>
                                        <sec:authorize access="!hasAnyAuthority('admin','user')">
                                            <li>
                                                <a href="/main/register">Register</a>
                                            </li>
										</sec:authorize>
										<sec:authorize access="hasAnyAuthority('admin','user')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="/main/logout">Logout</a>
                                            </li>
                                        </sec:authorize>
                                        </ul>
                                    </li>
                                </ul>
                                </div>
                              </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal_login" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header" style="padding:35px 50px;">
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                              </button>
                                <h4 class="modal-title" id="myModalLabel" style="text-align:center;">Sign In</h4>
                            </div>
                            <div>
                          <div class="modal-body" style="padding:40px 50px;">
                            <form action="<c:url value="/j_spring_security_check" />" method="POST" class="form-signin" role="form">
                              <div class="form-group">
                                  <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
                                  <input type='text' name='username' class="form-control" placeholder="Enter user name" />
                              </div>
                              <div style="padding-bottom:2em;">
                                  <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                  <input type='password' name='password' class="form-control" placeholder="Enter password" />
                              </div>
                                  <button name="submit" type="submit" class="btn btn-success btn-block" value="submit">
                                    <span class="glyphicon glyphicon-off"></span> 
                                    Login
                                  </button>
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                              </form>
                          </div>
							       </div>
                          <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                              <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                            <button type="submit" class="btn btn-info btn-default pull-right" data-dismiss="modal">
                              <span class="glyphicon glyphicon-user"></span> Register</button>
                          </div>
                        </div>
                       </div>
                    </div>

                    <div class="container-fluid">
                      <div class="row">
                        <div class="col-md-12">
                          <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6" style="padding:40px 50px;">
                            <form:form modelAttribute="register" method="POST" action="register" enctype="multipart/form-data" role="form" onsubmit="return myFunction()">
                              <div class="form-group">
                                <form:label path="registerName">Name</form:label>
                                <form:input path="registerName" type="text" class="form-control" placeholder="Enter user name" required="required"/>
                                <form:errors path="registerName" cssClass="has-error has-feedback"></form:errors>
                              </div>
                              <div class="form-group">
                                <form:label path="registerPassword">Password</form:label>
                                <form:input path="registerPassword" type="password" class="form-control" placeholder="Enter password" id="p1" required="required"/>
                                <form:errors path="registerPassword" cssClass="has-error has-feedback"></form:errors>
                              </div>
                              <div class="form-group">
                                <form:label path="confirmPassword">Confirm password</form:label>
                                <form:input path="confirmPassword" type="password" class="form-control" placeholder="Confirm password" id="p2" required="required"/>
                                <form:errors path="confirmPassword" cssClass="has-error has-feedback"></form:errors>
                              </div>
                              <div class="form-group">
                                <form:label path="registerPhone">Phone Number</form:label>
                                <form:input path="registerPhone" type="tel" class="form-control" placeholder="Enter phone number" required="required"/>
                                <form:errors path="registerPhone" cssClass="has-error has-feedback"></form:errors>
                              </div>
                              <div class="form-group">                               
                                <form:label path="registerEmail">Email Address</form:label>
                                <form:input path="registerEmail" type="email" class="form-control" placeholder="Enter e-mail address" required="required"/>
                                <form:errors path="registerEmail" cssClass="has-error has-feedback"></form:errors>
                              </div>
                              <div class="form-group" style="padding-bottom:2em;">
                                <form:label path="photo">Photo</form:label>
                                <form:input path="photo" type="file" placeholder="Upload photo" class="form-control" />
                                <form:errors path="photo" cssClass="has-error has-feedback"></form:errors>   
                              </div>
                              <button name="submit" type="submit" class="btn btn-success btn-block" value="submit">
                                <span class="glyphicon glyphicon-off"></span> Register
                              </button>
                            </form:form>
                            </div>
                            <div class="col-md-3"></div>
                          </div>
                          </div>
                        </div>
                          </div>
                        </div>
				</div>
			</div>

                    
  <footer id="footer_main_page" class="section section-primary">
          <hr>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <h1>Footer header</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="text-info text-right">
                            <br>
                            <br>
                        </p>
                        <div class="row">
                            <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
                                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 hidden-xs text-right">
                                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="resources/bootstrap-3.3.6-dist/js/jquery.min.js"></script>
        <script src="resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <script src="resources/bootstrap-3.3.6-dist/js/scripts.js"></script>
    
</body>
</html>
