# Oolio Food Truck POS System

A modern, feature-rich Point of Sale (POS) system designed specifically for food trucks and mobile food vendors. Built with Flutter and featuring offline-first architecture, real-time synchronization, and comprehensive order management.

## 🚀 Features

### 📱 Core POS Functionality
- **Product Catalog Management** - Browse and manage 1000+ food items with categories, variants, and add-ons
- **Shopping Cart System** - Add/remove items, modify quantities, and apply special instructions
- **Order Processing** - Complete order workflow from cart to payment to receipt generation
- **Customer Management** - Collect and store customer information for orders

### 🖨️ Advanced Printing System
- **ESC/POS Receipt Printing** - Professional thermal receipt generation
- **Multiple Print Destinations** - Support for USB, Network, Bluetooth, and File output
- **Print Queue Management** - Prioritized print jobs with retry logic and error handling
- **Receipt Templates** - Customizable customer and kitchen receipt formats
- **Demo Mode** - Generate `.txt` receipt files for testing and backup

### 🔄 Synchronization Engine
- **Offline-First Architecture** - Full functionality without internet connection
- **Real-Time Connectivity Detection** - Automatic online/offline status monitoring
- **Bidirectional Sync** - Local changes sync to server when connectivity is restored
- **Conflict Resolution** - Graceful handling of concurrent modifications
- **Partial Sync Support** - Batch processing for large datasets
- **Retry Logic** - Exponential backoff for failed sync operations

### 📊 Order Management
- **Order Tracking** - Real-time order status updates
- **Order History** - Complete order records with search and filtering
- **Payment Processing** - Multiple payment methods (Cash, Card, Digital)
- **Order Analytics** - Sales reporting and insights

### 🎨 Modern UI/UX
- **Responsive Design** - Optimized for tablets and mobile devices
- **Material Design 3** - Modern, intuitive interface
- **Dark/Light Theme Support** - User preference customization
- **Progressive Loading** - Fast initial load with background data fetching
- **Real-Time Status Indicators** - Sync status, connectivity, and system health

## 🏗️ Architecture

### Clean Architecture Principles
The app follows Clean Architecture with clear separation of concerns:

```
lib/
├── core/                    # Core functionality and utilities
│   ├── constants/          # App constants and configuration
│   ├── di/                # Dependency injection setup
│   ├── errors/            # Error handling and exceptions
│   ├── navigation/        # App routing and navigation
│   ├── services/          # Core services (connectivity, storage)
│   └── storage/           # Local storage and database
├── features/              # Feature modules
│   ├── cart/             # Shopping cart functionality
│   ├── orders/           # Order management
│   ├── printing/         # Print system
│   ├── products/         # Product catalog
│   └── sync/             # Synchronization engine
└── shared/               # Shared utilities and models
```

### Feature Module Structure
Each feature follows a consistent structure:
```
features/[feature]/
├── data/
│   ├── models/           # Data models and DTOs
│   ├── repositories/     # Repository implementations
│   └── services/         # Data services
├── domain/
│   ├── models/          # Domain entities
│   ├── repositories/    # Repository interfaces
│   └── services/        # Business logic services
└── presentation/
    ├── cubit/           # State management
    ├── pages/           # UI pages
    └── widgets/         # Reusable UI components
```

## 🛠️ Tech Stack

### Frontend
- **Flutter 3.8.0** - Cross-platform UI framework
- **Dart 3.0** - Programming language
- **Material Design 3** - UI design system

### State Management
- **Bloc/Cubit** - Predictable state management
- **flutter_bloc** - State management library

### Data & Storage
- **Hive** - Local NoSQL database for offline storage
- **Freezed** - Immutable data classes and unions
- **JSON Annotation** - JSON serialization/deserialization

### Dependency Injection
- **GetIt** - Service locator for dependency injection
- **Injectable** - Code generation for dependency injection

### Navigation
- **GoRouter** - Declarative routing and navigation

### Network & Sync
- **Dio** - HTTP client for network requests
- **connectivity_plus** - Network connectivity detection
- **Custom Sync Engine** - Offline-first synchronization

### Printing
- **esc_pos_utils_plus** - ESC/POS command generation for thermal printers
- **path_provider** - File system access for receipt storage

### Development Tools
- **build_runner** - Code generation
- **flutter_lints** - Code analysis and linting
- **equatable** - Value equality for objects

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.8.0 or higher)
- **Dart SDK** (3.0 or higher)
- **FVM** (Flutter Version Management) - Recommended
- **Android Studio** or **VS Code** with Flutter extensions
- **Git**

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/oolio_fe_challenge.git
cd oolio_fe_challenge
```

### 2. Install Dependencies
```bash
# Using FVM (recommended)
fvm install
fvm flutter pub get

# Or using Flutter directly
flutter pub get
```

### 3. Generate Code
```bash
# Generate dependency injection, freezed classes, and JSON serialization
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# Or using Flutter directly
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the App
```bash
# Using FVM
fvm flutter run

# Or using Flutter directly
flutter run
```

## 🔧 Building for Production

### Android
```bash
# Build APK
fvm flutter build apk --release

# Build App Bundle (recommended for Play Store)
fvm flutter build appbundle --release
```

### iOS
```bash
# Build for iOS
fvm flutter build ios --release
```

### Web
```bash
# Build for web
fvm flutter build web --release
```

## 📱 Platform Support

- **Android** - Full support with native features
- **iOS** - Full support with native features  
- **Web** - Full support (Chrome, Firefox, Safari)
- **Desktop** - Partial support (Windows, macOS, Linux)

## 🧪 Testing

### Run Tests
```bash
# Run all tests
fvm flutter test

# Run tests with coverage
fvm flutter test --coverage
```

### Test Structure
- **Unit Tests** - Business logic and utilities
- **Widget Tests** - UI component testing
- **Integration Tests** - End-to-end user flows

## 📁 Project Structure

### Key Directories
- `lib/core/` - Core functionality, services, and utilities
- `lib/features/` - Feature modules with clean architecture
- `lib/shared/` - Shared models and utilities
- `assets/` - Static assets (images, fonts, data files)
- `test/` - Test files

### Configuration Files
- `pubspec.yaml` - Dependencies and project configuration
- `analysis_options.yaml` - Linting and analysis rules
- `fvmrc` - Flutter version management configuration

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

### 1. Fork and Clone
```bash
git clone https://github.com/your-username/oolio_fe_challenge.git
cd oolio_fe_challenge
```

### 2. Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
```

### 3. Make Changes
- Follow the existing code style and architecture
- Write tests for new functionality
- Update documentation as needed

### 4. Run Tests and Linting
```bash
# Run tests
fvm flutter test

# Check linting
fvm flutter analyze

# Format code
fvm flutter format .
```

### 5. Commit and Push
```bash
git add .
git commit -m "feat: add your feature description"
git push origin feature/your-feature-name
```

### 6. Create Pull Request
- Provide a clear description of changes
- Reference any related issues
- Ensure all tests pass

## 📝 Code Style

### Dart/Flutter Conventions
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add documentation for public APIs
- Keep functions small and focused

### Architecture Guidelines
- Follow Clean Architecture principles
- Use dependency injection for all dependencies
- Separate business logic from UI logic
- Use immutable data classes with Freezed

## 🐛 Bug Reports

When reporting bugs, please include:
- Flutter/Dart version
- Device/OS information
- Steps to reproduce
- Expected vs actual behavior
- Screenshots or logs if applicable

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the excellent framework
- Contributors to the open-source packages used
- Food truck operators for inspiration and feedback

## 📞 Support

For support and questions:
- Create an issue on GitHub
- Check the documentation
- Review existing issues and discussions

---

**Built with ❤️ for food truck operators everywhere**