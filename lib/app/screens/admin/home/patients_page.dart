import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sd_app/app/models/Entry.dart';
import 'package:sd_app/app/models/Patient.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:sd_app/app/screens/admin/home/blocs/patients/bloc.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  Firestore firestore = Firestore.instance;
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
                  radius: 9,
                  backgroundColor: getColorAccepted(
                      accepted: state.patients[index].accepted),
                ),
                onTap: () => _onTabPatientPressed(entry: state.patients[index]),
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

  _onTabPatientPressed({@required Entry entry}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Center(child: Text(entry.name)),
                subtitle: Center(
                  child: Text(
                    entry.uid.toString(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('observaciones:'),
                  Text(entry.observations.toString()),
                ],
              ),
              patientStream(entry),
            ],
          ),
        );
      },
    );
  }

  StreamBuilder<DocumentSnapshot> patientStream(Entry entry) {
    return StreamBuilder(
      stream: firestore
          .collection('patients')
          .document(entry.idPatients)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          Patient patient = Patient.fromDocumentSnapshot(snapshot.data);

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Ingresó:'),
                  Text(patient.dateEgress.toString()),
                ],
              ),
              StreamBuilder(
                stream: firestore
                    .collection('personal')
                    .document(entry.idPersonal)
                    .snapshots(),
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    Personal personal =
                        Personal.fromDocumentSnapshot(snap.data);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Registró:'),
                        Text(personal.name.toString())
                      ],
                    );
                  }
                },
              ),
              StreamBuilder(
                stream: firestore
                    .collection('personal')
                    .document(patient.idPersonal)
                    .snapshots(),
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    Personal personal =
                        Personal.fromDocumentSnapshot(snap.data);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Medico a cargo:'),
                        Text(personal.name)
                      ],
                    );
                  }
                },
              )
            ],
          );
        }
      },
    );
  }
}
