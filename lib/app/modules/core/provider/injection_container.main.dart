import 'package:comparotto/app/modules/core/interfaces/http_clients/http_client.dart';
import 'package:comparotto/app/modules/home/data/datasources/employee_data_source.dart';
import 'package:comparotto/app/modules/home/domain/repos/employee_repo.dart';
import 'package:comparotto/app/modules/home/domain/usecase/get_all_employees_use_case.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
final HttpClientHNT<http.Response> httpClient = HttpClient();

Future<void> init() async {
  _initCategories();
}

Future _initCategories() async {
  sl
    ..registerLazySingleton(() => HomeCubit(sl()))
    ..registerLazySingleton<GetAllEmployeesUseCase>(
        () => GetAllEmployeesUseCase(sl()))
    ..registerLazySingleton<EmployeeRepo>(() => EmployeeRepoImpl(sl()))
    ..registerLazySingleton<EmployeeDataSource>(
        () => EmployeeDataSourceImpl(httpClient));
}
