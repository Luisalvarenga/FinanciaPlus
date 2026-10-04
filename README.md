# FinanciaPlus — Onboarding digital y originación

Solución para la evaluación técnica "Creación de una Solución de Onboarding y Originación". Permite que una persona se registre, verifique su identidad y solicite una **Cuenta Digital + Tarjeta de Débito** de forma autónoma.

- **Backend:** Java 21 con Spring Boot 4, MySQL 8.
- **Frontend:** Flutter (Android y Windows).
- **Análisis de arquitectura:** [docs/ARQUITECTURA.md](docs/ARQUITECTURA.md).

## Demo desplegada

| Recurso | Dirección |
|---|---|
| API | https://financiaplus.onrender.com |
| Documentación interactiva (Swagger) | https://financiaplus.onrender.com/swagger-ui.html |

La API está en un plan gratuito que se suspende tras 15 minutos sin uso: la primera petición puede tardar cerca de un minuto.

La app apunta a esta API por defecto, así que se puede probar sin levantar nada en local.

## Qué incluye

| Requisito de la prueba | Dónde está |
|---|---|
| Supuesto 1 — Lista negra AML (API propia) | `GET /api/aml/check/{documento}` y `GET /api/aml/search?name=` |
| Supuesto 2 — Cliente y score (API propia, protegida) | `GET /api/bank-customers/{documento}` y `.../financial`, con JWT |
| Supuesto 3 — Geolocalización por IP (API externa) | ipapi.co, consultada durante la originación y guardada en la solicitud |
| Registro básico y persistencia de la solicitud | Registro de cuenta, perfil y tabla `credit_applications` |
| Reglas de negocio | Lista negra y score menor a 7.0 rechazan; la geolocalización no bloquea |
| Extras | Scoring interno de riesgo, validación de DUI, captura de fotos con revisión de calidad, Swagger |

La captura de documento con OCR, la prueba de vida y la comparación biométrica están simuladas, como permite el enunciado.

## Estructura del repositorio

```
backend/                     API en Spring Boot
frontend/financiaplus_app/   App Flutter
docs/ARQUITECTURA.md         Análisis de arquitectura
docker-compose.yml           MySQL para desarrollo local
render.yaml                  Definición del despliegue en Render
.env.example                 Plantilla de variables de entorno
```

## Ejecución local

### Requisitos

- Docker Desktop
- JDK 21
- Flutter 3.44 o superior (solo para ejecutar la app)

### 1. Variables de entorno

Las credenciales no están en el código. Copia la plantilla y define tus valores:

```bash
cp .env.example .env
```

En Windows (PowerShell): `Copy-Item .env.example .env`.

| Variable | Uso |
|---|---|
| `MYSQL_ROOT_PASSWORD` | Contraseña de root del MySQL local |
| `DB_USERNAME`, `DB_PASSWORD` | Usuario y contraseña que usa el backend |
| `JWT_SECRET` | Llave de firma de los tokens; mínimo 32 caracteres |
| `SEED_DEFAULT_PASSWORD` | Contraseña de las cuentas de demostración |

### 2. Base de datos

```bash
docker compose up -d
```

### 3. Backend

```bash
cd backend
./mvnw spring-boot:run
```

En Windows: `.\mvnw.cmd spring-boot:run`.

La API queda en http://localhost:8080 y Swagger en http://localhost:8080/swagger-ui.html. Al arrancar crea las tablas y carga los datos de demostración.

### 4. App

```bash
cd frontend/financiaplus_app
flutter pub get
flutter run -d windows --dart-define=API_BASE_URL=http://localhost:8080
```

Sin `--dart-define` la app usa la API desplegada. En un teléfono o emulador, `localhost` no apunta a tu equipo: usa su dirección de red, por ejemplo `http://192.168.1.10:8080`.

## Cuentas de demostración

El backend crea una cuenta por escenario. Todas usan la contraseña definida en `SEED_DEFAULT_PASSWORD` y solo tienen los datos del registro, así que con cada una se puede recorrer el onboarding completo.

| Correo | DUI | Escenario | Resultado |
|---|---|---|---|
| `ana.martinez@example.com` | `11111111-6` | Cliente del banco, score 8.50 | Aprobada |
| `sofia.rivas@example.com` | `55555555-0` | Cliente del banco, score 7.00 (mínimo) | Aprobada |
| `diego.castro@example.com` | `66666666-6` | Cliente del banco, score 6.99 | Rechazada por score |
| `luis.hernandez@example.com` | `22222222-2` | Cliente del banco, score 5.50 | Rechazada por score |
| `carlos.mendoza@example.com` | `99999999-4` | Persona en lista negra | Rechazada por AML |
| `maria.lopez@example.com` | `33333333-8` | No es cliente; score base 7.50 | Aprobada |
| `pedro.ramos@example.com` | `44444444-4` | Similitud biométrica de 65% | No puede solicitar |

También se puede crear una cuenta nueva desde la app. El DUI debe tener un dígito verificador válido.

## Recorrido en la app

1. Iniciar sesión o crear una cuenta.
2. En el inicio, pulsar "Continuar onboarding".
3. Completar los datos personales. Si la persona es cliente del banco, se rellenan automáticamente.
4. Capturar el documento y la selfie (cámara o archivo) y verificar la identidad.
5. Enviar la solicitud y ver el resultado. La solicitud queda listada en el inicio.

## Endpoints

| Método y ruta | Acceso | Descripción |
|---|---|---|
| `POST /api/auth/register` | Público | Crea la cuenta y devuelve el token |
| `POST /api/auth/login` | Público | Inicio de sesión con correo y contraseña |
| `GET /api/aml/check/{documento}` | Público | Consulta la lista negra por documento |
| `GET /api/aml/search?name=` | Público | Consulta la lista negra por nombre |
| `GET /api/bank-customers/{documento}` | JWT | Datos generales del cliente del banco |
| `GET /api/bank-customers/{documento}/financial` | JWT | Datos financieros del cliente del banco |
| `GET /api/credit-score/{documento}` | JWT | Score crediticio |
| `GET /api/clients/me` | JWT | Datos de la persona y avance del onboarding |
| `PUT /api/clients/me` | JWT | Completa dirección, fecha de nacimiento y género |
| `POST /api/clients/me/identity-verification` | JWT | Verificación de identidad (simulada) |
| `GET /api/credit-applications` | JWT | Solicitudes de la persona |
| `POST /api/credit-applications` | JWT | Crea una solicitud y ejecuta las validaciones |
| `GET /api/health` | Público | Estado del servicio |

Para probar los endpoints protegidos en Swagger: ejecutar `/api/auth/login`, copiar el token, pulsar "Authorize" y pegarlo.

## Pruebas

```bash
cd frontend/financiaplus_app
flutter test
```

Cubren el análisis de calidad de las fotos. El backend incluye solo la prueba de arranque del contexto, que requiere MySQL en ejecución.

## Compilar versiones de entrega

```bash
cd frontend/financiaplus_app
flutter build windows --release
flutter build apk --release
```

## Despliegue

El backend se despliega en Render con el `Dockerfile` de `backend/` y una base MySQL en Aiven. Las variables necesarias son `DB_URL`, `DB_USERNAME`, `DB_PASSWORD`, `JWT_SECRET`, `SEED_DEFAULT_PASSWORD`, `JPA_SHOW_SQL=false` y `FORWARD_HEADERS_STRATEGY=framework`. El detalle está en [docs/ARQUITECTURA.md](docs/ARQUITECTURA.md#11-despliegue).
