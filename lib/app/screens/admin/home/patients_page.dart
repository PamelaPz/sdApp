import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sd_app/app/screens/admin/home/blocs/patients/bloc.dart';

class PatientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientsBloc, PatientsState>(
      builder: (context, state) {
        if (state is PatientsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PatientsLoaded) {
          return ListView.builder(
            itemCount: state.patients.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.patients[index].name),
                leading: Icon(Icons.person),
                onTap: () {},
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
