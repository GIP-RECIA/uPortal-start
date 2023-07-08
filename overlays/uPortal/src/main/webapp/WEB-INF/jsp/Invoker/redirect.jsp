<%@ include file="/WEB-INF/jsp/include.jsp" %>
<c:set value="${renderRequest.contextPath}" var="portalContextPath" />

<script type="text/javascript">
    window.open("${url[0]}", "_blank");
    window.location.replace("${portalContextPath}");
</script>

