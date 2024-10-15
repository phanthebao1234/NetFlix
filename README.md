# netflix

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
|--- core/                      # Common components used across layers (Các thành phần phổ biến được sử dụng trên các lớp)
|--- data/
|    |---datasources/           # APIs, Local DB
|    |---models/                # Data models
|    |---repositories/          # Implementation of repositories (Triển khai kho lưu trữ)
|--- domain/
|    |--- entities/             # Business logic models (Mô hình logic nghiệp vụ)
|    |--- repositories/         # Abstract repositories (kho trừu tượng)
|    |--- usecases/             # Use case (trường hợp sử dụng)
|--- presentation/  
|    |--- blogs/                # State management (e.g., Bloc) (Quản lý State)
|    |--- pages/                # Ui (Flutter widgets) (Giao diện)
