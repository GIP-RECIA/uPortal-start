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

<script src="/resource-server/webjars/gip-recia__menu-cantine/dist/menu-cantine.min.js" defer></script>
<%--<script type="text/javascript" language="javascript">
  var versionUpdate = (new Date()).getTime();
  var script = document.createElement("script");
  script.type = "module";
  script.src = "${ctxPath}/scripts/menu-cantine.js?v=" + versionUpdate;
  document.body.appendChild(script);
</script>--%>

<div class="menu-cantine">
    <menu-cantine-menu-semaine 
        app-user-info-uri="${userInfoUri[0]}"
        app-url-img="${urlImg[0]}"
        app-url-rest-api="${urlRestApi[0]}"
        app-url-api-etab="${urlApiEtab[0]}">
    </menu-cantine-menu-semaine>
</div>
