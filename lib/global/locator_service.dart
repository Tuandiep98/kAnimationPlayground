import 'package:get_it/get_it.dart';
import 'package:kanimation_playground/modules/firebase/services/firebase_service.dart';
import 'package:kanimation_playground/modules/firebase/services/ifirebase_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IFirebaseService>(() => FirebaseService());
}
