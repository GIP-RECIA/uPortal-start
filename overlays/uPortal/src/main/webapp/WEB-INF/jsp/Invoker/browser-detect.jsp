<%@ include file="/WEB-INF/jsp/include.jsp" %>

<div class="browser-detect-script nodisplay">
  <div class="alert alert-danger">
    <a href="javascript:void(0)" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <h1>Probl&#232;me de compatibilit&#233; navigateur</h1>
    <p>Un probl&#232;me a &#233;t&#233; d&#233;tect&#233; avec votre navigateur, celui-ci n'est pas totalement compatible avec le fonctionnement de l'ENT.</br>
    Seuls les navigateurs principaux <a href="https://www.mozilla.org/fr/firefox/" target="_blank">Firefox</a>,<a href="https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=fr">Google Chrome</a>,
    Edge, Safari, Opera et les navigateurs mobiles courants dans <u>leurs derni&#232;res versions</u> sont compatibles.</p>
    <p class="oldbrowser nodisplay">Il a &#233;t&#233; d&#233;tect&#233; que vous utilisez un navigateur qui n'est pas &#224; jour. Malheureusement afin de continuer la navigation sur ce site et pour des raisons de
    s&#233;curit&#233; merci de r&#233;aliser la mise &#224; jour de votre navigateur.</p>
    <p class="win_ie nodisplay">Il a &#233;t&#233; d&#233;tect&#233; que vous utilisez Internet Explorer, ce navigateur est en fin de vie et limite vos possibilit&#233;s de navigation,
      merci de changer de navigateur afin de pouvoir b&#233;n&#233;ficier de toutes les fonctionnalit&#233;s du site. Pour cela nous vous recommandons d'installer et d'utiliser un navigateur compatible comme Firefox ou Chrome,
       en suivant l'une de ces documentations: <a href="https://support.mozilla.org/fr/kb/installer-firefox-windows" target="_blank">Firefox</a>, <a href="https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=fr">Google Chrome</a>.</p>
    <p class="autres nodisplay">Votre navigateur n'a pas &#233;t&#233; d&#233;tect&#233; comme compatible avec l'usage de ce site, si vous ne rencontrez aucun probl&#232;me veuillez ne pas tenir compte de ce message.
      Autrement veuillez utiliser un navigateur reconnu comme compatible parmis la liste suivante: <a href="https://www.mozilla.org/fr/firefox/" target="_blank">Firefox</a>, <a href="https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=fr">Google Chrome</a>, Edge, Safari, Opera.</p>
  </div>
</div>
<STYLE type="text/css">
.browser-detect-script {
  position: fixed;
  width: 100%;
  min-height: 50px;
  color: black;
  top: 0;
  left: 0;
  text-align: center;
  z-index:1030;
}
.browser-detect-script > .alert > p {
  color: black;
}
.browser-detect-script a {
  color: red !important;
}
.browser-detect-script .nodisplay, .browser-detect-script.nodisplay {
  display:none;
}
</STYLE>

<script language="javascript" type="text/javascript">
(function() { // Prevent adding to the global namespace

function detect() {
  if (typeof navigator !== 'undefined') {
    return parseUserAgent(navigator.userAgent);
  }

  return getNodeVersion();
}

function detectOS(userAgentString) {
  var rules = getOperatingSystemRules();
  var detected = rules.filter(function (os) {
    return os.rule && os.rule.test(userAgentString);
  })[0];

  return detected ? detected.name : null;
}

function getNodeVersion() {
  var isNode = typeof process !== 'undefined' && process.version;
  return isNode && {
    name: 'node',
    version: process.version.slice(1),
    os: process.platform
  };
}

function parseUserAgent(userAgentString) {
  var browsers = getBrowserRules();
  if (!userAgentString) {
    return null;
  }

  var detected = browsers.map(function(browser) {
    var match = browser.rule.exec(userAgentString);
    var version = match && match[1].split(/[._]/).slice(0,3);

    if (version && version.length < 3) {
      version = version.concat(version.length == 1 ? [0, 0] : [0]);
    }

    return match && {
      name: browser.name,
      version: version.join('.')
    };
  }).filter(Boolean)[0] || null;

  if (detected) {
    detected.os = detectOS(userAgentString);
  }

  if (/alexa|bot|crawl(er|ing)|facebookexternalhit|feedburner|google web preview|nagios|postrank|pingdom|slurp|spider|yahoo!|yandex/i.test(userAgentString)) {
    detected = detected || {};
    detected.bot = true;
  }

  return detected;
}

function getBrowserRules() {
  return buildRules([
    [ 'aol', /AOLShield\/([0-9\._]+)/ ],
    [ 'edge', /Edge\/([0-9\._]+)/ ],
    [ 'yandexbrowser', /YaBrowser\/([0-9\._]+)/ ],
    [ 'vivaldi', /Vivaldi\/([0-9\.]+)/ ],
    [ 'kakaotalk', /KAKAOTALK\s([0-9\.]+)/ ],
    [ 'samsung', /SamsungBrowser\/([0-9\.]+)/ ],
    [ 'chrome', /(?!Chrom.*OPR)Chrom(?:e|ium)\/([0-9\.]+)(:?\s|$)/ ],
    [ 'phantomjs', /PhantomJS\/([0-9\.]+)(:?\s|$)/ ],
    [ 'crios', /CriOS\/([0-9\.]+)(:?\s|$)/ ],
    [ 'firefox', /Firefox\/([0-9\.]+)(?:\s|$)/ ],
    [ 'fxios', /FxiOS\/([0-9\.]+)/ ],
    [ 'opera', /Opera\/([0-9\.]+)(?:\s|$)/ ],
    [ 'opera', /OPR\/([0-9\.]+)(:?\s|$)$/ ],
    [ 'ie', /Trident\/7\.0.*rv\:([0-9\.]+).*\).*Gecko$/ ],
    [ 'ie', /MSIE\s([0-9\.]+);.*Trident\/[4-7].0/ ],
    [ 'ie', /MSIE\s(7\.0)/ ],
    [ 'bb10', /BB10;\sTouch.*Version\/([0-9\.]+)/ ],
    [ 'android', /Android\s([0-9\.]+)/ ],
    [ 'ios', /Version\/([0-9\._]+).*Mobile.*Safari.*/ ],
    [ 'safari', /Version\/([0-9\._]+).*Safari/ ],
    [ 'facebook', /FBAV\/([0-9\.]+)/],
    [ 'instagram', /Instagram\s([0-9\.]+)/],
    [ 'ios-webview', /AppleWebKit\/([0-9\.]+).*Mobile/]
  ]);
}

function getOperatingSystemRules() {
  return buildRules([
    [ 'iOS', /iP(hone|od|ad)/ ],
    [ 'Android OS', /Android/ ],
    [ 'BlackBerry OS', /BlackBerry|BB10/ ],
    [ 'Windows Mobile', /IEMobile/ ],
    [ 'Amazon OS', /Kindle/ ],
    [ 'Windows 3.11', /Win16/ ],
    [ 'Windows 95', /(Windows 95)|(Win95)|(Windows_95)/ ],
    [ 'Windows 98', /(Windows 98)|(Win98)/ ],
    [ 'Windows 2000', /(Windows NT 5.0)|(Windows 2000)/ ],
    [ 'Windows XP', /(Windows NT 5.1)|(Windows XP)/ ],
    [ 'Windows Server 2003', /(Windows NT 5.2)/ ],
    [ 'Windows Vista', /(Windows NT 6.0)/ ],
    [ 'Windows 7', /(Windows NT 6.1)/ ],
    [ 'Windows 8', /(Windows NT 6.2)/ ],
    [ 'Windows 8.1', /(Windows NT 6.3)/ ],
    [ 'Windows 10', /(Windows NT 10.0)/ ],
    [ 'Windows ME', /Windows ME/ ],
    [ 'Open BSD', /OpenBSD/ ],
    [ 'Sun OS', /SunOS/ ],
    [ 'Linux', /(Linux)|(X11)/ ],
    [ 'Mac OS', /(Mac_PowerPC)|(Macintosh)/ ],
    [ 'QNX', /QNX/ ],
    [ 'BeOS', /BeOS/ ],
    [ 'OS/2', /OS\/2/ ],
    [ 'Search Bot', /(nuhk)|(Googlebot)|(Yammybot)|(Openbot)|(Slurp)|(MSNBot)|(Ask Jeeves\/Teoma)|(ia_archiver)/ ]
  ]);
}

function buildRules(ruleTuples) {
  return ruleTuples.map(function(tuple) {
    return {
      name: tuple[0],
      rule: tuple[1]
    };
  });
}

function removeClass(element,className) {
  var currentClassName = element.getAttribute("class");
  if (typeof currentClassName!== "undefined" && currentClassName) {

    var class2RemoveIndex = currentClassName.indexOf(className);
    if (class2RemoveIndex != -1) {
        var class2Remove = currentClassName.substr(class2RemoveIndex, className.length);
        var updatedClassName = currentClassName.replace(class2Remove,"").trim();
        element.setAttribute("class",updatedClassName);
    }
  }
  else {
    element.removeAttribute("class");
  }
}

document.body.querySelector(".browser-detect-script .close").addEventListener('click', function(event) {
  document.body.querySelector(".browser-detect-script").style.display="none";
  event.preventDefault();
});

browser = detect();
// handle the case where we don't detect the browser
if (browser) {
var GoodWindows=['Windows 7','Windows 8','Windows 8.1','Windows 10'];
var GoodBrowsers=['edge','chrome','firefox'];
if (browser.name) {
  switch (browser.name) {
    case 'chrome':
      if (browser.version && parseInt(browser.version) < 63 ) {
        removeClass(document.body.querySelector(".browser-detect-script"), "nodisplay");
        removeClass(document.body.querySelector(".browser-detect-script .oldbrowser"),"nodisplay");
      }
      break;
    case 'firefox':
      if (browser.version && parseInt(browser.version) < 57 ) {
        removeClass(document.body.querySelector(".browser-detect-script"), "nodisplay");
        removeClass(document.body.querySelector(".browser-detect-script .oldbrowser"),"nodisplay");
      }
      break;
    case 'safari':
      if (browser.version && parseInt(browser.version) < 11 ) {
        removeClass(document.body.querySelector(".browser-detect-script"), "nodisplay");
        removeClass(document.body.querySelector(".browser-detect-script .oldbrowser"),"nodisplay");
      }
      break;
    case 'opera':
      if (browser.version && parseInt(browser.version) < 48 ) {
        removeClass(document.body.querySelector(".browser-detect-script"), "nodisplay");
        removeClass(document.body.querySelector(".browser-detect-script .oldbrowser"),"nodisplay");
      }
      break;
    case 'ie':
      removeClass(document.body.querySelector(".browser-detect-script"), "nodisplay");
      removeClass(document.body.querySelector(".browser-detect-script .win_ie"),"nodisplay");
      break;
    case 'edge':
    // supported
    case 'android':
    // supported
      break;
    default:
      console.log("Le navigateur détecté est le suivant :", browser.name, browser.version, browser.os);
      // removeClass(document.body.querySelector(".browser-detect-script"), "nodisplay");
      // removeClass(document.body.querySelector(".browser-detect-script .autres"),"nodisplay");
      break;
    }
  }
}
})();
</script>
