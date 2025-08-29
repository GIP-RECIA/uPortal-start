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
<c:set var="mail" value="${personManager.getPerson(request).getAttribute('mail')}" />

<div>
  <script type="text/javascript" src="https://webchat.wikit.ai/webchat-embed.js" id="wikit-chatbox" />    
  <script type="text/javascript" >
    wrapWebchat({
        color: '#243469', // La couleur d'arrière plan du bouton de chat et du bandeau en haut de la fenêtre.
        webchatParams: { // Ces paramètres permettront d'identifier l'utilisateur.
          userId: '${mail}', // À DÉFINIR DYNAMIQUEMENT PAR L'APPLICATION APPELANTE
          userIdType: 'email', // À POSITIONNER : login OU email
          userFirstName: "", // À DÉFINIR DYNAMIQUEMENT PAR L'APPLICATION APPELANTE (OU LAISSER VIDE)
          userLastName: "", // À DÉFINIR DYNAMIQUEMENT PAR L'APPLICATION APPELANTE (OU LAISSER VIDE)
          webChatToken: 'NDMwNTNkOTAtOGE4Yy00YTAxLWI5NjYtY2FkN2U3MzE2Yzg2LTE2NjAwNTYxOTczMzU=',
          originId: '', // Indique l'endroit où est intégré le webchat (Information qui peut être retrouvée dans l'entraînement),
          customParams: {}, // Des paramètres personnalisés à ajouter dans l'url du chatbot,
          persona: null, // Le nom du persona à utiliser (optionnel)
        },
        height: '80%', // La hauteur de la fenêtre.
        width: '30%', // La largeur de la fenêtre.
        chatButtonIcon: { // Paramétrage du bouton de chat.
          url: null, // Ajouter une image en arrière plan du bouton de chat.
          altText: null, // Text alternatif pour l'image (accessibilité).
          height: '50px', // Hauteur du bouton de chat.
          width: '50px', // Largeur du bouton de chat.
          borderRadius: '50%', // Rayon de la bordure du bouton de chat.
        },
        chatButtonTooltip: { // Afficher une bulle de texte à côté du bouton de chat.
          text: null, // Le texte du message
          backgroundColor: null, // La couleur d'arrière plan.
          textColor: null, // La couleur du texte.
          visibility: 'hidden', // La visibilité de la bulle au passage de la souris ('hidden') ou tout le temps ('visible').
        },
        chatButtonAnimation: { // Animation du bouton de chat
          delay: null, // Délais en millisecondes après lequel le bouton s'anime
          enabled: false, // Active l'animation
          openTooltip: false // Ouvre l'info-bulle après l'animation
        },
        headerButtons: { // Le texte d'accessibilité des boutons au haut de la fenêtre du webchat.
          color: '#fff',
          closeIconDescription: 'Fermer la fenêtre',
          launchIconDescription: 'Ouvrir dans un nouvel onglet',
          maximizeIconDescription: 'Agrandir la fenêtre',
          minimizeIconDescription: 'Rétrécir la fenêtre',
        },
        opening: { // L'état (ouvert / fermé) du webchat en arrivant sur la page. Noter qu'une ouverture automatique n`'est pas possible sur mobile.
          mode: 'close', // 3 modes possibles, ouvert ('open'), fermé ('close') ou ouvert après un délais ('delay').
          delay: null, // Le délais en millisecondes pour l'ouverture du webchat.
          memorize: true, // Mémoriser l'état d'ouverture du webchat.
        },
        position: { // La position du bouton de chat et du webchat dans le navigateur.
          right: '1rem',
          bottom: '1rem',
        },
      });
  </script>    
</div>