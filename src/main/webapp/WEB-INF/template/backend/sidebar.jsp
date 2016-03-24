 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<a href="#" class="menu-toggler invisible fixed" id="menu-toggler" data-target="#sidebar"></a>

<div id="sidebar" class="sidebar h-sidebar  navbar-collapse collapse" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true" style="">

				<div class="nav-wrap-up pos-rel"><div class="nav-wrap"><div style="position: relative; top: 0px; transition-property: top; transition-duration: 0.15s;"><div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success sidebar-collapse" data-target="#sidebar">
							<i class="ace-icon fa fa-angle-double-up" data-icon1="ace-icon fa fa-angle-double-up" data-icon2="ace-icon fa fa-angle-double-down"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><ul class="nav nav-list" style="top: 0px;">
					<li class="${companyMenuActive } hover">
						<a href="${cp}/admin/company">
							<i class="menu-icon fa fa-building"></i>
							<span class="menu-text"> Công Ty </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="${pageMenuActive } hover">
						<a href="${cp}/admin/pages">
							<i class="menu-icon fa fa-paypal"></i>
							<span class="menu-text"> Trang </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="${catalogMenuActive } hover">
						<a href="${cp}/admin/catalogs">
							<i class="menu-icon fa fa-book"></i>
							<span class="menu-text"> <spring:message code="menu.backend.catalogs"/> </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="${productMenuActive } hover">
						<a href="${cp}/admin/products">
							<i class="menu-icon fa fa-leaf"></i>
							<span class="menu-text"> <spring:message code="menu.backend.products"/> </span>
						</a>

						<b class="arrow"></b>
					</li>
					
					<li class="${imagesMenuActive } hover">
						<a href="${cp}/admin/fileupload">
							<i class="menu-icon fa fa-picture-o"></i>
							<span class="menu-text"> <spring:message code="menu.backend.product.images"/> </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="${blogMenuActive } hover">
						<a href="${cp}/admin/blogs">
							<i class="menu-icon fa fa-newspaper-o"></i>
							<span class="menu-text"> <spring:message code="menu.backend.blogs"/> </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="${transactionMenuActive } hover">
						<a href="${cp}/admin/transactions">
							<i class="menu-icon fa fa-fighter-jet"></i>
							<span class="menu-text"> <spring:message code="menu.backend.orders"/> </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="${customerMenuActive } hover">
						<a href="${cp}/admin/customers">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text"> <spring:message code="menu.backend.customers"/> </span>
						</a>

						<b class="arrow"></b>
					</li>
					
					
					<li class="${userMenuActive } ${partnerMenuActive } ${footerMenuOneActive } ${footerMenuTwoActive } hover">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-cog"></i>
							<span class="menu-text">
								Quản trị hệ thống
							</span>
							<span class="badge badge-primary">4</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu can-scroll">
							
							<li class="${userMenuActive } hover">
								<a href="${cp}/admin/users">
									<i class="menu-icon fa fa-caret-right"></i>
									<spring:message code="menu.backend.users"/>
								</a>

								<b class="arrow"></b>
							</li>

							<li class="${partnerMenuActive } hover">
								<a href="${cp}/admin/connect_link/partner">
									<i class="menu-icon fa fa-caret-right"></i>
									<spring:message code="menu.backend.partner"/>
								</a>

								<b class="arrow"></b>
							</li>
							
							<li class="${footerMenuOneActive } hover">
								<a href="${cp}/admin/connect_link/menu_footer_one">
									<i class="menu-icon fa fa-caret-right"></i>
									Menu Footer One
								</a>

								<b class="arrow"></b>
							</li>
							
							<li class="${footerMenuTwoActive } hover">
								<a href="${cp}/admin/connect_link/menu_footer_two">
									<i class="menu-icon fa fa-caret-right"></i>
									Menu Footer Two
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
               
                     <li class="${slideImageMenuActive } hover">
                        <a href="${cp}/admin/connect_link/slideImages">
                           <i class="menu-icon fa fa-paypal"></i>
                           <span class="menu-text"> Slide Image </span>
                        </a>
                        <b class="arrow"></b>
                     </li>
                     
                      <li class="${bestCatalogMenuActive } hover">
                        <a href="${cp}/admin/connect_link/bestCatalog">
                           <i class="menu-icon fa fa-paypal"></i>
                           <span class="menu-text"> Danh mục nổi bật </span>
                        </a>
                        <b class="arrow"></b>
                     </li>

					
				</ul></div></div><div class="ace-scroll nav-scroll scroll-disabled"><div class="scroll-track" style="display: none;"><div class="scroll-bar" style="transition-property: top; transition-duration: 0.1s; top: 0px;"></div></div><div class="scroll-content" style=""><div></div></div></div></div><!-- /.nav-list -->

			</div>