<%@ include file="/WEB-INF/jsp/include.jsp" %>
<c:set value="${renderRequest.contextPath}" var="portalContextPath" />
<c:set value="${url[0]}" var="redirectTo" />
<c:set value="${(empty target[0]) ? '_blank' : target[0]}" var="target"/>
<c:choose>
    <c:when test="${empty urlIconClass[0]}">
        <c:set var="urlIcon"></c:set>
    </c:when>
    <c:otherwise>
        <c:set var="urlIcon"><i class='${urlIconClass[0]}'></i></c:set>
    </c:otherwise>
</c:choose>
<c:set var="href"><a href='${redirectTo}' target='${target}' title='Redirection' onclick='jsp_invoker_redirect()' >${redirectTo}${urlIcon}</a></c:set>

<div id="jsp_invoker_redirect_${n}" class="redirect">
    <div class="alert-warning">
        <c:if test="${not empty redirectTo}">
            <div><spring:message code="jspInvoker.redirect.error.popup" arguments="${href}" htmlEscape="false"/></div>
            <script type="text/javascript">
                const pop = (url, target) => {
                    const popup = window.open(url, target);
                    return popup !== null && typeof popup !== 'undefined'
                }
                if ("${target}" == "_self") {
                    window.location.replace("${redirectTo}");
                } else if (pop("${redirectTo}", "${target}")) {
                    window.location.replace("${portalContextPath}");
                }
            </script>
        </c:if>
        <c:if test="${empty redirectTo}">
            <div><spring:message code="jspInvoker.redirect.error.configuration" /></div>
        </c:if>
    </div>
</div>

<script type="text/javascript">
    function jsp_invoker_redirect() {
        window.open('${redirectTo}', '${target}');
        window.location.replace('${portalContextPath}');
    }
</script>