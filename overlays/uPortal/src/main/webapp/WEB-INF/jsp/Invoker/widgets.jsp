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

<script src="/resource-server/webjars/gip-recia__ui-webcomponents/dist/r-widgets-wrapper.js" type="module" defer></script>
<%--<script type="text/javascript" language="javascript">
  var versionUpdate = (new Date()).getTime();
  var script = document.createElement("script");
  script.type = "module";
  script.src = "${ctxPath}/scripts/r-widgets-wrapper.js?v=" + versionUpdate;
  document.body.appendChild(script);
</script>--%>

<div class="container mb widgets">
  <r-widgets-wrapper
  localization-uri="${localizationUri[0]}"
  soffit-uri="${soffitUri[0]}"
  widget-max-count="${widgetMaxCount[0]}"
  get-prefs-uri="${getPrefsUri[0]}"
  put-prefs-uri="${putPrefsUri[0]}"
  adapter-source-uri="${adapterSourceUri[0]}"
  adapter-config-uri="${adapterConfigUri[0]}"
  >
    <h1 slot="header">Bienvenue sur votre ENT, ${userInfo['displayName']}</h1>
  </r-widgets-wrapper>
</div>
