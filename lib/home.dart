import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/injection_container.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_bloc.dart';
import 'package:todo_app/screens/todo/presentation/pages/todo_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoScreenBloc>(
          create: (context) => sl<TodoScreenBloc>(),
        ),
      ],
      child: TodoScreen(),
    );
  }
}
