import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:olearis_test/presentation/home/widgets/item_widget.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Markup Test',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: controller.removeItem,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: controller.addItem,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isHorizontal =
                    constraints.maxWidth > constraints.maxHeight;
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.all(30),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/logo.svg',
                              width: 375,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 14),
                            height: ((controller.items.length + 1) ~/ 2) *
                                (isHorizontal ? 100 : 59),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                              ),
                              itemCount: controller.items.length,
                              itemBuilder: (context, index) => ItemWidget(
                                  text: '${controller.items[index]} $index'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
