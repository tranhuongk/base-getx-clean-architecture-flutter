import 'package:flutter/cupertino.dart';
import '../../generated/locales.g.dart';
import '../themes/c_text_styles.dart';
import 'c_text.dart';

class CNoDataView extends StatelessWidget {
  final String? message;

  const CNoDataView({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.search,
            size: 24,
          ),
          const SizedBox(
            height: 6,
          ),
          CText(
            message ?? LocaleKeys.network_error_fetch_data,
            style: CTextStyles.base.s14,
          ),
        ],
      ),
    );
  }
}
