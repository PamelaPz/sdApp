import 'package:flutter/material.dart';
import 'package:sd_app/app/screens/admin/home/blocs/doctors/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsBloc, DoctorsState>(
      builder: (context, state) {
        if (state is DoctorsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is DoctorsLoaded) {
          return ListView.builder(
            itemCount: state.doctors.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.doctors[index].name),
                subtitle: Text(state.doctors[index].email),
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
