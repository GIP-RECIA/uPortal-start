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
<c:set var="uid" value="${personManager.getPerson(request).getAttribute('uid')}" />
<c:set var="dnmaId" value="${personManager.getPerson(request).getAttribute('DNMAId')}" />
<c:set var="siren" value="${transformUserAttributes.processAttribute('ENTPersonStructRattach', personManager.getPerson(request).getAttribute('ENTPersonStructRattach'))}" />
<c:set var="uai" value="${personManager.getPerson(request).getAttribute('ESCOUAICourant')}" />
<c:set var="type" value="${transformUserAttributes.processAttribute('objectClass', personManager.getPerson(request).getAttributeValues('objectClass'))}" />

<div style="display:none;">
    <script type="text/javascript" src="/esciti/js/esciti.js"></script>
    <script type="text/javascript">
      try {
        var X=InfoENT4esciti;
        X.setUid('${uid}','${dnmaId}');
        X.setSiren('${siren}');
        X.setUai('${uai}');
        X.setObjectClass('${type}');
      } catch (e) {}
    </script>
    <script type="text/javascript" defer>
      try {
        if (! InfoENT4esciti.callByContextInCssClass('%portletPortail')){
          InfoENT4esciti.callByService("Page_ENT");
        }
        InfoENT4esciti.marqueOnClick('%ancrePortail');
      } catch (e) {}
    </script>
</div>

<script type="text/javascript" src="/esciti/dnma/dnma.js?v=<%= System.currentTimeMillis() / (1000 * 3600 * 24) %>"></script>

<script type="text/javascript">
  try {
    if (ENT4DNMA) {
      ENT4DNMA.markPage('Portail');
      ENT4DNMA.markOnEvent('click-portlet-card');
      ENT4DNMA.markOnEvent('favorite-event');
      ENT4DNMA.markOnEvent('service-event');
      ENT4DNMA.markOnEvent('service-info-event');
      ENT4DNMA.markOnEvent('search-event');
      ENT4DNMA.markOnEvent('open-more');
      ENT4DNMA.markOnEvent('DNMA-ACTUS-DOCS');
    }
  } catch (e) {
    console.info('DNMA is not available');
  }
</script>
