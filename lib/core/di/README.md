# Dependency Injection Setup

This project uses `get_it` with `injectable` package for dependency injection to provide a clean, testable, and maintainable architecture with automatic code generation.

## Architecture

### Service Locator
- **File**: `service_locator.dart`
- **Purpose**: Central registry for all dependencies using injectable annotations
- **Access**: Use `get<T>()` helper method

### Injectable Annotations

#### @singleton
- **LocalStorageService**: Core storage implementation
- **SyncQueueManager**: Manages offline sync operations

#### @LazySingleton
- **ProductRepository**: Data access layer for products (created only when needed)

#### @injectable
- **ProductCubit**: State management for products (new instance each time)
- **SyncCubit**: State management for sync operations (new instance each time)

#### @Injectable(as: Interface)
- **StorageService**: Interface implementation through LocalStorageService

## Usage

### In Widgets
```dart
// Access via context (recommended for widgets)
final cubit = context.read<ProductCubit>();

// Direct access (for non-widget classes)
final repository = get<ProductRepository>();
```

### In Services
```dart
class SomeService {
  final StorageService _storage;
  
  SomeService(this._storage);
  
  // Or use get_it directly
  SomeService() : _storage = get<StorageService>();
}
```

## Benefits

1. **Testability**: Easy to mock dependencies for unit tests
2. **Maintainability**: Centralized dependency management
3. **Flexibility**: Easy to swap implementations
4. **Clean Architecture**: Dependencies flow in one direction
5. **Lazy Loading**: Repositories are created only when needed

## Adding New Dependencies

1. **Create Interface** (if needed):
   ```dart
   abstract class NewService {
     Future<void> doSomething();
   }
   ```

2. **Implement Service with Injectable Annotation**:
   ```dart
   @singleton
   class NewServiceImpl implements NewService {
     @override
     Future<void> doSomething() async {
       // Implementation
     }
   }
   ```

3. **Run Build Runner**:
   ```bash
   flutter packages pub run build_runner build
   ```

### Injectable Annotations Available:
- `@singleton`: Single instance throughout app lifecycle
- `@lazySingleton`: Created only when first requested
- `@injectable`: New instance each time (factory)
- `@Injectable(as: Interface)`: Register implementation for interface

## Best Practices

- Use interfaces for better testability
- Use `@singleton` for stateless services
- Use `@injectable` for stateful objects (Cubits, Controllers)
- Use `@lazySingleton` for expensive-to-create objects
- Always run `build_runner` after adding new injectable classes
- Use `@Injectable(as: Interface)` for interface implementations
- Keep initialization logic in `initializeDependencies()`
