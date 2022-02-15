import 'package:firebasetask/common/widgets/app_drawer.dart';
import 'package:firebasetask/core/utils/app_text_styles.dart';
import 'package:firebasetask/core/utils/colors.dart';
import 'package:firebasetask/core/utils/screen_loader.dart';
import 'package:firebasetask/core/utils/sizes.dart';
import 'package:firebasetask/di.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';
import 'package:firebasetask/presentation/cubit/home/home_cubit.dart';
import 'package:firebasetask/presentation/screens/home/widget/cusine_widget.dart';
import 'package:firebasetask/presentation/screens/home/widget/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  HomeCubit homeCubit = sl();

  @override
  void initState() {
    super.initState();
    homeCubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          backgroundColor: UIColors.backgroundColor,
          title: Text(
            "Home Screen",
            style: StyleText.mediumDarkGray15,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black87,
            ),
            onPressed: () => {},
          )),
      drawer: const AppDrawer(),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildFilterWidget(),
        10.verticalSpace,
        BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if(state is LoadedState){
              return _buildFoodItemList(state.foodList!);
            }else if(state is FilterStateLoaded){
              return _buildFoodItemList(state.foodList!);
            }else if(state is ErrorState){
              return Center(
                child: Text(state.error!,style: StyleText.mediumDarkGray17,),
              );
            }
            return const AppCircularIndicator();
          },
        )
      ],
    );
  }


  _buildFoodItemList(List<FoodItemsModel> list){
    return list.isNotEmpty ? Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (_, index) =>
            CusineWidget(data: list[index]),
        itemCount: list.length,
      ),
    ) :  Center(
      child: Text("NO DATA FOUND",style: StyleText.mediumDarkGray17,),
    );
  }

  _buildFilterWidget() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      buildWhen: (current, newState) {
        if (newState is FiltersLoadingState || newState is ErrorState || newState is FilterStateLoaded) {
          return false;
        }
        return true;
      },
      builder: (context, state) {

        return state is LoadedState ? Padding(
          padding:  EdgeInsets.only(left: 18.0.flexibleWidth,right:18.flexibleWidth,top:5.flexibleHeight),
          child: SizedBox(
            height: 50.flexibleHeight,
            child: ListView.builder(
                itemCount: state.filterList!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterWidget(
                      filterName: state.filterList![index],
                      onFilterPressed: () {
                        if(state.filterList![index].contains("All")){
                         homeCubit.getData();
                        }else{
                          homeCubit.getFilterData(state.filterList![index]);
                        }

                      },
                    ),
                  );
                }),
          ),
        ) : Container();
      },
    );
  }


}
