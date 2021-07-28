import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dune/theme.dart';
import 'package:dune/widgets/circle_decoration.dart';
import 'package:dune/widgets/request_container/input_pane/auth.dart';
import 'package:dune/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'body_input.dart';
import 'header_input.dart';
import 'query_parameter_input.dart';

class InputPane extends HookWidget {
  const InputPane({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ContainedTabBarView(
          tabBarProperties: TabBarProperties(
            // isScrollable: true,
            padding: EdgeInsets.only(bottom: 3),
            indicator: CircleTabIndicator(color: AppColors.yellow, radius: 4.0),
            labelColor: AppColors.yellow,
            unselectedLabelColor: Colors.white,
            background: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(7)),
            ),
          ),
          tabBarViewProperties: TabBarViewProperties(
            physics: NeverScrollableScrollPhysics(),
          ),
          tabs: [
            TabBarItem("Params"),
            TabBarItem("Auth"),
            TabBarItem("Headers"),
            TabBarItem("Body"),
            // TabBarItem("Scripts"),
          ],
          views: [
            QueryParameterInput(),
            AuthInput(),
            HeaderInput(),
            BodyInput(),
            // Container(color: Colors.green),
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
