import 'package:flutter/widgets.dart';
import 'package:todo_app/screens/todo/presentation/pages/todo_screen.dart';
import 'package:todo_app/size_config.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // MultiBlocProvider(
    //     //   providers: [
    //     //     // BlocProvider<ProductScreenBloc>(
    //     //     //   create: (context) => sl<ProductScreenBloc>(),
    //     //     // ),
        
    //     //   ],
    //     //   child: TodoScreen(),
    //     // )
    return TodoScreen();
  }
}