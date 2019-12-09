import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sd_app/app/screens/admin/home/blocs/security/bloc.dart';

class SecurityPersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityBloc, SecurityState>(
      builder: (context, state) {
        if (state is SecurityLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SecurityLoaded) {
          return ListView.builder(
            itemCount: state.securityPersonal.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.securityPersonal[index].name),
                subtitle: Text(state.securityPersonal[index].email),
                leading: Icon(Icons.person),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
