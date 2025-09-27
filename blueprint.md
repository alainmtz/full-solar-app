# FullSolar App Blueprint

## Visión General

FullSolar es una aplicación móvil diseñada para gestionar un catálogo de productos de energía solar. La aplicación permite a los usuarios ver, añadir, editar y eliminar productos. La arquitectura actual está completamente basada en el ecosistema de Firebase.

## Arquitectura y Características

*   **Backend:** Firebase (Firestore)
*   **Seguridad:** Firebase App Check
*   **Gestión de Estado:** `provider`
*   **Navegación:** `go_router`
*   **Estilo y Tema:** Material 3 con `google_fonts` y soporte para modo claro/oscuro.

## Plan de Migración a Firebase (¡Completado!)

**Objetivo:** Migrar la infraestructura del backend de Supabase a Firebase.

**Fases del Plan:**

1.  **Integración de Firebase:**
    *   [x] Añadir dependencias de Firebase (`firebase_core`, `cloud_firestore`).
    *   [x] Configurar el proyecto de Firebase y generar el archivo `firebase_options.dart`.
    *   [x] Inicializar Firebase en la aplicación.
    *   [x] **Añadir y configurar Firebase App Check:** Se ha añadido para garantizar la seguridad de las llamadas al backend.

2.  **Migración de Datos:**
    *   [x] Se ha implementado un `DatabaseService` que se comunica directamente con Firestore, eliminando la necesidad de un script de migración manual.

3.  **Refactorización del Código:**
    *   [x] Crear un `DatabaseService` para encapsular la lógica de acceso a Firestore.
    *   [x] Modificar la `HomeScreen` y los proveedores para que utilicen `DatabaseService` como la única fuente de datos.
    *   [x] Eliminar el `SupabaseService` y el `DatabaseService` (SQFlite), ya que no serán necesarios.

4.  **Limpieza y Verificación:**
    *   [x] Eliminar las dependencias no utilizadas (`supabase_flutter`, `sqflite`, `path`).
    *   [x] Verificar que la aplicación funciona correctamente, cargando los datos desde Firestore.
