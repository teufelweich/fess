<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><la:message key="labels.admin_brand_title"/> | <la:message key="labels.file_crawling_configuration" /></title>
<jsp:include page="/WEB-INF/view/common/admin/head.jsp"></jsp:include>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/view/common/admin/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/common/admin/sidebar.jsp">
			<jsp:param name="menuCategoryType" value="crawl" />
			<jsp:param name="menuType" value="fileConfig" />
		</jsp:include>

		<div class="content-wrapper">

			<%-- Content Header --%>
			<section class="content-header">
				<h1>
					<la:message key="labels.file_crawling_title_details" />
				</h1>
				<ol class="breadcrumb">
					<li><la:link href="/admin/fileconfig">
							<la:message key="labels.file_crawling_link_list" />
						</la:link></li>
					<c:if test="${crudMode == 1}">
						<li class="active"><a href="#"><la:message key="labels.file_crawling_link_create" /></a></li>
					</c:if>
					<c:if test="${crudMode == 2}">
						<li class="active"><a href="#"><la:message key="labels.file_crawling_link_update" /></a></li>
					</c:if>
					<c:if test="${crudMode == 3}">
						<li class="active"><a href="#"><la:message key="labels.file_crawling_link_delete" /></a></li>
					</c:if>
					<c:if test="${crudMode == 4}">
						<li class="active"><a href="#"><la:message key="labels.file_crawling_link_confirm" /></a></li>
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
					<la:hidden property="sortOrder"/>
					<div class="row">
						<div class="col-md-12">
							<div class="box box-primary">
								<%-- Box Header --%>
								<div class="box-header with-border">
									<h3 class="box-title">
										<c:if test="${crudMode == 1}">
											<la:message key="labels.file_crawling_link_create" />
										</c:if>
										<c:if test="${crudMode == 2}">
											<la:message key="labels.file_crawling_link_update" />
										</c:if>
									</h3>
									<div class="box-tools pull-right">
										<span class="label label-default"><la:link href="/admin/fileconfig">
												<la:message key="labels.file_crawling_link_list" />
											</la:link></span>
									</div>
								</div>
								<%-- Box Body --%>
								<div class="box-body">
									<%-- Message --%>
									<div>
										<la:info id="msg" message="true">
											<div class="alert alert-info">
												${msg}
											</div>
										</la:info>
										<la:errors />
									</div>

									<%-- Form Fields --%>

									<%-- Form Fields --%>
									<div class="form-group">
										<label for="name"><la:message key="labels.name" /></label>
										<la:text property="name" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="paths"><la:message key="labels.paths" /></label>
										<la:textarea property="paths" styleClass="form-control" rows="5" />
									</div>
									<div class="form-group">
										<label for="includedPaths"><la:message key="labels.included_paths" /></label>
										<la:textarea property="includedPaths" styleClass="form-control" rows="5" />
									</div>
									<div class="form-group">
										<label for="excludedPaths"><la:message key="labels.excluded_paths" /></label>
										<la:textarea property="excludedPaths" styleClass="form-control" rows="5" />
									</div>
									<div class="form-group">
										<label for="includedDocPaths"><la:message key="labels.included_doc_paths" /></label>
										<la:textarea property="includedDocPaths" styleClass="form-control" rows="5" />
									</div>
									<div class="form-group">
										<label for="excludedDocPaths"><la:message key="labels.excluded_doc_paths" /></label>
										<la:textarea property="excludedDocPaths" styleClass="form-control" rows="5" />
									</div>
									<div class="form-group">
										<label for="configParameter"><la:message key="labels.config_parameter" /></label>
										<la:text property="configParameter" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="depth"><la:message key="labels.depth" /></label>
										<la:text property="depth" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="maxAccessCount"><la:message key="labels.max_access_count" /></label>
										<la:text property="maxAccessCount" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="numOfThread"><la:message key="labels.number_of_thread" /></label>
										<la:text property="numOfThread" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="intervalTime"><la:message key="labels.interval_time" /></label>
										<div class="form-inline">
											<la:text property="intervalTime" styleClass="form-control" />
											<la:message key="labels.millisec" />
										</div>
									</div>
									<div class="form-group">
										<label for="boost"><la:message key="labels.boost" /></label>
										<la:text property="boost" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="roleTypeIds"><la:message key="labels.role_type" /></label>
										<la:select property="roleTypeIds" multiple="true" styleClass="form-control">
											<c:forEach var="rt" varStatus="s" items="${roleTypeItems}">
												<la:option value="${f:u(rt.id)}">${f:h(rt.name)}</la:option>
											</c:forEach>
										</la:select>
									</div>
									<div class="form-group">
										<label for="roleTypeIds"><la:message key="labels.label_type" /></label>
										<la:select property="labelTypeIds" multiple="true" styleClass="form-control">
											<c:forEach var="l" varStatus="s" items="${labelTypeItems}">
												<la:option value="${f:u(l.id)}">${f:h(l.name)}</la:option>
											</c:forEach>
										</la:select>
									</div>
									<div class="form-group">
										<label for="available"><la:message key="labels.available" /></label>
										<la:select property="available" styleClass="form-control">
											<la:option value="true">
												<la:message key="labels.enabled" />
											</la:option>
											<la:option value="false">
												<la:message key="labels.disabled" />
											</la:option>
										</la:select>
									</div>
								</div>

								<%-- Box Footer --%>
								<div class="box-footer">
									<c:if test="${crudMode == 1}">
										<button type="submit" class="btn" name="back"
											value="<la:message key="labels.file_crawling_button_back" />">
											<la:message key="labels.file_crawling_button_back" />
										</button>
										<button type="submit" class="btn btn-success"
											name="confirmfromcreate"
											value="<la:message key="labels.file_crawling_button_create" />">
											<la:message key="labels.file_crawling_button_create" />
										</button>
									</c:if>
									<c:if test="${crudMode == 2}">
										<button type="submit" class="btn" name="back"
											value="<la:message key="labels.file_crawling_button_back" />">
											<la:message key="labels.file_crawling_button_back" />
										</button>
										<button type="submit" class="btn btn-warning"
											name="confirmfromupdate"
											value="<la:message key="labels.file_crawling_button_confirm" />">
											<la:message key="labels.file_crawling_button_confirm" />
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