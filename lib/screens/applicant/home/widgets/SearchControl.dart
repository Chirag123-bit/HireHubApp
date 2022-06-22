import 'package:flutter/material.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/theme/Theme.dart';

class SearchControl extends StatelessWidget {
  const SearchControl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 4,
      decoration: BoxDecoration(
        color: kSilverColor,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: kSpacingUnit * 2),
            const Icon(Icons.search, color: primaryClr),
            SizedBox(width: kSpacingUnit),
            Text(
              'Search job titles, companies',
              style: kBodyTextStyle.copyWith(
                color: kSecondaryTextColor,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.tune,
                color: primaryClr,
              ),
              onPressed: () {
                // Provider.of<MyBottomSheetModel>(context, listen: false)
                //     .changeState();
              },
            ),
            SizedBox(width: kSpacingUnit * 2),
          ],
        ),
      ),
    );
  }
}
