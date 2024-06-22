import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/home/presentation/manager/fetch_posts_cubit.dart';
import 'package:hand2hand/features/home/presentation/manager/fetch_posts_state.dart';
import 'package:hand2hand/features/home/presentation/views/widgets/favourite_widget.dart';

import 'custom_texts_widget.dart';
import 'recommended_widget.dart';
import 'search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .01),
      physics: const BouncingScrollPhysics(),
      children: [
        /// The texts hello
        const CustomTextsWidget(),

        /// search text field

        const SearchTextField(),
        SizedBox(height: h * .015),

        /// The favourite list
        const Text(
          'See all charities',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: h * .015),
        const DonateWidget(),
        SizedBox(height: h * .015),

        /// Recommendation text
        Padding(
          padding: EdgeInsets.only(left: w * .05),
          child: Text(
            'Recommend for you',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .04),
          ),
        ),

        /// The recommendation list items
        SizedBox(
          height: 400,
          child: BlocConsumer<FetchPostsCubit, FetchPostsState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              if(state is FetchPostsSuccess){
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.postModel.posts!.length,
                  itemBuilder: (context, index) {
                    return RecommendedWidget(
                        index,postModel: state.postModel,); // Add 1 to start index from 1
                  },
                );
              }else if(state is FetchPostsFailure){
                print(state.message);
                return Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.red.withOpacity(0.3),
                  child: IconButton(onPressed: (){BlocProvider.of<FetchPostsCubit>(context).fetchPosts();}, icon: Column(
                    children: [
                      Icon(Icons.error_outline_sharp),
                      Text('try again')
                    ],
                  )),
                );
              }else{
                return SizedBox(height:400,child: Center(child: CircularProgressIndicator()));
              }

            },
          ),
        ),
      ],
    );
  }
}
