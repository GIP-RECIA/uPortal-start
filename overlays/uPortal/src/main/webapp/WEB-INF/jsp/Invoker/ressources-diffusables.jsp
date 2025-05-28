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

<script src="/resource-server/webjars/gip-recia__ui-ressources-gar/dist/ui-ressources-gar.min.js" type="module" defer></script>
<%--script type="text/javascript" language="javascript">
  var versionUpdate = (new Date()).getTime();
  var script = document.createElement("script");
  script.type = "module";
  script.src = "${ctxPath}/scripts/ui-ressources-gar.js?v=" + versionUpdate;
  document.body.appendChild(script);
</script--%>

<div class="ui-ressources-gar">
  <ui-ressources-gar
    base-api-url="${baseApiUrl[0]}"
    ressources-diffusables-api-uri="${ressourcesDiffusablesApiUri[0]}"
    user-info-api-url="${userInfoApiUrl[0]}"
    resources-per-page-default="${resourcesPerPageDefault[0]}"
  />
</div>


<%--style>
ui-ressources-gar {
  font-family: DM Sans,"sans-serif";
  font-style: normal;
  font-weight: 400;
  font-size: var(--recia-body-font-size);
  letter-spacing: 0;
  color: var(--recia-body-color);

  --ui-ressources-gar-button-border-radius: 16px;
  --ui-ressources-gar-card-border-radius: 16px;
  --ui-ressources-gar-margin: 18px;
  --ui-ressources-gar-padding: 16px;

}
</style--%>
