class NetworkUrl {
  static String bffBaseUrl =
      'https://southamerica-east1-restaurante-comparotto.cloudfunctions.net/api/';
  static String funcionariosEndpoint = '${bffBaseUrl}funcionario/';
  static String getAllFuncionariosEndpoint = '${funcionariosEndpoint}get-all';
  static String replacePathParams(String path, Map<String, String> params) {
    for (var key in params.keys) {
      path = path.replaceAll('{$key}', params[key]!);
    }
    return path;
  }
}
