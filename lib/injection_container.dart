import 'package:get_it/get_it.dart';
import 'package:todo_app/screens/todo/data/datasources/local/todo_local.dart';
import 'package:todo_app/screens/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_app/screens/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/screens/todo/domain/usecases/todo_usecase.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  sl.registerLazySingleton<TodoLocal>(
    () => TodoLocalImpl(),
  );

  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImplement(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => TodoUsecase(sl()));

  // Bloc
  sl.registerFactory(
    () => TodoScreenBloc(sl()),
  );
}
