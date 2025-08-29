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
<c:set var="uai" value="${personManager.getPerson(request).getAttribute('ESCOUAICourant')}" />
<c:set var="departement" value="${fn:substring(uai,1,3)}" />

<div style="display:none;">
  <c:choose>
    <c:when test="${departement == '18'}">
      <script src="https://chatboxv2.clevy.io/script.min.js?token=${token18[0]}" id="clevy-chatbox" data-logo-url="https://cdn.clevy.io/customerdata/cned/logo-jules.png" async></script>
    </c:when>
    <c:when test="${departement == '28'}">
      <script src="https://chatboxv2.clevy.io/script.min.js?token=${token28[0]}" id="clevy-chatbox" data-logo-url="https://cdn.clevy.io/customerdata/cned/logo-jules.png" async></script>
    </c:when>
    <c:when test="${departement == '36'}">
      <script src="https://chatboxv2.clevy.io/script.min.js?token=${token36[0]}" id="clevy-chatbox" data-logo-url="https://cdn.clevy.io/customerdata/cned/logo-jules.png" async></script>
    </c:when>
    <c:when test="${departement == '37'}">
      <script src="https://chatboxv2.clevy.io/script.min.js?token=${token37[0]}" id="clevy-chatbox" data-logo-url="https://cdn.clevy.io/customerdata/cned/logo-jules.png" async></script>
    </c:when>
    <c:when test="${departement == '41'}">
      <script src="https://chatboxv2.clevy.io/script.min.js?token=${token41[0]}" id="clevy-chatbox" data-logo-url="https://cdn.clevy.io/customerdata/cned/logo-jules.png" async></script>
    </c:when>
    <c:when test="${departement == '45'}">
      <script src="https://chatboxv2.clevy.io/script.min.js?token=${token45[0]}" id="clevy-chatbox" data-logo-url="https://cdn.clevy.io/customerdata/cned/logo-jules.png" async></script>
    </c:when>
    <c:otherwise><span>Jules ne peut s'afficher car aucun d&eacute;partement n'a &eacute;t&eacute; obtenu.</span></c:otherwise>
  </c:choose>
</div>

<style>
.l-clevy-chatbox {
  z-index: 1 !important;
}
</style>
