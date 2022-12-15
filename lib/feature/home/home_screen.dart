// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tez_taxi/core/injection/configurator.dart';
// import 'package:tez_taxi/feature/alert_dialog_contents/payment_error_content/payment_error_content.dart';
// import 'package:tez_taxi/feature/alert_dialog_contents/ttl_exceeded_pusher_event/ttl_exceeded_pusher_event_content.dart';
// import 'package:tez_taxi/feature/core/tt_alert_dialog.dart';
// import 'package:tez_taxi/feature/home/widgets/home_order_back_button.dart';

// import '../common/tt_drawer/tt_drawer.dart';
// import '../common/tt_map/tt_map.dart';
// import '../enum/order_steps.dart';
// import '../global/global_order/global_order_bloc.dart';
// import '../utils/navigable.dart';
// import '../utils/routes.dart';
// import 'widgets/home_bottom_sheet.dart';

// class HomeScreen extends StatefulWidget implements Navigable {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();

//   @override
//   String getName() {
//     return Routes.home;
//   }
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _key = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GlobalOrderBloc, GlobalOrderState>(
//       listener: (context, state) async {
//         if (state is GlobalOrderFailure) {
//           //TODO: implement banner from figma
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//         } else if (state is GlobalOrderLoaded) {
//           if (state.currentStep == OrderSteps.pusherTtlExceeded) {
//             TTAlertDialog.showTTAlertDialog(
//                 context: context,
//                 content: const TtlExceededPusherEventContent());
//           } else if (state.currentStep ==
//               OrderSteps.pusherPaymentWithCardFailed) {
//             TTAlertDialog.showTTAlertDialog(
//               context: context,
//               content: PaymentErrorDialogContent(
//                 cardHashName: state.message ?? '',
//               ),
//             ).then((isChangePaymentMethodClicked) {
//               if (isChangePaymentMethodClicked ?? false) {
//                 Navigator.pushNamed(context, Routes.paymentCards);
//               }

//               //TODO нужно обсудить этот момент
//               getIt<GlobalOrderBloc>().add(
//                 GlobalOrderForEmitOrderStepEvent(
//                   globalOrderLoaded: GlobalOrderLoaded(
//                     currentOrderEntity: getIt<GlobalOrderBloc>().currentOrder,
//                     currentStep: OrderSteps.serviceSelection,
//                   ),
//                 ),
//               );
//             });
//           }
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           key: _key,
//           drawer: const TTDrawer(),
//           body: Stack(
//             children: [
//               TTMap(
//                 isMainMap: true,
//                 scaffoldKey: _key,
//                 showCurrentAddressPin: state is GlobalOrderLoaded &&
//                     (state.currentStep == OrderSteps.serviceSelection ||
//                         state.currentStep == OrderSteps.selectOnMapFrom ||
//                         state.currentStep == OrderSteps.selectOnMapTo ||
//                         state.currentStep == OrderSteps.selectOnMapMyAddress),
//                 showCurrentAddress: state is GlobalOrderLoaded &&
//                     (state.currentStep == OrderSteps.serviceSelection ||
//                         state.currentStep == OrderSteps.selectOnMapFrom ||
//                         state.currentStep == OrderSteps.selectOnMapTo ||
//                         state.currentStep == OrderSteps.selectOnMapMyAddress),
//               ),
//             ],
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.miniStartDocked,
//           floatingActionButton: HomeOrderBackButton(state: state),
//           bottomSheet: const HomeBottomSheetWidget(),
//         );
//       },
//     );
//   }
// }
