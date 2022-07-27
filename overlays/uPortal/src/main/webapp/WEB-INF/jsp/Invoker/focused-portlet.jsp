<%@ include file="/WEB-INF/jsp/include.jsp" %>
<c:set var="request" value="${pageContext.request}" />
<c:set var="name" value="${focusedPortletName.getInfo(request)}" />
<div class="focused-portlet"><c:if test="${not empty name}"><div class="noc-icon"></div><span class="label">${name}</span></c:if></div>
