class NetworkUrl {
  static String bffBaseUrl =
      'https://southamerica-east1-restaurante-comparotto-prod.cloudfunctions.net/api/';
  static String authEndpoint = '${bffBaseUrl}auth/login';
  // employees
  static String employeesEndpoint = '${bffBaseUrl}funcionario/';
  static String getAllEmployeesEndpoint = '${employeesEndpoint}get-all';
  // products
  static String createProductEndpoint = '${bffBaseUrl}produto/create';
  static String replacePathParams(String path, Map<String, String> params) {
    for (var key in params.keys) {
      path = path.replaceAll('{$key}', params[key]!);
    }
    return path;
  }
}
// https://southamerica-east1-restaurante-comparotto-prod.cloudfunctions.net/api/funcionario/get-all