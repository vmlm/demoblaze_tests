## Instalación y ejecución
1. Instalar Python >~3

2. En una terminal, ir a la raíz del proyecto y ejecutar el script de configuración correspondiente:
    * Windows:  setup.bat
    * Linux/MacOS: setup.sh

3. Ejecutar Behave en la misma terminal, escribiendo "behave" y presionando Enter.

El script ejecutará todas las pruebas y producirá lo siguiente:
a. Capturas de pantalla del carrito con dos productos, el formulario de compra lleno y la pantalla de éxito de la compra.
b. Un log de todas las acciones realizadas por el script de prueba E2E en el sitio web, incluyendo los IDs de los productos agregados.

## Implementación
He optado por implementar los flujos de prueba dados como scripts de características BDD con Behave y Python. Este enfoque tiene dos ventajas principales:
    1) Comunicar el objetivo de la prueba en lenguaje natural, lo cual es valioso para stakeholders no técnicos;
    2) Proporcionar un marco lógico para que los programadores de pruebas (yo mismo, otros testers o desarrolladores en pruebas) puedan agregar rápidamente lógica de prueba.

La implementación es sencilla:
* Todos los pasos de automatización E2E necesarios se han colocado en un solo archivo feature, como un solo scenario outline.
* Las pruebas de API se han dividido en dos features, una para cada endpoint (login y registro).
* He mantenido el web driver y el logger como variables de contexto para asegurar que permanezcan disponibles durante la vida de estas pruebas y cualquier prueba futura adicional.
* La URL de la API y los endpoints se han establecido en el environment.py como variables de contexto.
* Aunque la prueba E2E solo está implementada para ejecutarse con Chrome, y solo para un único escenario de prueba (agregar dos productos aleatorios), puede extenderse fácilmente para incluir diferentes navegadores y escenarios adicionales (intentar la compra sin productos, varias copias del mismo producto, etc.).

## Estructura del proyecto
El proyecto está estructurado de la siguiente manera:
demoblaze_tests
|-- features: contains gherkin feature descriptions
|       |-- steps: contains python feature step implementations
|-- scripts: contains auxiliary scripts to handle browser and logging setup logic.

Después de ejecutar las pruebas, se crean los siguientes directorios adicionales:
demoblaze_tests
|-- results: contains individual reports for each test run
|       |-- {test timestamp}: a single test run report
|       |       |-- screenshots: screenshots generated during the test
|       |       |-- actions.log: A log of all action taken on the webpage.