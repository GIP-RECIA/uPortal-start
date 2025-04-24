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

<%@ page import = "java.util.Map" %>
<%
    boolean isBase64 = false ;
    boolean mustRedirect = false;
    String redirectValue = "";
    Map<String, String[]> parameters = request.getParameterMap();
    for(Map.Entry<String, String[]> entry : parameters.entrySet()){
      if(entry.getKey().toLowerCase().contains("redirect")){
        redirectValue = "";
        for(String value : entry.getValue()){
          redirectValue = value;
          mustRedirect = true;
          break;
        }
      } else if (entry.getKey().toLowerCase().contains("base64")) {
        isBase64 = true ;
        for(String value : entry.getValue()){
          if(value.equals("false")){
            isBase64 = false;
          }
          break;
        }
      }
    }
%>

<c:set var="isRedirect">
    <%= mustRedirect %>
</c:set>

<c:set var="resourceId">
    <%= redirectValue %>
</c:set>

<c:set var="isBase64">
    <%= isBase64 %>
</c:set>

<script src="/resource-server/webjars/gip-recia__mediacentre-ui/dist/mediacentre-ui.min.js" type="module" defer></script>
<%--script type="text/javascript" language="javascript">
  var versionUpdate = (new Date()).getTime();
  var script = document.createElement("script");
  script.type = "module";
  script.src = "${ctxPath}/scripts/mediacentre-ui.js?v=" + versionUpdate;
  document.body.appendChild(script);
</script--%>

<c:choose>
    <c:when test="${isRedirect == false}">
      <div class="mediacentre-ui">
        <mediacentre-ui
            base-api-url="${baseApiUrl[0]}"
            config-api-url="${configApiUrl[0]}"
            gestion-api-url="${gestionApiUrl[0]}"
            user-info-api-url="${userInfoApiUrl[0]}"
            user-rights-api-url="${userRightsApiUrl[0]}"
            get-user-favorite-resources-url="${getUserFavoriteResourcesUrl[0]}"
            put-user-favorite-resources-url="${putUserFavoriteResourcesUrl[0]}"
            fname-mediacentre-ui="Mediacentre"
            uai-current="${uaiCurrent[0]}"
            uai="${uai[0]}"
            help-location="${helpLocation[0]}"
        />
       </div>
    </c:when>
    <c:otherwise>
      <div class="mediacentre-redirect">
        <mediacentre-redirect
            base-api-url="${baseApiUrl[0]}"
            config-api-url="${configApiUrl[0]}"
            user-info-api-url="${userInfoApiUrl[0]}"
            user-rights-api-url="${userRightsApiUrl[0]}"
            resource-id="${resourceId}"
            is-base64="${isBase64}"
        />
      </div>
    </c:otherwise>
</c:choose>
