import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sd_app/app/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:sd_app/app/repositories/user_repository.dart';
import 'package:sd_app/app/screens/admin/home/home_screen.dart';
import 'package:sd_app/app/screens/login/login_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc(),
          ),
          BlocProvider<AuthenticateBloc>(
            create: (BuildContext context) => AuthenticateBloc(
              userRepository: _userRepository,
            )..add(AppStarted()),
          )
        ],
        child: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return HomeScreen();
        }
        if (state is Unauthenticated) {
          return BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(
                userRepository: state.userRepository,
                authenticateBloc: BlocProvider.of<AuthenticateBloc>(context)),
            child: LoginScreen(),
          );
        }

        return Container();
      },
    );
  }
}
