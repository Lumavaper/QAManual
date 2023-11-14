
    #Casos de prueba asociados al usario problem_user

Feature: Validar acceso al sistema - Login
    Como usuario problem_user, quiero ingresar al sistema por medio de las credenciales de acceso.


    @login
    Scenario Outline: Iniciar sesión al sistema
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<Password>"
            And hace clic en el boton "Login"
        Then el usuario se ha logueado
    Examples:
        | username     | passwoord    |
        | problem_user | secret_sauce |


    @invalidLogin
    Scenario: Verificar mensaje de error al ingresar una contarseña incorrecta
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<error>"
            And hace clic en el boton "Login"
        Then el usuario visualiza mensaje de error


Feature: Verificar elementos del menú de navegación
    Como usuario problem_user logueado, quiero navegar por los items que componen el menú de navegación principal.

    @navbar
    Background:
        Given un elemento de navegación a la izquierda de la interfaz del header

    Scenario: Interactuar con el primer item del navbar
        When el usuario hace clic en el ícono "<navbar>"
            And procede hacer clic en la opción "<ALL ITEMS>"
        Then el usuario visualiza la carga de los productos del ecommerce


    Scenario: Interactuar con el segundo item del navbar
        When el usuario hace clic en el ícono "<navbar>"
            And procede hacer clic en la opción "<ABOUT>"
        Then el usuario visualiza una nueva ruta que muestra error 404
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
    Como usuario problem_user logueado, quiero realizar consulta de productos en orden ascendente/descendente

    @filtroConsulta
    Scenario Outline: Verificar que cada filtro de consulta ordene los productos de forma ascendente/descendente
        Given un campo de tipo select a la derecha de la interfaz
        When el usuario hace clic en el button select de consulta "<order>"
            And selecciona cada uno de las opciones del "<order>"
        Then el sistema no muestra el orden de los productos de acuerdo a la opción dada
    Examples:
        | Order               |
        | Name (A to Z)       |
        | Name (Z to A)       |
        | Price (low to high) |
        | Price (high to low) |

        #Reporte para Bug


Feature: Verificar las caracteriticas de cada tag de productos
    Como usuario problem_user logueado, quiero ver la imagen, nombre, descripción y precio de cada producto

    @tagProducto
    Scenario: Verificar la imagen, nombre, descripción y precio de cada producto
        Given una lista de productos en el view "<inventory>"
        When el usuario hace scroll para visualizar los tags de productos
        Then el usuario visualiza la misma imagen en cada producto
            #Reporte para Bug

    @detalleProducto
    Scenario: Detallar la información de cada tag de prodcuto
        Given el usuario ingresa al detalle de cada producto
        When el usuario verifica la información acorde al producto
        Then el sistema muestra inconsistencia en la información del producto respecto a la información mostrada en el view "<inventory>"
            And el usuario visualiza un "<ITEM NO FOUND>"
                #Reporte para Bug

    @backInventory
    Scenario: Retornar a la vista del catálogo de productos (inventario)
        Given un producto en el view "<inventory-item>"
        When el usuario detalla las caracteristicas del producto
            And hace clic en el button "<Back to Products>"
        Then el sistema retorna al usuario al view "<inventory>"

Feature: Verificar que los productos se agregen al carrito de compras
    Como usuario problem_user logueado, quiero agregar productos al carrito de compras

    @addCart
    Background:
        Given una lista de productos en las vistas: Inventario "<inventory" Detalle Producto "<inventory-item>"

    Scenario Outline: Verificar en cada tag de producto la opción de agregar al carrito de compras
        When el usuario hace clic en el button "<Add To cart>" del view "<inventory>"
        Then el usuario visualiza que solo 3 ítems se agregan al carrito de compras
    Examples:
        | Product               |
        | Sauce Labs Backpack   |
        | Sauce Labs Bike Light |
        | Sauce Labs Onesie     |

        #Reporte para Bug


    Scenario Outline: Verificar en cada view del producto la opción de agregar al carrito de compras
        When el usuario hace clic en el button "<Add To cart>" del view "<inventory-item>"
        Then el sistema no permite agregar al carrito de compras los tres productos que no se agregaron desde el view "<inventory>"
            But el usuario hace clic en el button "<Add To cart>" del ítem "<6>"
        Then El producto se agrega al carrito de compras
    Examples:
        | Product                           |
        | Sauce Labs Fleece Jacket          |
        | Sauce Labs Bolt T-Shirt           |
        | Test.allTheThings() T-Shirt (Red) |

        #Reporte para Bug

    @viewaddCart
    Scenario: Verificar la lista de productos agregados al carrito de compras
        Given algunos productos agregados al carrtio de compras
        When el usuario hace clic en el button icon del carrito
        Then el usuario visualiza una interfaz en blanco sin resultados
            #Reporte para Bug

    @returnProducts
    Scenario: Retornar de una vista a otra desde la barra del navegador web
        Given el usuario se sitúa en el endpoint "<https://www.saucedemo.com/cart.html>"
        When el usuario hace clic en el button "<back>" del navegador
        Then el usuario visualiza una interfaz en blanco sin resultados
            #Reporte para Bug

Feature: Remover los productos agregados al carrito de compras
    Como usuario problem_user logueado, quiero remover los productos agregados al carrito de compras

    @remove
    Background:
        Given un conjunto de productos listados en el carrito de compras

    Scenario: Remover el producto del carrito de compras desde el view "<inventory>"
        When el usuario hace clic en el button "<Remove>" del view "<inventory>"
        Then el usuario no visualiza el producto removido del carrito de compras
            #Reporte para Bug

    Scenario: Remover el producto del carrito de compras desde el view "<inventory-item>"
        When el usuario hace clic en el button "<Remove>" del view "<inventory-item>"
        Then el usuario no visualiza el producto removido del carrito de compras
            #Reporte para Bug


Feature: Verificar tiempo de interacción con el sistema
    Como usuario standar_user quiero hacer login y no realizar activdiades en la aplicación
    Scenario: Verificar tiempo de inactividad para cerrr la sesión del usuario
        Given el usuario logueado
        When el usuario permanece con inactividad en el sistema en un determinado tiempo
        Then el sistema cierra la sesión del usuario
