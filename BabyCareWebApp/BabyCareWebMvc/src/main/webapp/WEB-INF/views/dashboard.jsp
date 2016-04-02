<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="url" value="${pageContext.request.contextPath}"></c:set>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<!doctype html>
<html lang="en">
<div class="wrapper">
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card ">
							<div class="header">
								<h4 class="title">Global Sales by Top Locations</h4>
								<p class="category">All products that were shipped</p>
							</div>
							<div class="content">
								<div class="row">
									<div class="col-md-5">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="flag">
																<img src="${url}/resources/assets/img/flags/US.png" />
															</div>
														</td>
														<td>USA</td>
														<td class="text-right">2.920</td>
														<td class="text-right">53.23%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${url}/resources/assets/img/flags/DE.png" />
															</div>
														</td>
														<td>Germany</td>
														<td class="text-right">1.300</td>
														<td class="text-right">20.43%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${url}/resources/assets/img/flags/AU.png" />
															</div>
														</td>
														<td>Australia</td>
														<td class="text-right">760</td>
														<td class="text-right">10.35%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${url}/resources/assets/img/flags/GB.png" />
															</div>
														</td>
														<td>United Kingdom</td>
														<td class="text-right">690</td>
														<td class="text-right">7.87%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${url}/resources/assets/img/flags/RO.png" />
															</div>
														</td>
														<td>Romania</td>
														<td class="text-right">600</td>
														<td class="text-right">5.94%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${url}/resources/assets/img/flags/BR.png" />
															</div>
														</td>
														<td>Brasil</td>
														<td class="text-right">550</td>
														<td class="text-right">4.34%</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="col-md-6 col-md-offset-1">
										<div id="worldMap" style="height: 300px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	
			</div>
		</div>
	</div>

</html>
