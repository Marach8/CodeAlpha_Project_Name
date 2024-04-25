import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/user/user_controller.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/widgets/custom_widgets/shimmer.dart';

class CustomDynamicProfileMenuRow extends StatelessWidget {
  final Widget child;
  
  const CustomDynamicProfileMenuRow({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Obx(
      () => Visibility(
        visible: userController.userModel.value != UserModel.empty(),
        replacement: const CustomShimmerWidget(),
        child: child
      ),
    );
  }
}