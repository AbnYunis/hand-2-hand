import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/utils/service_locator.dart';
import 'package:hand2hand/features/history/data/models/history_model.dart';
import 'package:hand2hand/features/history/data/repositories/history_repo_implement.dart';
import 'package:hand2hand/features/history/presentation/manegers/cancel_donation/cancel_donation_cubit.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.donationItem});

  final DonationItem donationItem;

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return BlocProvider(
      create: (context) => CancelDonationCubit(sl<HistoryRepoImplement>()),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h * .01),
        child: BlocBuilder<CancelDonationCubit, CancelDonationState>(
          builder: (context, state) {
            String status = donationItem.status;
            if (state is DonationCanceledSuccess) {
              status = 'canceled';
            }
            return InkWell(
              onTap: () => GoRouter.of(context).push(AppRouter.trackDonation,
                  extra: {'donationItem': donationItem, 'status': status}),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(w * .02),
                    decoration: ShapeDecoration(
                      color: const Color(0xff3093A8).withOpacity(.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * .015),
                        side: const BorderSide(
                          color: Color(0xff3093A8),
                        ),
                      ),
                    ),
                    height: h * .13,
                    child: Row(
                      children: [
                        Image.network(
                          donationItem.images[0].secureUrl,
                          height: h * .1,
                          width: w * .2,
                        ),
                        const SizedBoxApp(
                          w: .02,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'We care you',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Cate : ${donationItem.donationType}',
                                style: const TextStyle(color: Color(0xffB2B2B4)),
                              )
                            ],
                          ),
                        ),
                        const SizedBoxApp(
                          w: .02,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${donationItem.createdAt.day}-${donationItem.createdAt.month}-${donationItem.createdAt.year}',
                                style: const TextStyle(color: Color(0xffB2B2B4)),
                              ),
                              Text(
                                '${donationItem.createdAt.hour > 12 ? donationItem.createdAt.hour - 12 : donationItem.createdAt.hour}:${donationItem.createdAt.minute.toString().padLeft(2, '0')} ${donationItem.createdAt.hour >= 12 ? 'Pm' : 'Am'}',
                                style: const TextStyle(color: Color(0xffB2B2B4)),
                              ),
                              Container(
                                height: h * .03,
                                decoration: ShapeDecoration(
                                  color: status == 'pending'
                                      ? const Color(0xffEEA820)
                                      : status == 'canceled'
                                          ? Colors.red
                                          : Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(w * .1)),
                                ),
                                child: Center(
                                  child: Text(
                                    status,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  state is DonationCanceledLoading
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: CircularProgressIndicator(
                            color: mainColor1,
                          ),
                        )
                      : Positioned(
                          top: 0,
                          right: 0,
                          child: PopupMenuButton(itemBuilder: (context) {
                            return [
                              const PopupMenuItem<int>(
                                  value: 1, child: Text("cancel donation")),
                            ];
                          }, onSelected: (value) {
                            if (status!='canceled') {
                              BlocProvider.of<CancelDonationCubit>(context)
                                  .cancelDonation(donationItem.id);
                            }
                          }),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
