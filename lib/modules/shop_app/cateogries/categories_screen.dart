import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/models/shop_app/categories_model.dart';
import 'package:untitled/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          /*
          final categoriesModel= ShopCubit.get(context).categoriesModel;
          if (categoriesModel != null)
          {
             return ListView.separated(
            itemBuilder: (context,index)=>buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data[index]),
            separatorBuilder:(context,index)=>myDivider() ,
             itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
          );

          }
          else
            return Center(child: CircularProgressIndicator(),);
        */
          final categoriesModel= ShopCubit.get(context).categoriesModel;
          if (categoriesModel != null)
          {
            return ListView.separated(
              itemBuilder: (context,index)=>buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data[index]),
              separatorBuilder:(context,index)=>myDivider() ,
              itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
            );

          }
          else
            return Center(child: CircularProgressIndicator(),);
        }
        );
  }

  Widget buildCatItem(DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
            '${model.name}' ,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,

        ),
      ],
    ),
  );
}
