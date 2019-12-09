import 'package:flutter/material.dart';
import 'package:sd_app/app/screens/admin/home/blocs/nurses/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NursesBloc, NursesState>(
      builder: (context, state) {
        if (state is NursesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is NursesLoaded) {
          return ListView.builder(
            itemCount: state.nurses.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.nurses[index].name),
                subtitle: Text(state.nurses[index].email),
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
