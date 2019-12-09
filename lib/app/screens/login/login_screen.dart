import 'package:flutter/material.dart';
import 'package:sd_app/app/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController =
      TextEditingController(text: 'marcotoriz.d@gmail.com');
  final _passwordController = TextEditingController(text: 'asdasd');

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Medical Login'),
              centerTitle: true,
            ),
            body: Form(
              child: Container(
                padding: EdgeInsets.all(9),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'username'),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      autocorrect: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'password'),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    MaterialButton(
                      color: Colors.indigo,
                      textColor: Colors.white,
                      elevation: 2,
                      onPressed:
                          state is! LoginLoading ? _onLoginButtonPressed : null,
                      child: Text('Iniciar sesion'),
                    ),
                    Container(
                      child: state is LoginLoading
                          ? CircularProgressIndicator()
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
