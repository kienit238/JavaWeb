<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Microsoft Company</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">


<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->


<link href="<%=request.getContextPath()%>/sources/css/login.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/sources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<div
		class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">
		<img alt="logo"
			src="<%=request.getContextPath()%>/sources/img/logom.png">
	</div>
	<br />
	<div
		class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">Microsoft
		Corporation One Microsoft | Way Redmond | WA 98052-7329 USA</div>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-faded py-lg-4">
		<div class="container">
			<a
				class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
				href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="?lang=en"><img
							alt="flagusa"
							src="<%=request.getContextPath()%>/sources/img/flagusa.jpg"></a>
					</li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="?lang=vi"><img
							alt="flagvi"
							src="<%=request.getContextPath()%>/sources/img/flagvi.jpg"></a>
					</li>
					<li class="nav-item active px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="index.htm"><spring:message
								code="label.menu.home" /> <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="about.htm"><spring:message
								code="label.menu.about" /></a></li>

					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="contact.htm"><spring:message
								code="label.menu.contact" /></a></li>

					<li class="dropdown"><a href="#"
						class="nav-link text-uppercase text-expanded"
						data-toggle="dropdown"><b><spring:message
									code="label.login.login" /></b> <span class="caret"></span></a>
						<ul id="login-dp" class="dropdown-menu">
							<li>
								<div class="row">
									<div class="col-md-12">
										<spring:message code="label.login.signin" />
										<div class="social-buttons">
											<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i>
												Facebook</a> <a href="#" class="btn btn-tw"><i
												class="fa fa-twitter"></i> Twitter</a>
										</div>
										<spring:message code="label.login.or" />
										<form class="form" role="form" method="post"
											action="<%=request.getContextPath()%>/Login/login.htm"
											accept-charset="UTF-8" id="login-nav">
											<div class="form-group">
												<label class="sr-only" for="exampleInputEmail2">Username</label>
												<input type="text" name="username" class="form-control"
													id="exampleInputEmail2"
													placeholder="<spring:message code="label.login.username" />"
													required>
											</div>
											<div class="form-group">
												<label class="sr-only" for="exampleInputPassword2">Password</label>
												<input type="password" name="password" class="form-control"
													id="exampleInputPassword2"
													placeholder="<spring:message code="label.login.password" />"
													required>
												<div class="help-block text-right">
													<a href=""><spring:message code="label.login.forget" /></a>
												</div>
											</div>
											<div class="form-group">
												<button type="submit" class="btn btn-primary btn-block">
													<spring:message code="label.login.submit" />
												</button>
											</div>
											<div class="form-group">
												<div style="color: red;">${message}</div>
											</div>
											<div class="checkbox">
												<!--  <label>
											 <input type="checkbox"> keep me logged-in
											 </label>-->
											</div>
										</form>
									</div>
									<div class="bottom text-center">
										<b>Microsoft Corporation</b>
									</div>
								</div>
							</li>

						</ul></li>

				</ul>
			</div>
		</div>
	</nav>

	<div class="container">

		<div class="bg-faded p-4 my-4">
			<!-- Image Carousel -->
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid w-100"
							src="<%=request.getContextPath()%>/sources/slide/slide-1.jpg"
							alt="">
						<div class="carousel-caption d-none d-md-block">
							<h3 class="text-shadow">First Slide</h3>
							<p class="text-shadow">This is the caption for the first
								slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid w-100"
							src="<%=request.getContextPath()%>/sources/slide/slide-2.jpg"
							alt="">
						<div class="carousel-caption d-none d-md-block">
							<h3 class="text-shadow">Second Slide</h3>
							<p class="text-shadow">This is the caption for the second
								slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid w-100"
							src="<%=request.getContextPath()%>/sources/slide/slide-3.png"
							alt="">
						<div class="carousel-caption d-none d-md-block">
							<h3 class="text-shadow">Third Slide</h3>
							<p class="text-shadow">This is the caption for the third
								slide.</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<!-- Welcome Message -->
			<div class="text-center mt-4">
				<div class="text-heading text-muted text-lg">Welcome To</div>
				<h1 class="my-2">Microsoft Corporation</h1>
				<div class="text-heading text-muted text-lg">
					By <strong>Kiên FPOLY</strong>
				</div>
			</div>
		</div>

		<div class="bg-faded p-4 my-4">
			<hr class="divider">
			<h2 class="text-center text-lg text-uppercase my-0">
				Build a website <strong>worth visitng</strong>
			</h2>
			<hr class="divider">
			<img class="img-fluid float-left mr-4 d-none d-lg-block"
				src="<%=request.getContextPath()%>/sources/img/intro-pic.jpg"
				alt="">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Magnam soluta dolore voluptatem, deleniti dignissimos excepturi
				veritatis cum hic sunt perferendis ipsum perspiciatis nam officiis
				sequi atque enim ut! Velit, consectetur.</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Laboriosam pariatur perspiciatis reprehenderit illo et vitae iste
				provident debitis quos corporis saepe deserunt ad, officia, minima
				natus molestias assumenda nisi velit?</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Reprehenderit totam libero expedita magni est delectus pariatur aut,
				aperiam eveniet velit cum possimus, autem voluptas. Eum qui ut quasi
				voluptate blanditiis?</p>
		</div>

		<div class="bg-faded p-4 my-4">
			<hr class="divider">
			<h2 class="text-center text-lg text-uppercase my-0">
				Beautiful boxes to <strong>showcase your content</strong>
			</h2>
			<hr class="divider">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Magnam soluta dolore voluptatem, deleniti dignissimos excepturi
				veritatis cum hic sunt perferendis ipsum perspiciatis nam officiis
				sequi atque enim ut! Velit, consectetur.</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Laboriosam pariatur perspiciatis reprehenderit illo et vitae iste
				provident debitis quos corporis saepe deserunt ad, officia, minima
				natus molestias assumenda nisi velit?</p>
		</div>

	</div>
	<!-- /.container -->

	<footer class="bg-faded text-center py-5">
		<div class="container">
			<p class="m-0">Copyright &copy; Kiên FPOLY 2017</p>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/sources/vendors/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/sources/vendors/popper/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>