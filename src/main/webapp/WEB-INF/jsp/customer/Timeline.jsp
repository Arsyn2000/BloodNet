<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html lang="en">

<%@ include file="head.jspf"%>

<body>
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
		<%@ include file="header.jspf"%>
		<div class="boxed">
			<div id="content-container">
				<div id="page-title">
					<h1 class="page-header text-overflow">Ecommelite Release Notes</h1>
				</div>
				<div id="page-content">
					<div class="timeline two-column">
						<div class="timeline-header">
							<div class="timeline-header-title bg-success">Now</div>
						</div>
						<c:forEach items="${listOfReleaseNotes}" var="releaseNotes"> 
							<div class="timeline-entry">
								<div class="timeline-stat">
									<div class="timeline-time">
										${releaseNotes.updateDate}
									</div>
								</div>
								<div class="timeline-label">
									<h4 class="mar-no pad-btm">
										<a class="text-danger" href="#">App Name : ${releaseNotes.app}</a>
									</h4>
									${releaseNotes.feature_detail}
								</div>
							</div>
						</c:forEach>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<%@ include file="aside.jspf"%>
			<%@ include file="menu.jspf"%>
		</div>
		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>
		<%@ include file="footer.jspf"%>
		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>

	</div>
</body>
</html>

