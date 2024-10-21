import 'package:dartz/dartz.dart';
import 'package:netflix/data/auth/models/signin_req_params.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Lớp này kế thừa từ AuthRepository, đóng vai trò như một repository để quản lý xác thực người dùng.
///
/// Triển khai các phương thức đăng ký và đăng nhập bằng cách sử dụng dịch vụ API và quản lý kết quả trả về với Either.
/// SharedPreferences: Sử dụng để lưu trữ token xác thực một cách an toàn.
/// Dependency Injection: Sử dụng service_locator để quản lý các dịch vụ.
/// ```
class AuthRepositoryImpl extends AuthRepository {
  @override
  //  Phương thức này thực hiện việc đăng ký người dùng.
  Future<Either> signup(SignupReqParams params) async {
    // Gọi tới sl<AuthApiService>().signup(params) để thực hiện yêu cầu đăng ký qua API
    var data = await sl<AuthApiService>().signup(params);
    // Sử dụng fold để xử lý kết quả trả về
    return data.fold(
      // Nếu có lỗi, trả về Left(error).
      (error) {
        return Left(error);
      },
      (data) async {
        // Nếu thành công, lưu token vào SharedPreferences và trả về Right(data)
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  // Phương thức này thực hiện việc đăng nhập người dùng
  Future<Either> signin(SigninReqParams params) async {
    // Gọi tới sl<AuthApiService>().signin(params) để thực hiện yêu cầu đăng nhập qua API.
    var data = await sl<AuthApiService>().signin(params);
    // Sử dụng fold để xử lý kết quả trả về:
    return data.fold(
      // Nếu có lỗi, trả về Left(error).
      (error) {
        return Left(error);
      },
      (data) async {
        // Nếu thành công, lưu token vào SharedPreferences và trả về Right(data)
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token',
            data['user']['token']); // tùy thuộc vào api trả về mà lấy token
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
    
  }
}
