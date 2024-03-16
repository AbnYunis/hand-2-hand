import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/explore_charities/presentation/maneger/get_charities_cubit.dart';
import 'package:hand2hand/features/explore_charities/presentation/views/widgets/explore_charities_grid_view.dart';

class ExploreCharitiesBody extends StatelessWidget {
  const ExploreCharitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    TextEditingController controller = TextEditingController();
    return BlocConsumer<GetCharitiesCubit, GetCharitiesState>(
      listener: (context, state) {
        if (state is GetSearchCharitiesSuccess){
          if(controller.text.isEmpty){
            BlocProvider.of<GetCharitiesCubit>(context).getAllCharities();
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(w * .1),
          child: Column(
            children: [
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * .02)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    BlocProvider.of<GetCharitiesCubit>(context).searchCharities(value);
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Search ',
                    contentPadding: EdgeInsets.symmetric(horizontal: w * .03),
                    prefixIcon: Icon(
                      Icons.search,
                      size: w * .06,
                    ),
                    suffixIcon: Icon(
                      Icons.close,
                      size: w * .06,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(w * .04),
                    ),
                  ),
                ),
              ),
              const SizedBoxApp(
                h: .1,
              ),
              if (controller.text.isNotEmpty &&
                  state is GetSearchCharitiesSuccess) ...[
                ExploreCharitiesGridView(
                  charities: state.charities,
                )
              ],
              if (controller.text.isEmpty && state is GetCharitiesSuccess) ...[

                ExploreCharitiesGridView(
                  charities: state.charities,
                )
              ],
              if( state is GetCharitiesLoading|| state is GetSearchCharitiesLoading)...[
                Center(child: CircularProgressIndicator(),)
              ],
              if( state is GetCharitiesFailure|| state is GetSearchCharitiesFailure)...[
                Center(child: Text('failuer'),)
              ]
            ],
          ),
        );
      },
    );
  }
}
