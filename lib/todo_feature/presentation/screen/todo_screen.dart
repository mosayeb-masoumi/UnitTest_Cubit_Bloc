import 'package:flutter/material.dart';

import 'package:flutter_testing_examle/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing_examle/todo_feature/presentation/bloc/todo_cubit.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => TodoCubit(sl())),
    ], child: const ITodoScreen());
  }
}

class ITodoScreen extends StatefulWidget {
  const ITodoScreen({super.key});

  @override
  State<ITodoScreen> createState() => _ITodoScreenState();
}

class _ITodoScreenState extends State<ITodoScreen> {
  @override
  void initState() {
    super.initState();
    getTodoList();
  }

  void getTodoList() {
    context.read<TodoCubit>().getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TodoList") ,
      backgroundColor: Colors.blueGrey,),
      body: SafeArea(
          child: BlocConsumer<TodoCubit, TodoState>(
             builder: (context , state){
               if (state is TodoLoaded) {
                 return Expanded(
                   child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: state.result.length,
                       itemBuilder: (context, index) {
                         var todoModel = state.result[index];
                         return Container(
                           width: MediaQuery.sizeOf(context).width,
                           height: 100,
                           margin: const EdgeInsets.all(10),
                           color: Colors.green.shade300,
                           child: Center(
                             child:
                             Text("${todoModel.title} ${todoModel.userId}"),
                           ),
                         );
                       }),
                 );
               } else{
                 return Container();
               }
             },
            listener: (context , state){}
            ,
          )),
    );
  }
}
