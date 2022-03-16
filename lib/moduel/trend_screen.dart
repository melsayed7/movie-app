import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components/widget_component.dart';

class UpComingScreen extends StatelessWidget {
  const UpComingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit , MovieStates>(
      listener: (context , index){},
      builder: (context , state){
        var cubit = MovieCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.movieModel != null ,
          builder: (context)=> ListView.separated(
            itemBuilder: (context, index) {
              return buildMovie(cubit.upComing[index],context,cubit.upComing[index].id);
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1,color:Colors.black),
            itemCount: cubit.upComing.length ,
          ),
          fallback:(context)=> const Center(child: CircularProgressIndicator()),
        );
        },
    );
  }
}
