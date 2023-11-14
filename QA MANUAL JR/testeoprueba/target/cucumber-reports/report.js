$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("C:/Users/falco/eclipse-workspace/testeoprueba/src/test/resources/features/testcaseUser1.feature");
formatter.feature({
  "line": 1,
  "name": "Validar acceso al sistema - Login",
  "description": "  Como usuario standar_user, quiero ingresar al sistema por medio de las credenciales de acceso.",
  "id": "validar-acceso-al-sistema---login",
  "keyword": "Feature"
});
formatter.scenarioOutline({
  "line": 4,
  "name": "Iniciar sesión al sistema",
  "description": "",
  "id": "validar-acceso-al-sistema---login;iniciar-sesión-al-sistema",
  "type": "scenario_outline",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 3,
      "name": "@login"
    }
  ]
});
formatter.step({
  "line": 5,
  "name": "un formulario en la interfaz de login",
  "keyword": "Given "
});
formatter.step({
  "line": 6,
  "name": "el usuario diligencia el formulario: Usuario \"\u003cusername\u003e\" Contraseña \"\u003cPassword\u003e\"",
  "keyword": "When "
});
formatter.step({
  "line": 7,
  "name": "hace clic en el boton \"Login\"",
  "keyword": "And "
});
formatter.step({
  "line": 8,
  "name": "el usuario se ha logueado",
  "keyword": "Then "
});
formatter.examples({
  "line": 9,
  "name": "",
  "description": "",
  "id": "validar-acceso-al-sistema---login;iniciar-sesión-al-sistema;",
  "rows": [
    {
      "cells": [
        "username",
        "password"
      ],
      "line": 10,
      "id": "validar-acceso-al-sistema---login;iniciar-sesión-al-sistema;;1"
    },
    {
      "cells": [
        "standard_user",
        "secret_sauce"
      ],
      "line": 11,
      "id": "validar-acceso-al-sistema---login;iniciar-sesión-al-sistema;;2"
    }
  ],
  "keyword": "Examples"
});
formatter.scenario({
  "line": 11,
  "name": "Iniciar sesión al sistema",
  "description": "",
  "id": "validar-acceso-al-sistema---login;iniciar-sesión-al-sistema;;2",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 3,
      "name": "@login"
    }
  ]
});
formatter.step({
  "line": 5,
  "name": "un formulario en la interfaz de login",
  "keyword": "Given "
});
formatter.step({
  "line": 6,
  "name": "el usuario diligencia el formulario: Usuario \"standard_user\" Contraseña \"\u003cPassword\u003e\"",
  "matchedColumns": [
    0
  ],
  "keyword": "When "
});
formatter.step({
  "line": 7,
  "name": "hace clic en el boton \"Login\"",
  "keyword": "And "
});
formatter.step({
  "line": 8,
  "name": "el usuario se ha logueado",
  "keyword": "Then "
});
formatter.match({});
formatter.result({
  "status": "undefined"
});
formatter.match({});
formatter.result({
  "status": "undefined"
});
formatter.match({});
formatter.result({
  "status": "undefined"
});
formatter.match({});
formatter.result({
  "status": "undefined"
});
});