<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="content">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-9">
			
				<c:forEach items="${ blogs }" var="blog">
					<div class="blog-post padding-bottom-20">
						<!-- Blog Item Header -->
						<div class="blog-item-header">
							<!-- Title -->
							<h2>
								<a href="${cp}/bai-viet-${blog.friendURL}"> ${ blog.title }</a>
							</h2>
							<div class="clearfix"></div>
							<!-- End Title -->
							<!-- Date -->
							<div class="blog-post-date">
								<a><fmt:formatDate value="${ blog.createdDate }" pattern="dd-MM-yyyy hh:mm:ss"/> </a>
							</div>
							<!-- End Date -->
						</div>
						<!-- End Blog Item Header -->
						<!-- Blog Item Details -->
						<div class="blog-post-details">
							<!-- Author Name -->
							<div class="blog-post-details-item blog-post-details-item-left">
								<i class="fa fa-user color-gray-light"></i> <a href="#">Admin</a>
							</div>
							<!-- End Author Name -->
							<!-- Tags -->
							<div
								class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
								<i class="fa fa-tag color-gray-light"></i> <a href="#">hong</a>,
								<a href="#">lan</a>, <a href="#">tulip</a>
							</div>
							<!-- End Tags -->
							<!-- # of Comments -->
							<div
								class="blog-post-details-item blog-post-details-item-left blog-post-details-item-last">
								<a href=""> <i class="fa fa-comments color-gray-light"></i> 1
									Bình luận
								</a>
							</div>
							<!-- End # of Comments -->
						</div>
						<!-- End Blog Item Details -->
						<!-- Blog Item Body -->
						<div class="blog">
							<div class="clearfix"></div>
							<div class="blog-post-body row margin-top-15">
								<div class="col-md-5">
									<img class="margin-bottom-20" src="${dataDomain}${blog.image.url}"
										alt="thumb3" style="width: 300px; height: 196px">
								</div>
								<div class="col-md-7">
									<p>${ blog.content }</p>
									<!-- Read More -->
									<a href="${cp}/bai-viet-${blog.friendURL}" class="btn btn-primary"> Đọc thêm <i
										class="icon-chevron-right readmore-icon"></i>
									</a>
									<!-- End Read More -->
								</div>
							</div>
						</div>
						<!-- End Blog Item Body -->
					</div>
				</c:forEach>	
						
				<!-- End Blog Item -->
				<!-- Pagination -->
				<ul class="pagination">
					<c:if test="${ page > 1 }">
						<li><a
							href="${ cp }/${currentURL}-1.html">&laquo;</a></li>
					</c:if>

					<c:forEach var="i" begin="1" end="${ totalPage }">
						<li class='<c:if test="${ i == page }">active</c:if>'><a
							href="${ cp }/${currentURL}-${ i }.html">${ i }</a>
						</li>
					</c:forEach>

					<c:if test="${ page < totalPage }">
						<li><a
							href="${ cp }/${currentURL}-${ totalPage }.html">&raquo;</a></li>
					</c:if>
				</ul>
				<!-- End Pagination -->
			</div>
			<!-- End Main Column -->
			<!-- Side Column -->
			<div class="col-md-3">
				<!-- End Blog Tags -->
				<!-- Recent Posts -->
				<div class="recent-posts">
					<h3><strong>Những bài viết gần đây</strong></h3>
					<ul class="posts-list margin-top-10">
						<c:forEach items="${ recentBlogs }" var="blog">
						<li>
							<div class="recent-post">
                                <a href="${cp}/bai-viet-${blog.friendURL}">
                                    <img class="pull-left" src="${dataDomain}${ blog.image.url }" alt="thumb1" style="width: 54px; height: 54px">
                                </a>
                                <a href="${cp}/bai-viet-${blog.friendURL}" class="posts-list-title">${ blog.title }</a>
                                <br>
                                <span class="recent-post-date">
                                   <fmt:formatDate value="${ blog.createdDate }" pattern="dd/MM/yyyy hh:mm a"/>
                                </span>
                            </div>
                            <div class="clearfix"></div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<!-- End Recent Posts -->
			</div>
			<!-- End Side Column -->
		</div>
	</div>
</div>


