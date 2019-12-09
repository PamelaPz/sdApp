import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sd_app/app/models/Entry.dart';
import 'package:sd_app/app/screens/admin/home/blocs/patients/bloc.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
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
                trailing: CircleAvatar(
                  radius: 10,
                  backgroundColor: getColorAccepted(
                      accepted: state.patients[index].accepted),
                ),
                onTap: () =>
                    _onTabPatientPressed(patient: state.patients[index]),
              );
            },
          );
        }
        return Container();
      },
    );
  }

  Color getColorAccepted({@required accepted}) {
    return accepted ? Colors.green : Colors.red;
  }

  _onTabPatientPressed({@required Entry patient}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Center(child: Text(patient.name)),
              )
            ],
          ),
        );
      },
    );
  }
}
