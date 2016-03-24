<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<div id="content">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-9">
				<div class="blog-post">
					<div class="blog-item-header">
						<h2>
							<a href=""> ${ blog.title } </a>
						</h2>
						<!-- Date -->
						<div class="blog-post-date">
							<a href=""><fmt:formatDate value="${ blog.createdDate }" pattern="dd-MM-yyyy hh:mm:ss"/></a>
						</div>
						<!-- End Date -->
					</div>
					<div class="blog-post-details">
						<!-- Author Name -->
						<div
							class="blog-post-details-item blog-post-details-item-left user-icon">
							<i class="fa fa-user color-gray-light"></i> <a href="#">Admin</a>
						</div>
						<!-- End Author Name -->
						<!-- Tags -->
						<div
							class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
							<i class="fa fa-tag color-gray-light"></i> <a href="#">hong</a>, <a
								href="#">phong lan</a>, <a href="#">hoa lai</a>
						</div>
						<!-- End Tags -->
						<!-- # of Comments -->
						<div
							class="blog-post-details-item blog-post-details-item-left blog-post-details-item-last">
							<a href=""> <i class="fa fa-comments color-gray-light"></i> 3
								Bình luận
							</a>
						</div>
						<!-- End # of Comments -->
					</div>
					<div class="blog-item">
						<div class="clearfix"></div>
						<div class="blog-post-body row margin-top-15">
							<div class="col-md-5">
								<img class="margin-bottom-20" src="${dataDomain}${blog.image.url}"
									alt="image1">
							</div>
							<div class="col-md-7">
								<p>${ blog.content }</p>
							</div>
							
						</div>
					</div>
				</div>
				<!-- End Blog Post -->
			</div>
			<!-- End Main Column -->
			<!-- Side Column -->
			<div class="col-md-3">
				<!-- Blog Tags -->
				<div class="blog-tags">
					<h3>Thẻ</h3>
					<ul class="blog-tags">
						<li><a href="#" class="blog-tag">hong</a></li>
						<li><a href="#" class="blog-tag">lan</a></li>
						<li><a href="#" class="blog-tag">diep</a></li>
						<li><a href="#" class="blog-tag">tulip</a></li>
						<li><a href="#" class="blog-tag">cuc</a></li>
						<li><a href="#" class="blog-tag">cam chuong</a></li>
						<li><a href="#" class="blog-tag">oai duong</a></li>
						<li><a href="#" class="blog-tag">mau don</a></li>
						<li><a href="#" class="blog-tag">hoa dai</a></li>
						<li><a href="#" class="blog-tag">hoa lai</a></li>
					</ul>
				</div>
				<!-- End Blog Tags -->
				<!-- Recent Posts -->
				<div class="recent-posts">
					<h3>Những bài viết gần đây</h3>
					<ul class="posts-list margin-top-10">
						<c:forEach items="${ recentBlogs }" var="recentBlog">
						<li>
							<div class="recent-post">
                                <a href="${cp}/bai-viet-${recentBlog.friendURL}">
                                    <img class="pull-left" src="${dataDomain}${ recentBlog.image.url }" alt="thumb1" style="width: 54px; height: 54px">
                                </a>
                                <a href="${cp}/bai-viet-${recentBlog.friendURL}" class="posts-list-title">${ recentBlog.title }</a>
                                <br>
                                <span class="recent-post-date">
                                   <fmt:formatDate value="${ recentBlog.createdDate }" pattern="dd-MM-yyyy hh:mm:ss"/>
                                </span>
                            </div>
                            <div class="clearfix"></div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<!-- End Recent Posts -->
				<!-- End Side Column -->
			</div>
		</div>
	</div>
</div>


