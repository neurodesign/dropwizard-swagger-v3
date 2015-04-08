<#-- @ftlvariable name="" type="com.federecio.dropwizard.swagger.SwaggerView" -->
<!DOCTYPE html>
<html>
<head>
  <title>Swagger UI</title>
  <link href='${swaggerStaticPath}/css/typography.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='${swaggerStaticPath}/css/reset.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='${swaggerStaticPath}/css/screen.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='${swaggerStaticPath}/css/reset.css' media='print' rel='stylesheet' type='text/css'/>
  <link href='${swaggerStaticPath}/css/screen.css' media='print' rel='stylesheet' type='text/css'/>
  <script type="text/javascript" src="${swaggerStaticPath}/lib/shred.bundle.js"></script>
  <script src='${swaggerStaticPath}/lib/jquery-1.8.0.min.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/jquery.slideto.min.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/jquery.wiggle.min.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/jquery.ba-bbq.min.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/handlebars-2.0.0.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/underscore-min.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/backbone-min.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/swagger-client.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/swagger-ui.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/highlight.7.3.pack.js' type='text/javascript'></script>
  <script src='${swaggerStaticPath}/lib/marked.js' type='text/javascript'></script>
  
    <!-- enabling this will enable oauth2 implicit scope support -->
  <script src='${swaggerStaticPath}/lib/swagger-oauth.js' type='text/javascript'></script>
  <script type="text/javascript">
    $(function () {
      window.swaggerUi = new SwaggerUi({
        url: "${contextPath}/api-docs",
        dom_id: "swagger-ui-container",
        supportedSubmitMethods: ['get', 'post', 'put', 'delete'],
        onComplete: function(swaggerApi, swaggerUi){
          if(typeof initOAuth == "function") {
            /*
            initOAuth({
              clientId: "your-client-id",
              realm: "your-realms",
              appName: "your-app-name"
            });
            */
          }
          $('pre code').each(function(i, e) {
            hljs.highlightBlock(e)
          });
        },
        onFailure: function(data) {
          log("Unable to Load SwaggerUI");
        },
        docExpansion: "none",
        sorter : "alpha"
      });

      function addApiKeyAuthorization() {
        var key = $('#input_apiKey')[0].value;
        log("key: " + key);
        if(key && key.trim() != "") {
            log("added key " + key);
            window.authorizations.add("api_key", new ApiKeyAuthorization("api_key", key, "query"));
        }
      }

      $('#input_apiKey').change(function() {
        addApiKeyAuthorization();
      });

      // if you have an apiKey you would like to pre-populate on the page for demonstration purposes...
      /*
        var apiKey = "myApiKeyXXXX123456789";
        $('#input_apiKey').val(apiKey);
        addApiKeyAuthorization();
      */

      window.swaggerUi.load();
  });
  </script>
</head>

<body class="swagger-section">
<div id='header'>
  <div class="swagger-ui-wrap">
    <a id="logo" href="http://swagger.io">swagger</a>
    <form id='api_selector'>
      <div class='input'><input placeholder="http://example.com/api" id="input_baseUrl" name="baseUrl" type="text"/></div>
      <div class='input'><input placeholder="api_key" id="input_apiKey" name="apiKey" type="text"/></div>
      <div class='input'><a id="explore" href="#">Explore</a></div>
    </form>
  </div>
</div>

<div id="message-bar" class="swagger-ui-wrap">&nbsp;</div>
<div id="swagger-ui-container" class="swagger-ui-wrap"></div>
</body>
</html>