Feature: Validar acceso al sistema - Login
    Como usuario standar_user, quiero ingresar al sistema por medio de las credenciales de acceso.
    @login
    Scenario Outline: Iniciar sesión al sistema
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<Password>"
            And hace clic en el boton "Login"
        Then el usuario se ha logueado
    Examples:
        | username      | password    |
        | standard_user | secret_sauce |