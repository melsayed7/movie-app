import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components/widget_component.dart';

class TrendScreen extends StatelessWidget {
  const TrendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit , MovieStates>(
      listener: (context , index){},
      builder: (context , index){
        var cubit = MovieCubit.get(context);
        return ListView.separated(
          itemBuilder: (context, index) {
            return buildMovie(cubit.trend[index],context);
          },
          separatorBuilder: (context, index) => const Divider(thickness: 1,color:Colors.black),
          itemCount: cubit.trend.length ,
        );
      },
    );
  }
}
