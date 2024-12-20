class Errors {
  static Map<String, dynamic> generalApiError = {'status_code': 500, 'message': 'Something went wrong'};
  static Map<String, dynamic> noInternetError = {'status_code': 400, 'message': 'Please check your internet connection'};
  static Map<String, dynamic> formatException = {'status_code': 400, 'message': 'Invalid data format'};
  static Map<String, dynamic> timeOutException = {'status_code': 408, 'message': 'Something went wrong'};
}