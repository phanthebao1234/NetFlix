import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  // Khởi tạo một đối tượng Logger với PrettyPrinter để định dạng và hiển thị log một cách rõ ràng.
  Logger logger = Logger(printer: PrettyPrinter(methodCount: 0, colors: true,printEmojis: true));

  @override
  //  Xử lý lỗi khi một yêu cầu HTTP gặp phải lỗi.
  void onError( DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath'); //Error log
    logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}'); //Debug log
    handler.next(err); //Continue with the Error
  }

  @override
  // Xử lý khi bắt đầu một yêu cầu HTTP
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  // Xử lý khi nhận được phản hồi từ một yêu cầu HTTP.
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('STATUSCODE: ${response.statusCode} \n '
        'STATUSMESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'Data: ${response.data}'); // Debug log
    handler.next(response); // continue with the Response
  }
}


class AuthorizationInterceptor extends Interceptor {
  // AuthorizationInterceptor là một interceptor dùng để thêm token vào tiêu đề của các yêu cầu HTTP cho mục đích xác thực.
  @override
  // Xử lý khi bắt đầu một yêu cầu HTTP.
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Xử lý khi bắt đầu một yêu cầu HTTP.
    final token  = sharedPreferences.getString('token');
    // Thêm token vào tiêu đề Authorization của yêu cầu.
    options.headers['Authorization'] = "Bearer $token";
    // Tiếp tục với yêu cầu (handler.next(options)).
    handler.next(options); // continue with the Request
  }
}