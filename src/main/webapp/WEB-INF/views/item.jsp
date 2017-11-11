<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                                	<img alt="" src="/main/resources/bootstrap-3.3.6-dist/css/images/title.png">
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
                                        		<a href="<c:url value="/" />">Home</a>
                                  		</li>
                                        <sec:authorize access="!hasAnyAuthority('admin','user')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="#">Login</a>
                                            </li>
                                        </sec:authorize>
                                        <sec:authorize access="hasAnyAuthority('user')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="/main/user/${id}">User Page</a>
                                            </li>
                                        </sec:authorize>
                                        <sec:authorize access="hasAnyAuthority('admin')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="/main/user/${id}">Admin Page</a>
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

                    <div class="container-fluid">
                    	<div class="row">
                        <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3"></div>
                    		<c:set var="userId" value="${id}"></c:set>
							<div class="col-md-6" style="padding:40px 50px;">
							<form:form id="form" modelAttribute="item" method="post" action="item" enctype="multipart/form-data">
							<div class="form-group">
								<form:label path="itemName">Name</form:label>
								<form:input path="itemName" type='text' class="form-control" placeholder="Enter item name" required="required"/>
								<form:errors path="itemName" cssClass="error"></form:errors>
							</div>
							<div class="form-group" style="padding-bottom:2em;">
								<form:label path="image">Image</form:label>
								<form:input path="image" type="file" class="form-control" placeholder="Upload image" required="required"/>
								<form:errors path="image" cssClass="error"></form:errors>
							</div>
								<button name="submit" type="submit" class="btn btn-success btn-block" value="submit">
                                  <span class="glyphicon glyphicon-off"></span> 
                                  Submit
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
       <script src="/main/resources/bootstrap-3.3.6-dist/js/jquery.min.js"></script>
       <script src="/main/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
       <script src="/main/resources/bootstrap-3.3.6-dist/js/scripts.js"></script>

</body>
</html>
