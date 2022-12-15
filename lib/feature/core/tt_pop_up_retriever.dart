import 'dart:developer';

import 'package:clean_arch_template/feature/common/tt_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TTPopUpRetriever {
  static Future<void> showBottomSheet(
    BuildContext context, {
    required Widget content,
    required bool isDismissible,
    bool withHorizontalPadding = true,
    bool withHeader = true,
    bool enableDrag = false,
  }) async {
    final padding = withHorizontalPadding
        ? const EdgeInsets.all(8.0)
        : const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0);
    await showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      constraints: withHeader
          ? null
          : BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      barrierColor: const Color.fromRGBO(19, 9, 49, 0.24),
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: TTColors.bgVoilet,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      builder: (context) => SafeArea(
        child: Container(
          padding: withHeader ? padding : EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              withHeader
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 48.0,
                          height: 4.0,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(19, 9, 49, .08),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    )
                  : const SizedBox(),
              content,
            ],
          ),
        ),
      ),
    );
  }

  static Future<dynamic> showBottomSheetDropdown(
    BuildContext context, {
    required String title,
    required List<dynamic> items,
    List<String>? itemsNames,
  }) async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: const Color.fromRGBO(19, 9, 49, 0.24),
      context: context,
      builder: (context) {
        if (defaultTargetPlatform == TargetPlatform.android) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              decoration: const BoxDecoration(
                  color: TTColors.bgVoilet,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: TTColors.greyLight,
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Divider(
                        height: 1,
                        color: TTColors.greyIcons,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          log("Selected: ${items[index]}");
                          Navigator.pop(context, items[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            itemsNames != null
                                ? itemsNames[index]
                                : items[index].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    decoration: BoxDecoration(
                      color: TTColors.bgVoilet,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: TTColors.greyLight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Divider(
                            height: 1,
                            color: TTColors.greyIcons,
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          separatorBuilder: (_, __) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Divider(
                              height: 1,
                              color: TTColors.greyIcons,
                            ),
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Navigator.pop(context, items[index]),
                              child: Text(
                                itemsNames != null
                                    ? itemsNames[index]
                                    : items[index].toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 8),
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: TTColors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'support.contact_us.cancel'.tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
