
#Casos de prueba asociados al usario locked_out_user


Feature: Validar acceso al sistema - Login
    Como usuario locked_out_user, quiero ingresar al sistema por medio de las credenciales de acceso.


    @login
    Scenario Outline: Iniciar sesión al sistema
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<Password>"
            And hace clic en el boton "Login"
        Then el usuario se ha logueado
    Examples:
        | username        | passwoord    |
        | locked_out_user | secret_sauce |


    @invalidLogin
    Scenario: Verificar mensaje de error al ingresar una contarseña incorrecta
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<error>"
            And hace clic en el boton "Login"
        Then el usuario visualiza mensaje de error