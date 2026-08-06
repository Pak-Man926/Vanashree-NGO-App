# Vanashree NGO Application

A Flutter application developed for the Vanashree NGO, showcasing modern mobile app development practices including feature-driven architecture, declarative routing, and robust state management.

## Project Structure

This project follows a feature-driven, clean architecture-like structure. The main directories inside `lib` are:

- **`config/`**: Contains app-wide configurations such as:
  - `router/`: Setup for declarative navigation using `go_router`.
  - `theme/`: Application themes (light/dark mode, typography, colors).
  - `localization/`: Setup for multi-language support.

- **`core/`**: Houses all shared utilities, base classes, and core logic used across multiple features:
  - `common/`: Reusable widgets (e.g., buttons, inputs), constants (padding, spacing).
  - `database/`: Local database setup.
  - `error/`: Failure handling and custom exception models.
  - `extensions/`: Helpful Dart extensions on `BuildContext`, `String`, etc.
  - `usecases/`: Base definitions for application usecases.
  - `utils/`: Helper methods and utilities.
  - `locator.dart`: Dependency injection setup using `get_it`.

- **`features/`**: Contains the core modules of the app, each separated by feature domain:
  - `app_start/`: Logic related to app initialization and splash screens.
  - `auth/`: User authentication, sign up, login, and profile creation.
  - `homepage/`: Main dashboard and features available post-login.
  - `localization/`: UI specific to language settings or switching.
  - `onboarding/`: Screens displayed to new users upon first launch.

Each feature generally isolates its own UI (presentation), business logic, and potentially data-fetching layers.

## State Management

The application heavily relies on **Riverpod** (`flutter_riverpod`, `hooks_riverpod`, `riverpod_annotation`) for state management. 

### How it is implemented:
- **Declarative & Safe**: Riverpod is used to expose state securely, manage dependencies reactively, and prevent common runtime errors associated with other state management solutions (like Provider).
- **Code Generation**: The project uses `riverpod_annotation` alongside `riverpod_generator` to auto-generate Providers. This provides strong typing and reduces boilerplate.
- **Integration with Hooks**: The inclusion of `hooks_riverpod` and `flutter_hooks` allows the team to simplify widget lifecycles (like managing `TextEditingControllers` or animations) directly inside the `build` method.
- **Co-existence with GetIt**: While Riverpod handles reactive UI state, `get_it` (`lib/core/locator.dart`) is used as a service locator for injecting repositories, data sources, and other singletons across the app.

## Key Packages & Dependencies

Below is a breakdown of the critical packages used to build this application:

### State Management & Reactivity
- **`flutter_riverpod` & `hooks_riverpod`**: Robust, compile-safe state management.
- **`flutter_hooks`**: Simplifies widget state and lifecycle management (like `useState`, `useEffect`).

### Navigation
- **`go_router`**: A declarative routing package that provides a robust URI-based routing mechanism, perfect for deep linking and modern app navigation.

### Networking & API
- **`dio`**: A powerful HTTP client for Dart used for network requests.
- **`chucker_flutter`**: An interceptor that logs HTTP requests and responses, providing an in-app UI to inspect network traffic for debugging.

### Configuration & Localization
- **`flutter_dotenv`**: For loading environment variables from a `.env` file securely.
- **`intl`**: For internationalization and localization support.

### Local Storage & Databases
- **`isar`**: A super-fast, cross-platform NoSQL database used for persistent local data storage.
- **`flutter_secure_storage`**: Used to securely store sensitive data (like authentication tokens) in the device's keychain/keystore.
- **`path_provider`**: To find commonly used locations on the filesystem.

### Dependency Injection
- **`get_it`**: A simple service locator to decouple the interface from the implementation, making testing and modularity easier.

### UI & Assets
- **`shimmer`**: Used to create loading skeleton animations.
- **`cached_network_image`**: For downloading, caching, and displaying images from the internet efficiently.
- **`flutter_svg`**: To render SVG vector graphics.
- **`google_maps_flutter`**: For rendering Google Maps inside the application.
- **`flutter_launcher_icons`**: To generate app launcher icons.
- **`flutter_native_splash`**: To generate native splash screens.
- **`country_state_city_pro`**: A package providing country, state, and city pickers.
- **`phosphor_icons`**: For using the Phosphor icon family.
- **`double_tap_to_exit`**: For handling double tap back button to exit the application.

### Developer Tools & Utilities
- **`device_preview`**: Allows viewing how the app looks on various device screens during development.
- **`logger`**: A small, easy-to-use, and extensible logger for debugging.
- **`equatable`**: Simplifies object comparison, heavily used in state models to determine if a state has changed.
- **`connectivity_plus`**: Discovers the network connectivity state (e.g., WiFi, Mobile Data).
- **`package_info_plus`**: To query information about the application package (version, build number, etc.).

## Getting Started

To get started with the project, ensure you have Flutter installed (SDK version `^3.11.4` is recommended).

1. Clone the repository.
2. Run `flutter pub get` to fetch the dependencies.
3. Run `dart run build_runner build -d` to generate the necessary Riverpod and Isar files.
4. Run the app using `flutter run`.
