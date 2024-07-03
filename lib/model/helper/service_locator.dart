
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/managers/auth_manager.dart';
import '../../controller/managers/state_manager.dart';
import '../../controller/services/dio_service.dart';

final getIt = GetIt.instance;

Future <void> setupServiceLocator() async{
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<StateManager>(StateManager());
  getIt.registerSingleton<AuthManager>(AuthManager());
  // getIt.registerSingleton<UserManager>(UserManager());




}