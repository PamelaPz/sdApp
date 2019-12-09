import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sd_app/app/blocs.dart';
import 'package:sd_app/app/screens/admin/home/blocs/patients/bloc.dart';
import 'package:sd_app/app/screens/admin/home/doctors_page.dart';
import 'package:sd_app/app/screens/admin/home/nurses_page.dart';
import 'package:sd_app/app/screens/admin/home/patients_page.dart';
import 'package:sd_app/app/screens/admin/home/security_personal_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Pacientes',
      icon: Icon(Icons.person),
    ),
    Tab(
      text: 'Doctores',
      icon: Icon(Icons.person_outline),
    ),
    Tab(
      text: 'Enfermeras(os)',
      icon: Icon(Icons.person_outline),
    ),
    Tab(
      text: 'Seguridad',
      icon: Icon(Icons.person_pin),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: myTabs,
        ),
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
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          BlocProvider<PatientsBloc>(
            create: (BuildContext conext) =>
                PatientsBloc()..add(PatientsStarted()),
            child: PatientsPage(),
          ),
          DoctorsPage(),
          NursesPage(),
          SecurityPersonalPage(),
        ],
      ),
    );
  }
}
