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
  <link href="/main/resources/bootstrap-3.3.6-dist/css/cssbox.css" rel="stylesheet">
  <link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/social-buttons-3.css" />" rel="stylesheet" type="text/css" />
</head>
<body id="body_home_page">
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
                                                <a href="/main/user/${register.getRegisterId()}">Admin Page</a>
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
            </div>
            
              </div>
  </div>
      
      	<c:if test="${!empty searchList}">
           
           <div class="container-fluid" style="height:100%">
                <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                  <table class="table table-hover">
		            <thead>
		                <tr>
		                  <th style="text-align: center;">
		                      Name
		                  </th>
		                  <th style="text-align: center;">
		                      Item
		                  </th>
		                  <th style="text-align: center;">
		                      User
		                  </th>
		                </tr>
		            </thead>
		            <tbody>
		           	<c:forEach items="${searchList}" var="item">
		            <tr>
		            <td style="text-align: center;">
		                  <h2 style="text-align:center;"><c:out value="${item.getItemName()}"></c:out></h2>
		            </td>
		            <td style="text-align: center;">
		                  
		                                <div>
		                                    <a href="<c:url value="/item/${item.getItemId()}/steplist" />">
		                                    <img class="img-thumbnail" src="<c:url value="/item/${item.getItemId()}/image" />" />
		                                    </a>
		                                </div>
		            </td>
		            <td style="text-align: center;">
		            	<c:out value="${item.getRegister().getRegisterName().toString()}"></c:out>
		            </td>
		         	</tr>
		   			</c:forEach>
		   			</tbody>
		   			</table>
		       </div>
		    <div class="col-sm-3"></div>
		    </div>
		  </div>
		</c:if>

       <script src="/main/resources/bootstrap-3.3.6-dist/js/jquery.min.js"></script>
       <script src="/main/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
       <script src="/main/resources/bootstrap-3.3.6-dist/js/scripts.js"></script>

</body>
</html>