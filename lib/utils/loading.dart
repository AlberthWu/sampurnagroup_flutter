import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sgmobile/utils/text_style.dart';

class LoadingInformation extends StatelessWidget {
  const LoadingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Text("Loading...", style: TextStyles.bold18Red),
        ),
      ],
    );
  }
}
