<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<c:set var="request" value="${pageContext.request}" />
<c:set var="ctxPath" value="${request.contextPath}" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="/resource-server/webjars/vue/dist/vue.min.js"></script>
<script src="/resource-server/webjars/uportal__eyebrow-user-info/dist/eyebrow-user-info.min.js" defer></script>
<%--<script type="text/javascript" language="javascript">--%>
  <%--var versionUpdate = (new Date()).getTime();--%>
  <%--var script = document.createElement("script");--%>
  <%--script.type = "module";--%>
  <%--script.src = "${ctxPath}/scripts/eyebrow-user-info.js?v=" + versionUpdate;--%>
  <%--document.body.appendChild(script);--%>
<%--</script>--%>

<c:set var="avatar">
    <c:choose>
        <c:when test="${not empty personManager.getPerson(request).getAttribute(userPictureAttributeName[0])}">
            ${personManager.getPerson(request).getAttribute(userPictureAttributeName[0])}
        </c:when>
        <c:otherwise>${alternativePicture[0]}</c:otherwise>
    </c:choose>
</c:set>

<div class="eyebrow-user-info">
    <eyebrow-user-info display-name="${userInfo['displayName']}"
                       picture="${avatar}"
                       email="${personManager.getPerson(request).getAttribute(userMailAttributeName[0])}"
                       more-link="${moreUserInfoUrl[0]}"
                       logout-link="${portalLogoutUrl[0]}"
                       avatar-size="${avatarSize[0]}"
                       menu-is-dark="true"></eyebrow-user-info>
</div>

