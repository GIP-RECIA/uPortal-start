<%@ include file="/WEB-INF/jsp/include.jsp" %>

<c:set var="request" value="${pageContext.request}" />
<c:set var="profils" value="${fn:join(personManager.getPerson(request).getAttributeValues('ENTPersonProfils'), ' ')}" />

<div id="Numeritheque18">
  <div id="container">
    <div>
      <p style="text-align: center;"><img alt="La numérithèque du Cher" src="https://www.chercan.fr/numeritheque_clg18/images/bandeauNumerithequeCher.jpg" style="max-width: 100%; border-radius: 5px;" /></p>

      <p>Dans le cadre de sa strat&eacute;gie d&eacute;partementale du num&eacute;rique &eacute;ducatif, en collaboration avec l&rsquo;Education Nationale, le conseil d&eacute;partemental propose un pr&ecirc;t de mat&eacute;riel num&eacute;rique innovant permettant aux &eacute;l&egrave;ves et enseignants de d&eacute;couvrir, tester et exp&eacute;rimenter de nouvelles m&eacute;thodes p&eacute;dagogiques. La num&eacute;rith&egrave;que du Cher s&rsquo;efforce de contribuer au d&eacute;veloppement des comp&eacute;tences num&eacute;riques des &eacute;l&egrave;ves et des enseignants.</p>
    </div>

    <section id="RessourcesDisponibles">
      <h2>Les ressources disponibles</h2>

      <div class="list vertical">
        <article class="card">
          <header>
            <h3>2 kit webTV</h3>
          </header>
          <div class="content">
            <img alt="Kit webTV" src="https://www.chercan.fr/numeritheque_clg18/images/webTV_vignette.png" style="height: 150px;" />
          </div>
          <footer>
            <a href="https://www.chercan.fr/numeritheque_clg18/files/webTVPadcaster.pdf" target="_blank" title="Fiche descriptive du kit webTV">Acc&eacute;der &agrave; la fiche descriptive</a>
          </footer>
        </article>

        <article class="card">
          <header>
            <h3>2 valises de 4 robots mBot</h3>
          </header>
          <div class="content">
            <img alt="Robots mBot" src="https://www.chercan.fr/numeritheque_clg18/images/robotsMbot_vignette.jpg" style="height: 150px;" />
          </div>
          <footer>
            <a href="https://www.chercan.fr/numeritheque_clg18/files/robotsMbot.pdf" target="_blank" title="Fiche descriptive du robot mBot">Acc&eacute;der &agrave; la fiche descriptive</a>
          </footer>
        </article>

        <article class="card">
          <header>
            <h3>1 Imprimante 3D</h3>
          </header>
          <div class="content">
            <img alt="Imprimante 3D" src="https://www.chercan.fr/numeritheque_clg18/images/imprimante3D_vignette.png" style="height: 150px;" />
          </div>
          <footer>
            <a href="https://www.chercan.fr/numeritheque_clg18/files/Imprimante3D.pdf" target="_blank" title="Fiche descriptive de l'imprimante 3D">Acc&eacute;der &agrave; la fiche descriptive</a>
          </footer>
        </article>

        <article class="card">
          <header>
            <h3>8 Micro visualiseurs</h3>
          </header>
          <div class="content">
            <img alt="Micro visualiseurs" src="https://www.chercan.fr/numeritheque_clg18/images/microVisualiseur_vignette.jpg" style="height: 150px;" />
          </div>
          <footer>
            <a href="https://www.chercan.fr/numeritheque_clg18/files/microVisualiseur.pdf" target="_blank" title="Fiche descriptive du micro visualisateur">Acc&eacute;der &agrave; la fiche descriptive</a>
          </footer>
        </article>

        <article class="card">
          <header>
            <h3>2 bo&icirc;tes de L&eacute;go &eacute;ducation Spike Prime</h3>
          </header>
          <div class="content">
            <img alt="Boîte de Légo éducation Spike Prime" src="https://www.chercan.fr/numeritheque_clg18/images/legoEducation_vignette.jpg" style="height: 150px;" />
          </div>
          <footer>
            <a href="https://www.chercan.fr/numeritheque_clg18/files/legoEducation.pdf" target="_blank" title="Fiche descriptive de la boite de légo éducation">Acc&eacute;der &agrave; la fiche descriptive</a>
          </footer>
        </article>

        <article class="card">
          <header>
            <h3>2 valises de 6 Robots Thymio AI</h3>
          </header>
          <div class="content">
            <img alt="Robot Thymio" src="https://www.chercan.fr/numeritheque_clg18/images/robotThymio_vignette.png" style="height: 150px;" />
          </div>
          <footer>
            <a href="https://www.chercan.fr/numeritheque_clg18/files/robotThymioAI.pdf" target="_blank" title="Fiche descriptive du robot Thymio">Acc&eacute;der &agrave; la fiche descriptive</a>
          </footer>
        </article>

        <article class="card">
          <header>
            <h3>2 Studio d&rsquo;animation HUE</h3>
          </header>
          <div class="content">
            <img alt="Studio d’animation HUE" src="https://www.chercan.fr/numeritheque_clg18/images/studioAnimationHUE_vignette.png" style="height: 150px;" />
          </div>
          <footer>
            <a href="https://www.chercan.fr/numeritheque_clg18/files/studioAnimationHUE.pdf" target="_blank" title="Fiche descriptive su studio d'animation">Acc&eacute;der &agrave; la fiche descriptive</a>
          </footer>
        </article>
      </div>
    </section>

    <div>
      <p>L&rsquo;emprunt est r&eacute;serv&eacute; aux enseignants des coll&egrave;ges publics du Cher.</p>

      <h2>Sous quelles modalit&eacute;s ?</h2>

      <ol>
        <li>Le chef d&rsquo;&eacute;tablissement, le Principal adjoint ou le Secr&eacute;taire G&eacute;n&eacute;ral r&eacute;serve le mat&eacute;riel<span class="d-none ${profils}"> via <a href="https://www.chercan.fr/grr2/grr_cd18/" title="Réservation d'une ressource de la numérithèque">l&rsquo;outil de gestion et de r&eacute;servation des ressources (GRR)</a></span>.<br />
        La dur&eacute;e d&rsquo;emprunt est d&rsquo;un, deux ou trois trimestres.</li>
        <li>Le chef d&rsquo;&eacute;tablissement re&ccedil;oit, apr&egrave;s validation de l&rsquo;emprunt par le conseil d&eacute;partemental, une convention de pr&ecirc;t &agrave; retourner sign&eacute;e par mail : <a href="mailto:numeritheque@departement18.fr" target="a_blank" title="numeritheque@departement18.fr">numeritheque@departement18.fr</a>.<br />
        <strong>Attention</strong>, cette convention doit &ecirc;tre valid&eacute;e en conseil d&rsquo;administration.</li>
        <li>Le retrait et la restitution des &eacute;quipements sont assur&eacute;s par l&rsquo;emprunteur au Conseil D&eacute;partemental &ndash; DEJS- Pyramide B &ndash; route de Guerry &agrave; Bourges.<br />
        <strong>Il est indispensable de prendre rendez-vous au pr&eacute;alable pour le retrait et le retour du mat&eacute;riel par mail</strong> : <a href="mailto:numeritheque@departement18.fr" target="a_blank" title="numeritheque@departement18.fr">numeritheque@departement18.fr</a></li>
        <li>A l&rsquo;issue du pr&ecirc;t, un bilan d&rsquo;utilisation, co-exploit&eacute; par le Conseil D&eacute;partemental et la D&eacute;l&eacute;gation Acad&eacute;mique du Num&eacute;rique Educatif, doit &ecirc;tre compl&eacute;t&eacute; par les enseignants.</li>
      </ol>

      <h2>Quel accompagnement ?</h2>
      Afin de permettre une prise en main des &eacute;quipements et en fonction du mat&eacute;riel emprunt&eacute;, la formation sera assur&eacute;e par la DRANE ou par le R&eacute;seau Canop&eacute;.<br />
      <strong>Il convient de d&eacute;poser une demande de formation &agrave; initiative &eacute;tablissement (FIE) conjointement &agrave; la demande d&rsquo;emprunt</strong> afin de r&eacute;duire les d&eacute;lais d&rsquo;interventions.
    </div>

    <p>&nbsp;</p>

    <div style="text-align: center; background-color: #ffffff; padding-top: 1em; padding-bottom: 1em; border-radius: 5px;">
      <a href="https://www.ac-orleans-tours.fr/" target="_blank" title="Académie Orléans-Tours"><img alt="Logo académie Orléans-Tours" src="https://www.chercan.fr/numeritheque_clg18/images/logoAcademieOT.jpg" style="margin-right: 2em;" /></a>
      <a href="https://www.departement18.fr/" target="_blank" title="Le département du Cher"><img alt="Logo du département du Cher" src="https://www.chercan.fr/numeritheque_clg18/images/logoDepartement18.jpg" /></a>
    </div>

    <p>&nbsp;</p>

  </div>
</div>

<style type="text/css">
  #Numeritheque18 h2,
  #Numeritheque18 h3 {
    font-weight: 900;
  }

  #Numeritheque18 #container {
    max-width: 1920px;
    margin: 0 auto;
  }

  #Numeritheque18 #container section {
    margin-top: 30px;
  }

  #Numeritheque18 #container section header {
    text-transform: uppercase;
    color: #131313;
  }

  #Numeritheque18 #container section .list {
    display: flex;
    flex-wrap: wrap;
  }
  #Numeritheque18 #container section .list.vertical {
    flex-direction: row;
    justify-content: space-evenly;
  }

  #Numeritheque18 #container section .list.vertical article {
    flex-direction: column;
    flex-wrap: nowrap;
    flex-basis: 220px;
    max-width: 220px;
  }

  #Numeritheque18 #container section .list.vertical article header {
    min-height: 70px;
  }

  #Numeritheque18 #container section .list.vertical article .content {
    border-top: 1px solid #dedede;
        text-align: center;
  }

  #Numeritheque18 #container section .list article {
    display: flex;
    flex: 1;
    margin: 10px;
    border-radius: 5px;
    overflow: hidden;
    box-shadow: 0px 0px 2px #c5c5c5;
    background-color: #ffffff;
  }

  #Numeritheque18 #container section .list article:hover {
    box-shadow: 0px 0px 8px #c5c5c5;
  }

  #Numeritheque18 #container section .list article header {
    display: flex;
    flex: 0 0;
    justify-content: center;
    align-items: center;
    padding: 10px;
    background-color: #004899;
    text-align: center;
  }

  #Numeritheque18 #container section .list article header h3 {
    color: #FFFFFF;
    margin: auto;
  }

  #Numeritheque18 #container section .list article .content {
    flex: auto;
    padding: 10px;
  }

  #Numeritheque18 #container section .list article footer {
    padding: 10px;
  }

  #Numeritheque18 #container section .list article footer a {
    display: flex;
    justify-content: center;
    flex-direction: row;
    padding: 10px;
    border: 2px solid #004899;
    border-radius: calc(2em + 5px);
    background-color: var(--tpl-secondary-color, #dedede);
    color: #004899;
    text-decoration: none;
    text-align: center;
  }

  #Numeritheque18 #container section .list article footer a:hover {
    background-color: #004899;
    color: #ffffff;
  }

  #Numeritheque18 #container .d-none {
    display: none;
  }

  #Numeritheque18 #container .National_DIR,
  #Numeritheque18 #container .National_ETA,
  #Numeritheque18 #container .National_EVS {
    display: revert !important;
  }
</style>
