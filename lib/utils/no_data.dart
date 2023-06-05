import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sgmobile/utils/text_style.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(120.0),
      child: Text('No data available', style: TextStyles.bold18Red),
    );
  }
}
