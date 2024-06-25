import 'package:flutter/material.dart';
import 'package:weather/core/helper/app_size_config_helper.dart';

extension SizeExtensionBox on num {
  Widget get widthBox => SizedBox(width: SizeConfig.height*(this / 430),);

  Widget get heightBox => SizedBox(
    height: SizeConfig.height*(this / 932),
  );
}