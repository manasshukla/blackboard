<%@ page import="blackboard.Comments" %>



<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'commentData', 'error')} required">
	<label for="commentData">
		<g:message code="comments.commentData.label" default="Comment Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="commentData" required="" value="${commentsInstance?.commentData}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="comments.post.label" default="Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="post" name="post.id" from="${blackboard.Post.list()}" optionKey="id" required="" value="${commentsInstance?.post?.postData}" class="many-to-one"/>

</div>

