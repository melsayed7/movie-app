import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/cubit.dart';
import 'package:movie_app/layout/states.dart';
import '../shared/components/widget_component.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

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
              return buildMovie(cubit.popular[index],context);
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1,color:Colors.black),
            itemCount: cubit.popular.length ,
          ),
          fallback:(context)=> const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }


}
