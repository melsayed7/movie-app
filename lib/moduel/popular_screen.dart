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
      builder: (context , index){
        var cubit = MovieCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) {
              return buildMovie(cubit.popular[index],context);
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1,color:Colors.black),
            itemCount: cubit.popular.length ,
        );
      },
    );
  }


}
