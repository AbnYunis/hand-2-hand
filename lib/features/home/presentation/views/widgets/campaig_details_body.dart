import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';
import 'package:hand2hand/features/home/presentation/manager/fetch_posts_cubit.dart';
import 'package:hand2hand/features/home/presentation/manager/fetch_posts_state.dart';
import 'package:hand2hand/features/home/presentation/views/widgets/campaign_details_image.dart';
import 'package:latlong2/latlong.dart';

import 'campaign_details_row1.dart';
import 'description_widget.dart';

class CampaignDetailsBody extends StatelessWidget {
  const CampaignDetailsBody({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(w * .05),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * .04),
              topRight: Radius.circular(w * .04),
            ),
          ),
          child: BlocConsumer<FetchPostsCubit, FetchPostsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FetchOnePostsSuccess) {
                return Column(
                  children: [
                    CampaignDetailsImage(
                      image: state.onePostModel.post.image.secureUrl,
                    ),
                    Padding(
                      padding: EdgeInsets.all(w * .05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CampaignDetailsRow1(),
                          const SizedBoxApp(
                            h: .015,
                          ),
                          Text(
                            state.onePostModel.post.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: w * .043,
                            ),
                          ),
                          const SizedBoxApp(
                            h: .015,
                          ),
                          DescriptionWidget(
                            desc: state.onePostModel.post.desc,
                          ),
                          const SizedBoxApp(
                            h: .03,
                          ),
                          Text(
                            'Location:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: w * .03,
                            ),
                          ),
                          const SizedBoxApp(
                            h: .01,
                          ),
                          Text(
                            state.onePostModel.post.location,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: w * .03,
                                color: Colors.black.withOpacity(.65)),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 200,
                        child: FlutterMap(
                          options: const MapOptions(
                            initialCenter: LatLng(29.95375640, 31.53700030),
                            initialZoom: 11,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                    point: LatLng(29.95375640, 31.53700030),
                                    child: Image.asset(AssetsService.location))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBoxApp(
                      h: .01,
                    ),
                    CustomRoundedButton(
                        text: 'Volunteer',
                        onPressed: () {
                          GoRouter.of(context)
                              .push(AppRouter.volunteer, extra: id);
                        }),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
