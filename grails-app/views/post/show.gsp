
<%@ page import="blackboard.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-post" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list post">
			
				<g:if test="${postInstance?.postData}">
				<li class="fieldcontain">
					<span id="postData-label" class="property-label"><g:message code="post.postData.label" default="Post Data" /></span>
					
						<span class="property-value" aria-labelledby="postData-label"><g:fieldValue bean="${postInstance}" field="postData"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="post.comments.label" default="Comments" /></span>
					
						<g:each in="${postInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><%--<g:link controller="comments" action="show" id="${c.id}">${c?.commentData}</g:link>${c?.commentData}</g:link>--%>${c?.commentData}</span>
						</g:each>
					
				</li>
				</g:if>
			<div
				class="fieldcontain ${hasErrors(bean: postInstance, field: 'comments', 'error')} ">
				
				<ul class="one-to-many">
					<li class="add"><g:link controller="comments" action="create"
							params="['post.id': postInstance?.id]">
							${message(code: 'default.add.label', args: [message(code: 'comments.label', default: 'Comments')])}
						</g:link></li>
				</ul>


			</div>



		</ol>
			<g:form url="[resource:postInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
