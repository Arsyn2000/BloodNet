<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.required{
color: red;
}
</style>
<form:form id="connectorForm" method="POST" action="shopify/create-connector/${connectorDTO.id}" commandName="connectorDTO" class="form-horizontal">
	<div class="row">
		<div class="form-group col-lg-12">
			<label class="col-sm-2">Store URL <span class="required">*</span></label>
			<div class="col-sm-8">
				<form:input type="text" placeholder="Enter Store URL" id="storeUrl" name="storeUrl" path="storeUrl" class="form-control validate[required]" />
				<span class="error"><form:errors class="text-danger" path="storeUrl" /></span>
			</div>
		</div>
		<div class="form-group col-lg-12">
			<label class="col-sm-2">API Key. <span class="required">*</span></label>
			<div class="col-sm-8">
				<form:input type="text" placeholder="Enter API Key" id="apiKey" name="apiKey" path="apiKey" class="form-control validate[required]" />
				<span class="error"><form:errors path="apiKey" class="text-danger" /></span>
			</div>
		</div>
		
		<div class="form-group col-lg-12">
			<label class="col-sm-2"> API secret. <span class="required">*</span></label>
			<div class="col-sm-8">
				<form:input type="text" placeholder="Enter API secret" path="apiSecret" id="apiSecret" name="apiSecret" class="form-control validate[required]" />
				<span class="error"><form:errors class="text-danger" path="apiSecret" /></span>
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
	
	<form:hidden path="id" id="connectorId" name="id" />
</form:form>