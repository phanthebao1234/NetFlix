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

Trong các dự án Flutter, việc sử dụng cả Entity và Model giúp tách biệt các khía cạnh khác nhau của dữ liệu và logic ứng dụng, đồng thời duy trì nguyên tắc phân lớp (Layered Architecture). Cụ thể:

Entity:
Định nghĩa dữ liệu cốt lõi: Entity thường đại diện cho dữ liệu cốt lõi, chính yếu trong ứng dụng của bạn. Nó tập trung vào logic và quy tắc nghiệp vụ.

Tách biệt khỏi các lớp khác: Entity không phụ thuộc vào các lớp khác và không có mối quan hệ trực tiếp với tầng giao diện hoặc tầng dữ liệu.

Tính độc lập: Entity có tính độc lập cao, dễ dàng tái sử dụng và kiểm thử.

Model:
Chuyển đổi dữ liệu: Model thường đại diện cho dữ liệu được chuyển đổi từ/đến các dịch vụ mạng hoặc cơ sở dữ liệu. Nó thường bao gồm các phương thức để chuyển đổi giữa các định dạng dữ liệu như JSON và đối tượng Dart.

Liên kết với giao diện người dùng: Model thường được sử dụng để hiển thị dữ liệu trên giao diện người dùng và có thể bao gồm các thuộc tính và phương thức dành riêng cho giao diện người dùng.

Ví dụ:
Entity:

```dart
class User {
  final String id;
  final String name;

  User({required this.id, required this.name});
}
```

Model:

```dart
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;

  UserModel({required this.id, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
```

Tại sao cần cả hai:
Separation of Concerns: Tách biệt trách nhiệm của các lớp giúp mã dễ hiểu, dễ bảo trì và dễ mở rộng.

Kiểm thử: Các Entity thường không thay đổi và dễ dàng kiểm thử độc lập với các tầng khác.

Chuyển đổi dữ liệu: Model giúp chuyển đổi dữ liệu từ/đến các định dạng khác nhau, phù hợp với việc giao tiếp với API hoặc cơ sở dữ liệu.

Sự kết hợp của Entity và Model giúp ứng dụng của bạn trở nên linh hoạt hơn, dễ quản lý và duy trì.
