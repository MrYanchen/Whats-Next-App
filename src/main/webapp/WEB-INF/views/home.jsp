<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
                              <div class="form-group" style="padding-bottom:2em;">
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

                    <div id="column" class="container-fluid" style="width:100%">
                      <div class="row">
                        <div class="col-md-12">
                                
                                <!-- Carousel -->
                                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                      <li data-target="#myCarousel" data-slide-to="1"></li>
                                      <li data-target="#myCarousel" data-slide-to="2"></li>
                                      <li data-target="#myCarousel" data-slide-to="3"></li>
                                    </ol>
                                    <div class="carousel-inner" role="listbox">
                                        <!-- Wrapper for slides -->
                                      <div class="carousel-inner" role="listbox">
                                        <div class="item active">
                                          <a href="">
                                            <img src="resources/bootstrap-3.3.6-dist/css/images/food.jpg" alt="Chania" style="height: 61.8%; top: 0px; left: -33.3333%;">
                                            <div class="carousel-caption">
                                               <h2>Food</h2>
                                               <p>How to make delicious food</p>
                                            </div>
                                          </a>
                                        </div>
                                        <div class="item">
                                          <a href="">
                                              <img src="resources/bootstrap-3.3.6-dist/css/images/computer.jpg" alt="Chania" style="height: 61.8%; top: 0px; left: -33.3333%;">
                                              <div class="carousel-caption">
                                                <h2>Computer</h2>
                                                <p>How to solve computer problem</p>
                                              </div>
                                          </a>
                                        </div>
                                        <div class="item">
                                          <a href="">
                                            <img src="resources/bootstrap-3.3.6-dist/css/images/travel.jpg" alt="Flower" style="height: 61.8%; top: 0px; left: -33.3333%;">
                                            <div class="carousel-caption">
                                              <h2>Travel</h2>
                                              <p>How to have a nice travel</p>
                                            </div>
                                          </a>
                                        </div>
                                        <div class="item">
                                          <a href="">
                                          <img src="resources/bootstrap-3.3.6-dist/css/images/make_up.jpg" alt="Flower" style="height: 61.8%; top: 0px; left: -33.3333%;">
                                          <div class="carousel-caption">
                                            <h2>Make-up</h2>
                                            <p>How to make up</p>
                                          </div>
                                        </a>
                                        </div>
                                      </div>
                                    </div>
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                      <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                      <span class="sr-only">Next</span>
                                    </a>
                                </div>
                         </div>
                       </div>
                    </div>
                     
                     
                  	<div class="row">
                    	<div class="col-md-1"></div>
                    	<div class="col-md-10">
                    	<div class="container-fluid" style="padding-top:3em;"> 
                          	<div>
                              	<div class="panel panel-primary">
                               	 <div class="panel-heading" style="">
                                  	<h3 class="panel-title">
                                    Recommendation
                                  	</h3>
                                 </div>
                               </div>
                            </div>
                          <c:if test="${!empty recommendList}">
                          <div class="row">  
                          		  <c:forEach items="${recommendList}" var="item">  
                          		  	 
                          		  	                    		 	
                          		 	 <div class="col-md-4">
		                                  <div class="thumbnail">
		                                  	<a href="item/${item.getItemId()}">
		                                      <img alt="" src="item/${item.getItemId()}/image">
		                                    </a>  
		                                      <div class="caption">
		                                          <h3 style="text-align:center;">${item.getItemName()}</h3>
		                                      </div>
		                                  </div>
		                             </div>
		                            
		                              
                          		  </c:forEach>
                                </div>
                          </c:if>                      
                    </div>
                    </div>
                    </div>
                    <div class="col-md-1"></div>
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
