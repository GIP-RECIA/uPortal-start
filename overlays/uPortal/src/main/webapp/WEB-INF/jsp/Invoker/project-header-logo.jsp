<%@ include file="/WEB-INF/jsp/include.jsp" %>

<c:set var="servername">${pageContext.request.serverName.replaceAll("\\.", "-")}</c:set>
<a id="projectCollectiviteLogo" class="${servername}" title="<spring:message code="go.to.home"/>" href="<c:url value="/"/>"><div class="noc-icon"></div><span class="label">LOGO-${servername}</span></a>
