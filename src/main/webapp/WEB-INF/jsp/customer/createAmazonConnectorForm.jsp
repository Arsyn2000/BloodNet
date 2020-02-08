<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.required{
color: red;
}
</style>
<form:form id="connectorForm" method="POST" action="amazon/create-connector" commandName="connectorDTO" class="form-horizontal">
	<div class="row">
		<div class="form-group col-lg-12">
			<label class="col-sm-2">Access Key <span class="required">*</span></label>
			<div class="col-sm-8">
				<form:input type="text" placeholder="Enter Amazon Access Key" id="accessKey" name="accessKey" path="accessKey" class="form-control validate[required]" />
				<span class="error"><form:errors class="text-danger" path="accessKey" /></span>
			</div>
		</div>
		<div class="form-group col-lg-12">
			<label class="col-sm-2">Access Secret <span class="required">*</span></label>
			<div class="col-sm-8">
				<form:input type="text" placeholder="Enter Amazon Access Secret" id="secret" name="secret" path="secret" class="form-control validate[required]" />
				<span class="error"><form:errors path="secret" class="text-danger" /></span>
			</div>
		</div>
		
		<div class="form-group col-lg-12">
			<label class="col-sm-2"> Merchant Id <span class="required">*</span></label>
			<div class="col-sm-8">
				<form:input type="text" placeholder="Enter Merchant Id" path="marchantId" id="marchantId" name="marchantId" class="form-control validate[required]" />
				<span class="error"><form:errors class="text-danger" path="marchantId" /></span>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<span id="showMsg" class="error"></span>
		</div>
	</div>
	<div class="hr-line-dashed"></div>
	
</form:form>