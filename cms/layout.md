<html>
<head>
	<meta charset="utf-8">
	<title>{{Title}}</title>
	<meta name="description" content="{{site.metaDescription}}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<script type="text/javascript" src="http://oss.steedos.com/libs/jquery/2.2.0/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://oss.steedos.com/libs/bootstrap/3.3.6/css/bootstrap.min.css">
	<script type="text/javascript" src="http://oss.steedos.com/libs/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://oss.steedos.com/libs/admin-lte/2.3.2/css/AdminLTE.min.css">
	<link rel="stylesheet" type="text/css" href="http://oss.steedos.com/libs/admin-lte/2.3.2/css/skins/_all-skins.min.css">
	<script type="text/javascript" src="http://oss.steedos.com/libs/admin-lte/2.3.2/js/app.min.js"></script>
	<style>
		.article_list * {
		  margin: 0;
		  padding: 0;
		  font-style: normal;
		}
		.article_list h1,
		.article_list h2,
		.article_list h3,
		.article_list h4,
		.article_list h5,
		.article_list h6 {
		  font-weight: 400;
		  font-size: 16px;
		  line-height: 1.6;
		}
		.article_list .list_item {
		  display: block;
		  padding: 15px 15px 10px 10px;
		  overflow: hidden;
		  position: relative;
		  text-decoration: none;
		  -webkit-tap-highlight-color: transparent;
		}
		.article_list .list_item .cover {
		  float: left;
		  margin-right: 10px;
		}
		.article_list .list_item .cover .img {
		  display: block;
		  width: 80px;
		  height: 60px;
		}
		.article_list .list_item .cont {
		  overflow: hidden;
		}
		.article_list .list_item .cont .title {
		  font-weight: 400;
		  font-size: 16px;
		  color: #000;
		  width: 100%;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		  word-wrap: normal;
		}
		.article_list .list_item .cont .desc {
		  font-size: 13px;
		  color: #999;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  display: -webkit-box;
		  -webkit-box-orient: vertical;
		  -webkit-line-clamp: 2;
		  line-height: 1.3;
		}
		.article_list .list_item:after {
		  content: " ";
		  position: absolute;
		  bottom: 0;
		  width: 100%;
		  height: 1px;
		  border-bottom: 1px solid #e2e2e2;
		  -webkit-transform-origin: 0 100%;
		  transform-origin: 0 100%;
		  -webkit-transform: scaleY(0.5);
		  transform: scaleY(0.5);
		  left: 10px;
		}
	</style>
</head>
<body class="steedos site layout-top-nav skin-red">

	<div class="wrapper">
		
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="navbar-header">
				  <a href="/site/{{Site._id}}" class="navbar-brand"><b>{{Site.name}}</b></a>
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
					<i class="fa fa-bars"></i>
				  </button>
				</div>

				<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
				  <ul class="nav navbar-nav">
					
					{{#each Categories}}
						<li class="true"><a href="/site/{{site}}/category/{{_id}}">{{name}}</a></li>
					{{/each}}
					
				  </ul>
				</div>
				<div class="navbar-custom-menu">
				</div>
			</nav>
		</header>

		<div class="content-wrapper" style="min-height: 800px;">
			
			<div class="content">
				
				{{#if IndexPage}}
					<div class="row">
					{{#each Categories}}

						<div class="box">
							<div class="box-header with-border">
							  <h3 class="box-title">{{name}}</h3>
							</div>
							<div class="box-body no-padding weixin">

								<div class="article_list">
					
									{{#each Posts _id}}
									<a class="list_item js_post" href="/site/{{site}}/post/{{_id}}">
										<div class="cover">
											<img class="img js_img" src="/api/files/cms_images/{{image}}" alt="">
										</div>
										<div class="cont">
											<h2 class="title js_title">{{title}}</h2>
											<p class="desc">{{summary}}</p>
											<!-- <p>{{fromNow posted}}</p> -->
										</div>
									</a>
									{{/each}}
									
								</div>

							</div>
						</div>
					{{/each}} 
					</div>
				{{/if}}


				{{#if CategoryPage}}
					<div class="row">

						<div class="box">
							<div class="box-header with-border">
							  <h3 class="box-title">{{Category.name}}</h3>
							</div>
							<div class="box-body no-padding weixin">

								<div class="article_list">
					
									{{#each Posts Category._id}}
									<a class="list_item js_post" href="/site/{{site}}/post/{{_id}}">
										<div class="cover">
											<img class="img js_img" src="/api/files/cms_images/{{image}}" alt="">
										</div>
										<div class="cont">
											<h2 class="title js_title">{{title}}</h2>
											<p class="desc">{{summary}}</p>
											<!-- <p>{{fromNow posted}}</p> -->
										</div>
									</a>
									{{/each}}
									
								</div>

							</div>
						</div>
					</div>
				{{/if}}



				{{#if PostPage}}
					<div class="row">

						<div class="box">
							<div class="box-header with-border">
							  <h3 class="box-title">{{Post.title}}</h3>
							  <p>{{posted}}</p>
							</div>
							<div class="box-body no-padding weixin">
								<img class="img js_img" src="/api/files/cms_images/{{Post.image}}" alt="">
								<p>{{Markdown Post.body}}</p>

							</div>
						</div>
					</div>
				{{/if}}
			</div>
		</div>
	</div>
</body>
</html>