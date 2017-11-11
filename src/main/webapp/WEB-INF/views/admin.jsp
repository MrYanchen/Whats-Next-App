<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>What's Next</title>
	<link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css" />" rel="stylesheet"  type="text/css" />
	<link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/style.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/social-buttons-3.css" />" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container-fluid" style="margin-bottom:3em;">
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
                                        <sec:authorize access="hasAnyAuthority('supervisior')">
                                            <li data-toggle="modal" data-target="#myModal_login">
                                                <a href="/main/admin">Administrator</a>
                                            </li>
                                        </sec:authorize>
                                            <li class="divider"></li>
										<sec:authorize access="hasAnyAuthority('admin', 'user', 'supervisior')">
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
</div>

<div class="container-fluid" style="margin-top:3em">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="container-fluid">
						<c:if test="${!empty list}">
						<div class="container-fluid">
							<table class="table table-hover">
								<thead>
									<tr>
					                  <th style="text-align: center;">
					                      User
					                  </th>
					                  <th style="text-align: center;">
					                      Photo
					                  </th>
					                  <th style="text-align: center;">
					                      Action
					                  </th>
					                </tr>
								</thead>
								<tbody>
								<c:forEach items="${list}" var="register">
									<tr>
										<td style="text-align: center;">
											<h2 style="text-align:center;"><c:out value="${register.getRegisterName()}"></c:out></h2>
										</td>
										<td style="text-align: center;">
											<div>
												<img alt="" src="<c:url value="/user/${register.getRegisterId()}/photo" />" style="height: 19.1%;" class="img-circle img-responsive">
											</div>
										</td>
										<td style="text-align: center;">
											<div>
												<a href="<c:url value="/admin/${register.getRegisterId()}/upgrade" />" class="btn btn-default" role="button">Agree</a>
											</div>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						</c:if>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
</div>

<footer id="footer_main_page" class="section section-primary">
          <hr>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <h1>What's Next!</h1>
                        <p>Share Experience and Knowledge
                        	<br>
                        	<br>
                        </p>
                    </div>
                    <div class="col-sm-6">
                        <p class="text-info text-right">
                            <br>
                            <br>
                        </p>
                        <div class="row">
                            <div class="col-md-12 text-left">
                                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 hidden-xs text-right">
                                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
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