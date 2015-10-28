<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><la:message key="labels.admin_brand_title" /> | <la:message
		key="labels.file_authentication_configuration" /></title>
<jsp:include page="/WEB-INF/view/common/admin/head.jsp"></jsp:include>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/view/common/admin/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/common/admin/sidebar.jsp">
			<jsp:param name="menuCategoryType" value="crawl" />
			<jsp:param name="menuType" value="fileAuthentication" />
		</jsp:include>

		<div class="content-wrapper">

			<%-- Content Header --%>
			<section class="content-header">
				<h1>
					<la:message key="labels.file_authentication_title_details" />
				</h1>
				<ol class="breadcrumb">
					<li><la:link href="/admin/fileauthentication">
							<la:message key="labels.file_authentication_link_list" />
						</la:link></li>
					<c:if test="${crudMode == 1}">
						<li class="active"><a href="#"><la:message
									key="labels.file_authentication_link_create" /></a></li>
					</c:if>
					<c:if test="${crudMode == 2}">
						<li class="active"><a href="#"><la:message
									key="labels.file_authentication_link_update" /></a></li>
					</c:if>
					<c:if test="${crudMode == 3}">
						<li class="active"><a href="#"><la:message
									key="labels.file_authentication_link_delete" /></a></li>
					</c:if>
					<c:if test="${crudMode == 4}">
						<li class="active"><a href="#"><la:message
									key="labels.file_authentication_link_confirm" /></a></li>
					</c:if>
				</ol>
			</section>

			<section class="content">

				<%-- Form --%>
				<la:form>
					<la:hidden property="crudMode" />
					<c:if test="${crudMode==2}">
						<la:hidden property="id" />
						<la:hidden property="versionNo" />
					</c:if>
					<la:hidden property="createdBy" />
					<la:hidden property="createdTime" />

					<div class="row">
						<div class="col-md-12">
							<div class="box box-primary">
								<%-- Box Header --%>
								<div class="box-header with-border">
									<h3 class="box-title">
										<c:if test="${crudMode == 1}">
											<la:message key="labels.file_authentication_link_create" />
										</c:if>
										<c:if test="${crudMode == 2}">
											<la:message key="labels.file_authentication_link_update" />
										</c:if>
									</h3>
									<div class="box-tools pull-right">
										<span class="label label-default"><la:link
												href="/admin/fileauthentication">
												<la:message key="labels.file_authentication_link_list" />
											</la:link></span>
									</div>
								</div>
								<%-- Box Body --%>
								<div class="box-body">
									<%-- Message --%>
									<div>
										<la:info id="msg" message="true">
											<div class="alert alert-info">${msg}</div>
										</la:info>
										<la:errors />
									</div>

									<%-- Form Fields --%>
									<div class="form-group">
										<label for="hostname"><la:message
												key="labels.file_authentication_hostname" /></label>
										<la:text property="hostname" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="port"><la:message
												key="labels.file_authentication_port" /></label>
										<la:text property="port" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="protocolScheme"><la:message
												key="labels.file_authentication_scheme" /></label>
										<la:select property="protocolScheme" styleClass="form-control">
											<c:forEach var="item" items="${protocolSchemeItems}">
												<la:option value="${f:u(item.value)}">${f:h(item.label)}</la:option>
											</c:forEach>
										</la:select>
									</div>
									<div class="form-group">
										<label for="username"><la:message
												key="labels.file_authentication_username" /></label>
										<la:text property="username" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="password"><la:message
												key="labels.file_authentication_password" /></label>
										<la:password property="password" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="parameters"><la:message
												key="labels.file_authentication_parameters" /></label>
										<la:textarea property="parameters" styleClass="form-control"
											rows="5" />
									</div>
									<div class="form-group">
										<label for="fileConfigId"><la:message
												key="labels.file_authentication_file_crawling_config" /></label>
										<la:select property="fileConfigId" styleClass="form-control">
											<c:forEach var="item" items="${fileConfigItems}">
												<la:option value="${f:u(item.value)}">${f:h(item.label)}</la:option>
											</c:forEach>
										</la:select>
									</div>
								</div>

								<%-- Box Footer --%>
								<div class="box-footer">
									<c:if test="${crudMode == 1}">
										<button type="submit" class="btn" name="back"
											value="<la:message key="labels.file_authentication_button_back" />">
											<la:message key="labels.file_authentication_button_back" />
										</button>
										<button type="submit" class="btn btn-success"
											name="confirmfromcreate"
											value="<la:message key="labels.file_authentication_button_create" />">
											<la:message key="labels.file_authentication_button_create" />
										</button>
									</c:if>
									<c:if test="${crudMode == 2}">
										<button type="submit" class="btn" name="back"
											value="<la:message key="labels.file_authentication_button_back" />">
											<la:message key="labels.file_authentication_button_back" />
										</button>
										<button type="submit" class="btn btn-warning"
											name="confirmfromupdate"
											value="<la:message key="labels.file_authentication_button_confirm" />">
											<la:message key="labels.file_authentication_button_confirm" />
										</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</la:form>

			</section>
		</div>

		<jsp:include page="/WEB-INF/view/common/admin/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/view/common/admin/foot.jsp"></jsp:include>
</body>
</html>