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
  	<link href="<c:url value="/resources/bootstrap-3.3.6-dist/css/social-buttons-3.css" />" rel="stylesheet" type="text/css"  />
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
                                        <a href="#" data-toggle="dropdown" class="dropdown-toggle"><span class="glyphicon glyphicon-list"></span> Menu<strong class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                        	<li>
                                        		<a href="/main">Home</a>
                                  		    </li>
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
                                            <li>
                                                <a href="/main/logout">Logout</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                </div>
                            </div>
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
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="container-fluid">
						<div class="row">
							<div>
								<div class="col-md-8">
								<div>
								<c:if test="${!empty itemList}">
								<c:forEach items="${itemList}" var="item">
									<div class="row">
										<div>
											<div class="thumbnail">
											<a href="<c:url value="/item/${item.getItemId()}/steplist" />">
	                                      		<img alt="" src="<c:url value="/item/${item.getItemId()}/image" />">
	                                      	</a>
	                                      	<div class="row">
	                                      		<div class="col-md-3">
			                                      	<div>
		                                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">Menu
														<span class="caret"></span></button>
														<ul class="dropdown-menu">
															<li><a href="<c:url value="/user/${userId}/delete/item/${item.getItemId()}" />"><span class="glyphicon glyphicon-remove"></span> Delete</a></li>
														</ul>
													</div>
												</div>
												<div class="col-md-9">
                                                    <div class="caption">
                                                    	 <h3 style="text-align:center;"><c:out value="${item.getItemName()}"></c:out></h3>
                                                    	 <p></p>
													</div>
                                                </div>
                                          </div>
	                    					</div>
										</div>
									</div>
								</c:forEach>
								</c:if>
								</div>
								<div>
	 							<sec:authorize access="hasAnyAuthority('admin')">
                                    <c:if test="${!empty list}">
                                    <div class="panel panel-info">
											    <div class="panel-heading">Item List</div>
											</div>
                                    	<c:forEach items="${list}" var="item">
                                            <div class="row">
                                              <div>
                                                <div class="thumbnail">
                                                	<a href="<c:url value="/item/${item.getItemId()}/steplist" />">
                                                      <img alt="" src="<c:url value="/item/${item.getItemId()}/image" />">
                                                    </a>
                                                    	<div class="row">
                                                        	<div class="col-md-3">
                                                        		<div>
                                                                  	<button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">Menu
																	<span class="caret"></span></button>
																	<ul class="dropdown-menu">
																	<li><a href="<c:url value="/user/${userId}/delete/item/${item.getItemId()}" />"><span class="glyphicon glyphicon-remove"></span> Delete</a></li>
																	<li><a href="<c:url value="/user/${userId}/recommend/item/${item.getItemId()}" />"><span class="glyphicon glyphicon-star"></span> Recommendation</a></li>
																	</ul>
																</div>
                                                        	</div>
                                                            <div class="col-md-9">
                                                                  	<div class="caption">
                                                                  		 <h3 style="text-align:center;"><c:out value="${item.getItemName()}"></c:out></h3>
                                                                      	 <p></p>
																	</div>
                                                            </div>
                                                        </div>
                                                </div>
                                              </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                               </sec:authorize>  
			                   </div>
			                   
								
								
						</div>
						
								<div class="col-md-4">
								<div class="thumbnail">
									<div class="row" style="margin-top:2em; margin-bottom:2em;">
										<div class="container col-md-10 col-md-offset-1">
											<c:if test="${!empty register}">
											<c:set var="userId" value="${register.getRegisterId()}"></c:set>
											<div class="container-fluid">
												<div class="row">
													<div class="col-md-3"></div>
													<div class="col-md-6">
														<a href="#" data-toggle="modal" data-target="#editprofile">
                                      					<img alt="" src="<c:url value="/user/${userId}/photo" />" style="height: 19.1%;" class="img-circle img-responsive">
                                    					</a>
                                    				</div>
                                    				<div class="col-md-3"></div>
                                    			</div>
                                    		</div>
                                    		<div class="caption">
                                          		<h2 style="text-align:center;"><c:out value="${register.getRegisterName()}"></c:out></h2>
                                          		<br>
                                          		<h4>Phone: <c:out value="${register.getRegisterPhone()}"></c:out></h4>
                                          		<br>
                                          		<h4>E-mail: <c:out value="${register.getRegisterEmail()}"></c:out></h4>
                                          		<div style="margin-top:1em;"> 
                                                <div style="margin-top:1em;">
                                                <div>
                                                    <button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">Menu
													<span class="caret"></span></button>
													<ul class="dropdown-menu">
														<li><a href="/main/user/${userId}/item"><span class="glyphicon glyphicon-plus"></span> Add Item</a></li>
													<sec:authorize access="hasAnyAuthority('user')">	
														<li><a href="/main/user/${userId}/upgrade"><span class="glyphicon glyphicon-arrow-up"></span> Apply for Admin</a></li>
													</sec:authorize>
													</ul>
												</div>
                                          		</div>
                                              </div>
                                      		</div>
                      </c:if>
                      </div>
                                      </div>
                                      </div>
                                </div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
        </div>


	</div>
</div>

                    

<!-- Modal -->
<div class="modal fade" id="editprofile" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
    		<div class="modal-header" style="padding:35px 50px;">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                 </button>
                 <h4 class="modal-title" id="myModalLabel" style="text-align:center;">Edit User Information</h4>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
				<form action="/main/user/${userId}/edit" role="form" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="changePhoto"><img alt="" src="<c:url value="/user/${userId}/photo" />" style="height: 19.1%;" class="img-circle img-responsive"></label><br>
						<input type="file" name="changePhoto" class="form-control">
					</div>
					<div class="form-group">
						<label for="changeTel">Phone: <c:out value="${register.getRegisterPhone()}"></c:out></label><br>
						<input type="tel" name="changeTel" class="form-control">
					</div>
					<div class="form-group" style="padding-bottom:2em;">
						<label for="changeEmail">E-mail: <c:out value="${register.getRegisterEmail()}"></c:out></label><br>
						<input type="email" name="changeEmail" class="form-control">
					</div>
					<button name="submit" type="submit" class="btn btn-success btn-block" value="submit">
                        <span class="glyphicon glyphicon-off"></span> 
                    	Change
                    </button>
				</form>
			</div>
			<div class="modal-footer">
            	<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                <span class="glyphicon glyphicon-remove"></span> Cancel</button>
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
                        <p>Share Experience and Knowledge</p>
                        <br>
                        <br>
                        <br>
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
