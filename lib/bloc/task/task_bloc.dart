import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:project_two/network/api_service.dart';
import './bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final ApiService api;
  TaskBloc(this.api);


  @override
  TaskState get initialState => InitialTaskState();

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
   if(event is GetTaskEvent) {
     yield LoadingTaskState();
     try{
       final response = await api.getTasks();
       yield LoadedTaskState(response);
     }
     on SocketException catch (e) {
        yield FailTaskState(e.toString());
     }
     on Exception catch (e) {
       yield FailTaskState(e.toString());
     }
   }
  }
}
