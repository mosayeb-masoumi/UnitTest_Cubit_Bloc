
import 'package:dio/dio.dart';
class DioUtil{
  static Dio? _instance;
  static Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }
  static Dio createDioInstance() {
    var dio = Dio();
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers["Authorization"] = "Bearer " + "accessToken";
      options.headers["Content-Type"] = "application/json";
      options.headers["Accept"] = "*/*";
      return handler.next(options);//modify your request
    }, onResponse: (response, handler) {
        return handler.next(response);
    }, onError: (DioError e, handler) async {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {//catch the 401 here
            return ;
        } else {
          handler.next(e);
        }
      }else{
        handler.next(e);
      }
    }));
    return dio;
  }
}