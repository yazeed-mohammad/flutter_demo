import 'package:demo_app/core/network/http/http_client.dart';
import 'package:demo_app/screens/loginPage/data/base_login_data.dart';
import 'package:demo_app/screens/loginPage/data/login_data_impl.dart';
import 'package:demo_app/screens/loginPage/repo/base_login_repo.dart';
import 'package:demo_app/screens/loginPage/repo/login_repo_impl.dart';
import 'package:get_it/get_it.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

final sl = GetIt.instance;

class ServiceLocator {
  setup() {
    ///http client
    sl.registerLazySingleton<HttpClient>(() => HttpClient());

    ///login
    sl.registerLazySingleton<BaseLoginData>(() => LoginDataImpl(sl()));
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepoImpl(sl()));
  }
}
