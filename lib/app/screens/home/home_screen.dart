import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sd_app/app/blocs.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticateBloc>(context)..add(LoggedOut());
            },
          )
        ],
        title: Text('Medical System'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('isRealAuth'),
      ),
    );
  }
}
