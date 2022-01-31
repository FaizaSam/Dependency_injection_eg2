import 'package:di_eg3/Student.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<Student>(() => Student());
//  getIt.registerFactory<Student>(() => Student());
}
