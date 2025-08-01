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

<script src="/resource-server/webjars/gip-recia__ui-webcomponents/dist/components/r-wayf.js" type="module" defer></script>
<%--<script type="text/javascript" language="javascript">
  var versionUpdate = (new Date()).getTime();
  var script = document.createElement("script");
  script.type = "module";
  script.src = "${ctxPath}/scripts/r-wayf.js?v=" + versionUpdate;
  document.body.appendChild(script);
</script>--%>

<div class="container mb wayf">
  <header>
    <h1>Connectez-vous <span>&agrave; votre Espace Num&eacute;rique de Travail (ENT)</span></h1>
  </header>
  <r-wayf
    cas-url="${casRefUrlEncoder.getCasLoginUrl(request)}"
    idp-ids='${idpIds[0]}'
    svg-url="${svgUrl[0]}"
  >
  </r-wayf>
</div>

<style>
  .wayf > header > h1 {
    margin-bottom: 1.5rem;
  }

  .wayf > header > h1 > span {
    display: block;
    font-size: var(--recia-font-size-sm);
    font-weight: normal;
    line-height: 21px;
  }

  @media (width >= 768px) {
    .wayf > header h1 > span {
      display: unset;
      font-size: unset;
      font-weight: unset;
      line-height: unset;
    }
  }
</style>
