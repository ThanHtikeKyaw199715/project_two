import 'package:meta/meta.dart';
import 'package:project_two/network/model/task_model.dart';

@immutable
abstract class TaskState {}

class InitialTaskState extends TaskState {}

class LoadingTaskState extends TaskState{}

class LoadedTaskState extends TaskState{
  final List<TaskModel> taskModels;
  LoadedTaskState(this.taskModels);
}

class FailTaskState extends TaskState{
  final String error;
  FailTaskState (this.error);
}

