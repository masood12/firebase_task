import 'package:firebasetask/common/widgets/app_drawer.dart';
import 'package:firebasetask/core/utils/app_text_styles.dart';
import 'package:firebasetask/core/utils/colors.dart';
import 'package:firebasetask/core/utils/sizes.dart';
import 'package:firebasetask/presentation/screens/home/widget/cusine_widget.dart';
import 'package:firebasetask/presentation/screens/home/widget/filter_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home-screen";

  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
            onPressed: () => _key.currentState!.openDrawer(),
          )),
      drawer: const AppDrawer(),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterWidget(
                      filterName: "Chicken",
                    ),
                  );
                }),
          ),
        ),
        10.verticalSpace,
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (_, index) => const CusineWidget(),
            itemCount: 12,
          ),
        )
      ],
    );
  }
}
