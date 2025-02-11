import 'package:get/get.dart';
import 'package:moyamoya/feature/point/get/point_get_screen.dart';

const pointGetRoute = "/pointget";

GetPage<PointGetScreen> pointGetScreen() => GetPage(
      name: pointGetRoute,
      page: () => PointGetScreen(),
    );

void navigateToPointGetScreen() => Get.toNamed(pointGetRoute);
