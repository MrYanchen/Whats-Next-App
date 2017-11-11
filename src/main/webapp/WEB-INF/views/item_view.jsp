<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>What's Next</title>
    <link href="/main/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/main/resources/bootstrap-3.3.6-dist/css/style.css" rel="stylesheet">
    <link href="/main/resources/bootstrap-3.3.6-dist/css/cssbox.css" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/social-buttons-3.css" />" rel="stylesheet" type="text/css" />

  </head>
  <body>
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
                                        		<a href="/main">Home</a>
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
        </div>
        </div>
       
         
        
        <c:if test="${!empty item}">
        <div class="container-fluid" style="height:100%">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <div class="">
                        <ul class="slides">
							<input type="radio" name="radio-btn" id="img" checked />
                              <li class="slide-container">
                                <div class="slide">
                                    <a href="<c:url value="/item/${item.getItemId()}/steplist" />">
                                    <img class="img-responsive" src="<c:url value="/item/${item.getItemId()}/image" />" />
                                    </a>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <div class="row">
                                                        
                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-8">
                                                          <a href="<c:url value="/item/${item.getItemId()}/like" />">
                                                            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span><c:out value="${item.getItemLike()}"></c:out> Like</button>
                                                          </a>
                                                        </div>
                                                        <div class="col-sm-2"></div>
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-sm-10"><h2 style="text-align:center;"><c:out value="${item.getItemName()}"></c:out></h2></div>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                              </li>
                           
                           
                        </ul>
                    </div>
                </div>
                </div>
            <div class="col-sm-3"></div>
            
        </div>
        </c:if>
        <script src="/main/resources/bootstrap-3.3.6-dist/js/jquery.min.js"></script>
        <script src="/main/resources/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <script src="/main/resources/bootstrap-3.3.6-dist/js/scripts.js"></script>
  </body>
</html>


