<%@ page import="blackboard.Post" %>



<%--<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="post.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${postInstance?.comments?}" var="c">
    <li><g:link controller="comments" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comments" action="create" params="['post.id': postInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comments.label', default: 'Comments')])}</g:link>
</li>
</ul>


</div>

--%><div class="fieldcontain ${hasErrors(bean: postInstance, field: 'postData', 'error')} required">
	<label for="postData">
		<g:message code="post.postData.label" default="Post Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="postData" required="" value="${postInstance?.postData}"/>

</div>

