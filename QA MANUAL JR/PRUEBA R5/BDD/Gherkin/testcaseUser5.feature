
    #Casos de prueba asociados al usario error_user

Feature: Validar acceso al sistema - Login
    Como usuario error_user, quiero ingresar al sistema por medio de las credenciales de acceso.

    @login
    Scenario Outline: Iniciar sesión al sistema
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<Password>"
            And hace clic en el boton "Login"
        Then el usuario se ha logueado
    Examples:
        | username   | passwoord    |
        | error_user | secret_sauce |


    @invalidLogin
    Scenario: Verificar mensaje de error al ingresar una contarseña incorrecta
        Given un formulario en la interfaz de login
        When el usuario diligencia el formulario: Usuario "<username>" Contraseña "<error>"
            And hace clic en el boton "Login"
        Then el usuario visualiza mensaje de error


Feature: Verificar elementos del menú de navegación
    Como usuario error_user logueado, quiero navegar por los items que componen el menú de navegación principal.

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
        Then el usuario visualiza una nueva ruta que comprende la información relacionada acerca del ecommerce

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
    Como usuario error_user logueado, quiero realizar consulta de productos en orden ascendente/descendente

    @filtroConsulta
    Scenario Outline: Verificar que cada filtro de consulta ordene los productos de forma ascendente/descendente
        Given un campo de tipo select a la derecha de la interfaz
        When el usuario hace clic en el button select de consulta "<order>"
            And selecciona cada uno de las opciones del "<order>"
        Then el sistema no muestra resultados de la consulta
            And el usuario visualiza un mensaje de error
    Examples:
        | Order               |
        | Name (A to Z)       |
        | Name (Z to A)       |
        | Price (low to high) |
        | Price (high to low) |

        #Reporte para Bug

Feature: Verificar las caracteriticas de cada tag de productos
    Como usuario error_user logueado, quiero ver la imagen, nombre, descripción y precio de cada producto

    @tagProducto
    Scenario: Verificar la imagen, nombre, descripción y precio de cada producto
        Given una lista de productos en la vista "<inventory>"
        When el usuario hace scroll para visualizar los tags de productos
            And hace clic en cada uno de los tags de productos
        Then el usuario visualiza la imagen, nombre, descripción y precio de cada producto
            And el sistema reporta error en consola
                #Reporte para Bug

    @backInventory
    Scenario: Retornar a la vista del catálogo de productos "<inventario>"
        Given un producto en el view "<inventory-item>"
        When el usuario detalla las caracteristicas del producto
            And hace clic en el button "<Back to Products>"
        Then el sistema retorna al usuario al view "<inventory>"


Feature: Verificar que los productos se agregen al carrito de compras
    Como usuario error_user logueado, quiero agregar productos al carrito de compras

    @addCart
    Background:
        Given una lista de productos en las vistas: Inventario "<inventory>" Detalle Producto "<inventory-item>"

    Scenario: Verificar en cada tag de producto la opción de agregar al carrito de compras
        When el usuario hace clic en button "<Add To cart>" del view "<inventory>"
        Then el usuario visualiza que solo 3 ítems se agregan al carrito de compras
    Examples:
        | Product               |
        | Sauce Labs Backpack   |
        | Sauce Labs Bike Light |
        | Sauce Labs Onesie     |

        #Reporte para Bug

    Scenario: Verificar en cada view del producto la opción de agregar al carrito de compras
        When el usuario hace clic en button "<Add To cart>" del view "<inventory-item>"
        Then el sistema no permite agregar al carrito de compras los tres productos que no se agregaron desde el view "<inventory>"


    @viewaddCart
    Scenario: Verificar la lista de productos agregados al carrito de compras
        Given algunos productos agregados al carrtio de compras
        When el usuario hace clic en el button icon del carrito
        Then el sistema lista los productos agregagos en el view Cart

Feature: Remover los productos agregados al carrito de compras
    Como usuario error_user logueado, quiero remover los productos agregados al carrito de compras

    @remove
    Background:
        Given un conjunto de productos listados en el carrito de compras

    Scenario: Remover el producto del carrito de compras desde el view "<Cart>"
        When el usuario hace clic en el button "<Remove>" del view "<Cart>"
        Then el producto ya no se visualiza en el carrito de compras
            And el producto queda habilitado para agregarlo nuevamente al carrito

    Scenario: Remover el producto del carrito de compras desde el view "<inventory>"
        When el usuario hace clic en el button "<Remove>" del view "<inventory>"
        Then el usuario no visualiza el producto removido del carrito de compras
            #Reporte para Bug

    Scenario: Remover el producto del carrito de compras desde el view "<inventory-item>"
        When el usuario hace clic en el button "<Remove>" del view "<inventory-item>"
        Then el usuario no visualiza el producto removido del carrito de compras
            #Reporte para Bug
    Examples:
        | Product                 | View           | endpoint                                           |
        | Sauce Labs Backpack     | Cart           | https://www.saucedemo.com/cart.html                |
        | Sauce Labs Bike Light   | inventory      | https://www.saucedemo.com/inventory.html           |
        | Sauce Labs Bolt T-Shirt | inventory-item | https://www.saucedemo.com/inventory-item.html?id=1 |

Feature: Verificar cantidades añadidas o removidas de los productos en el carrito de compras
    Como usuario error_user logueado, quiero agregar y quitar cantidades a los productos agregados al carrito de compras

    @addCantidades
    Scenario: Añañdir y quitar cantidades del producto
        Given una lista de productos en el view  "<Cart>"
        When el usuario hace clic en el recuadro numérico de la columna "QTY"
        Then el usuario no añade cantidades
            #Reporte para Bug

Feature: Verificar la opción de continuar la compra agregando más productos al carrito de compras
    Como usuario error_user logueado, quiero retornar al catálogo de productos desde el carrito de compras

    @continueShopping
    Scenario: Retornar a la vista del catálogo de productos "<inventario>"
        Given una lista de productos en el view "<Cart>"
        When el usuario hace clic en el button "<Continue Shopping>"
        Then el sistema retorna al usuario al view "<inventory>"

Feature: Verificar la compra de los productos
    Como usuario error_user logueado, quiero realizar la compra de mis productos agergados al carrito

    @checkout
    Scenario Outline: Hacer checkout de los productos agregados al carrito de compras
        Given una lista de productos en el view "<Cart>"
        When el usuario hace clic en el button "<Checkout>"
        Then el sistema direcciona al usuario a una nueva interfaz para realizar la compra de los productos
    Examples:
        | Products              |
        | Sauce Labs Bike Light |
        | Sauce Labs Backpack   |


    @checkoutForm
    Scenario Outline: Verificar los campos del formulario para continuar la compra
        Given un formulario para el registro de la información del usuario
        When el usuario ingresa el nombre en el primer TextBox
            And ingresa el apellido en el segundo TextBox
        Then el sistema NO permite capturar el dato de entrado para el "<Last Name>"
            And registra el tercer TextBox el código postal
            And hace clic en el button "<Continue>"
        Then el sistema muestra el resumen de la compra
    Examples:
        | Name        | Codigo postal |
        | Luisa Maria | 41001         |

        | Products              | cantidad | valor | total Precio | Total |
        | Sauce Labs Bike Light | 1        | 9.99  | 39.98        | 43.18 |
        | Sauce Labs Backpack   | 1        | 29.99 |              |       |

        #Reporte para Bug

    @finish
    Scenario: Finalizar la compra de productos
        Given un formulario de compra con previo diligenciamiento
        When el usuario verifica el detalle de la compra
            And hace clic en el button "<Finish>"
        Then el usuario NO visualiza el resultado success de la compra
            #Reporte para Bug


    @checkoutCancel
    Scenario: Cancelar el proceso de compra
        Given el checkout de la compra
        When el usuario diligencia o NO el formulario de compra
            And hace clic en el button "<Cancel>"
        Then el sistema retorna al usuario al view "<Cart>"


Feature: Verificar tiempo de interacción con el sistema
    Como usuario standar_user quiero hacer login y no realizar activdiades en la aplicación
    Scenario: Verificar tiempo de inactividad para cerrr la sesión del usuario
        Given el usuario logueado
        When el usuario permanece con inactividad en el sistema en un determinado tiempo
        Then el sistema cierra la sesión del usuario
