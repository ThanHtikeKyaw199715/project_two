import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two/bloc/task/bloc.dart';
import 'package:project_two/network/api_service.dart';
import 'package:project_two/ui/my_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context,apiService,child) {
          return BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(apiService),
            child: MaterialApp(
              title: "BLoc API Service",
              theme: ThemeData(
                primaryColor: Colors.redAccent
              ),
              home: MyHome(),
            ),
          );
        }
      ),
    );
  }
}
