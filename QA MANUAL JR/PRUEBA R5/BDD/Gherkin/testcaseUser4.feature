

    #Casos de prueba asociados al usario performance_glitch_user

Feature: Validar acceso al sistema - Login
    Como usuario performance_glitch_user, quiero ingresar al sistema por medio de las credenciales de acceso.

    @login
    Scenario Outline: Iniciar sesión al sistema
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<Password>"
            And hace clic en el boton "Login"
        Then el usuario ha tomado tiempo para loguearse
    Examples:
        | username                | passwoord    |
        | performance_glitch_user | secret_sauce |
        #Reporte para Bug

    @invalidLogin
    Scenario: Verificar mensaje de error al ingresar una contarseña incorrecta
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<error>"
            And hace clic en el boton "Login"
        Then el usuario visualiza mensaje de error

Feature: Verificar elementos del menú de navegación
    Como usuario performance_glitch_user logueado, quiero navegar por los items que componen el menú de navegación principal.

    @navbar
    Background:
        Given un elemento de navegación a la izquierda de la interfaz del header

    Scenario: Interactuar con el primer item del navbar
        When el usuario hace clic en el ícono "<navbar>"
            And procede hacer clic en la opción "<ALL ITEMS>"
        Then el usuario visualiza al cabo de un tiempo la carga de los productos del ecommerce
            #Reporte para Bug

    Scenario: Interactuar con el segundo item del navbar
        When el usuario hace clic en el ícono "<navbar>"
            And procede hacer clic en la opción "<ABOUT>"
        Then el usuario visualiza una nueva ruta que comprende la información relacionada acerca del ecommerce
            But el usuario hace clic en el button "<back>" del navegador
        Then el sistema tarda para retornar al usuario a la interfaz principal
            #Reporte para Bug

    Scenario: Interactuar con el tercer item del navbar
        When el usuario hace clic en el ícono "<navbar>"
            And procede hacer clic en la opción "<LOGOUT>"
        Then el usuario cierra la sesión

    Scenario: Interactuar con el cuarto item del navbar
        When el usuario hace clic en el ícono "<navbar>"
            And procede hacer clic en la opción "<RESET APP STATE>"
        Then el usuario visualiza que la aplicación se ha restablecido
            #Reporte para Bug

Feature: Validar el filtro de consulta
    Como usuario performance_glitch_user logueado, quiero realizar consulta de productos en orden ascendente/descendente

    @filtroConsulta
    Scenario Outline: Verificar que cada filtro de consulta ordene los productos de forma ascendente/descendente
        Given un campo de tipo select a la derecha de la interfaz
        When el usuario hace clic en el button select de consulta "<order>"
            And selecciona cada uno de las opciones del "<order>"
        Then el sistema tarda en mostrar correctamente los resultados de la consulta
    Examples:
        | Order               |
        | Name (A to Z)       |
        | Name (Z to A)       |
        | Price (low to high) |
        | Price (high to low) |

        #Reporte para Bug

Feature: Verificar las caracteriticas de cada tag de productos
    Como usuario performance_glitch_user logueado, quiero ver la imagen, nombre, descripción y precio de cada producto

    @tagProducto
    Scenario: Verificar la imagen, nombre, descripción y precio de cada producto
        Given una lista de productos en la vista "<inventory>"
        When el usuario hace scroll para visualizar los tags de productos
            And hace clic en cada uno de los tags de productos
        Then el usuario visualiza la imagen, nombre, descripción y precio de cada producto

    @backInventory
    Scenario: Retornar a la vista del catálogo de productos (inventario)
        Given un producto en el view "<inventory-item>"
        When el usuario detalla las caracteristicas del producto
            And hace clic en el button "<Back to Products>"
        Then el sistema tarda un tiempo para retorna al usuario al view "<inventory>"
            #Reporte para Bug

Feature: Verificar que los productos se agregen al carrito de compras
    Como usuario performance_glitch_user logueado, quiero agregar productos al carrito de compras

    @addCart
    Background:
        Given una lista de productos en las vistas: Inventario "<inventory" Detalle Producto "<inventory-item>"

    Scenario: Verificar en cada tag de producto la opción de agregar al carrito de compras
        When el usuario hace clic en button "<Add To cart>" del view "<inventory>"
        Then el usuario visualiza una notificación en el ícono del carrito de compras

    Scenario: Verificar en cada view del producto la opción de agregar al carrito de compras
        When el usuario hace clic en button "<Add To cart>" del view "<inventory-item>"
        Then el usuario visualiza una notificación en el ícono del carrito de compras


    @viewaddCart
    Scenario: Verificar la lista de productos agregados al carrito de compras
        Given algunos productos agregados al carrtio de compras
        When el usuario hace clic en el button icon del carrito
        Then el sistema lista los productos agregagos en el view Cart

Feature: Remover los productos agregados al carrito de compras
    Como usuario performance_glitch_user logueado, quiero remover los productos agregados al carrito de compras

    @remove
    Background:
        Given un conjunto de productos listados en el carrito de compras

    Scenario: Remover el producto del carrito de compras desde el view "<Cart>"
        When el usuario hace clic en el button "<Remove>" del view "<Cart>"
        Then el producto ya no se visualiza en el carrito de compras
            And el producto queda habilitado para agregarlo nuevamente al carrito

    Scenario: Remover el producto del carrito de compras desde el view "<inventory>"
        When el usuario hace clic en el button "<Remove>" del view "<inventory>"
        Then el usuario visualiza que la notificación del button icon del carrito disminuye en 1 unidad
            And el producto queda habilitado para agregarlo nuevamente al carrito

    Scenario: Remover el producto del carrito de compras desde el view "<inventory-item>"
        When el usuario hace clic en el button "<Remove>" del view "<inventory-item>"
        Then el usuario detalla que la notificación del button icon del carrito disminuye en 1 unidad quedando sin productos
            And el producto queda habilitado para agregarlo nuevamente al carrito

Feature: Verificar cantidades añadidas o removidas de los productos en el carrito de compras
    Como usuario performance_glitch_user logueado, quiero agregar y quitar cantidades a los productos agregados al carrito de compras

    @addCantidades
    Scenario: Añañdir y quitar cantidades del producto
        Given una lista de productos en el view "<Cart>"
        When el usuario hace clic en el recuadro numérico de la columna "QTY"
        Then el usuario no añade cantidades
            #Reporte para Bug


Feature: Verificar la opción de continuar la compra agregando más productos al carrito de compras
    Como usuario performance_glitch_user logueado, quiero retornar al catálogo de productos desde el carrito de compras

    @continueShopping
    Scenario: Retornar a la vista del catálogo de productos "<inventario>" para continuar agregando productos
        Given una lista de productos en el view "<Cart>"
        When el usuario hace clic en el button "<Continue Shopping>"
        Then el sistema tarda unt iempo al retornar al usuario al view "<inventory>"
            #Reporte para Bug

Feature: Verificar la compra de los productos
    Como performance_glitch_user logueado, quiero realizar la compra de mis productos agregados al carrito

    @checkout
    Scenario Outline: Hacer checkout de los productos agregados al carrito de compras
        Given una lista de productos en el view "<Cart>"
        When el usuario hace clic en el button "<Checkout>"
        Then el sistema direcciona al usuario a una nueva interfaz para realizar la compra de los productos
    Examples:
        | Products                 |
        | Sauce Labs Fleece Jacket |
        | Sauce Labs Onesie        |


    @checkoutForm
    Scenario Outline: Verificar los campos del formulario para continuar la compra
        Given un formulario para el registro de la información del usuario
        When el usuario ingresa el nombre en el primer TextBox
            And ingresa el apellido en el segundo TextBox
            And registra en el tercer TextBox el código postal
            And hace clic en el button "<Continue>"
        Then el sistema muestra el resumen de la compra
    Examples:
        | Name        | Last Name      | Codigo postal |
        | Luisa Maria | Vargas Perdomo | 41001         |

        | Products                 | cantidad | valor | total Precio | total |
        | Sauce Labs Fleece Jacket | 1        | 49.99 | 57.98        | 62.62 |
        | Sauce Labs Onesie        | 1        | 7.99  |              |       |


    @finish
    Scenario: Finalizar la compra de productos
        Given ul formulario de compra con previo diligenciamiento
        When el usuario verifica el detalle de la compra
            And hace clic en el button "<Finish>"
        Then el usuario visualiza una alerta success de la compra finalizada
        Then el sistema muesta un button de "<Bck home>"
            And el usuario hace clic en el button "<Back home>"
        Then el sistema tarda en retornar al usuario a la interfaz principal de la apicación
            #Reporte para Bug

    @checkoutCancel
    Scenario: Cancelar el proceso de compra
        Given el checkout de la compra
        When el usuario diligencia o NO el formulario de compra
            And hace clic en el button "<Cancel>"
        Then el sistema retorna al usuario al view "<Cart>"


    @checkoutContinueNull
    Scenario: Continuar la compra de los productos sin registro de información
        Given el formulario del checkout de la compra vacío
        When el usuario no registre ninguna información
            And el usuario hace clic en el button "<Continue>"
        Then el sistema muestra mensaje de error para no continuar con el proceso

    @checkoutNull
    Scenario: Realizar la compra sin previa selección de productos
        Given un usuario situado en el view "<Cart>"
        When el usuario no agrega productos
            And hace clic en el button "<Checkout>"
            And diligencia el formulario de compra
            And hace clic en el button "<Continue>"
        Then el sistema muestra el resumen de compra con valor "<$0.00>"
            And el usuario hace clic en el button "<Finish>"
        Then el sistema muestra alerta success de la compra realizada
            But el sistema NO debe permitir la compra si no hay productos agregados al carrito - Bug
                #Reporte para Bug


Feature: Verificar tiempo de interacción con el sistema
    Como usuario standar_user quiero hacer login y no realizar activdiades en la aplicación
    Scenario: Verificar tiempo de inactividad para cerrr la sesión del usuario
        Given el usuario logueado
        When el usuario permanece con inactividad en el sistema en un determinado tiempo
        Then el sistema cierra la sesión del usuario
