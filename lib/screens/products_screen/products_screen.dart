import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simplecode_test1/bloc/persons/bloc_persons.dart';
import 'package:simplecode_test1/constants/app_assets.dart';

import 'package:simplecode_test1/screens/products_screen/widgets/filter_bars.dart';
import 'package:simplecode_test1/widgets/bottom_nav_bar.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../generated/l10n.dart';

import '../articl_screen/article_screen.dart';

import 'widgets/sort_bar.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  // static final isListView = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
        appBar: AppBar(
          title: Text(S.of(context).products),
        ),
        // bottomNavigationBar: const BottomNavBar(
        //   selectedIndex: 0,
        // ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SortBar(),
            const FilterBars(),
            Flexible(
              child: BlocBuilder<BlocProducts, StateBlocProducts>(
                builder: (context, state) {
                  if (state is StateProductsLoading) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  if (state is StateProductsError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(state.error),
                        ),
                      ],
                    );
                  }

                  if (state is StateProductsData) {
                    if (state.data.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.images.charNotFound),
                          Flexible(
                            child: Text(S.of(context).characterListIsEmpty),
                          ),
                        ],
                      );
                    } else {
                      // Future<ResultRepoProducts> fetchProducts(
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ArticleScreen(
                                      articleID: state.data[index].id!,
                                    ),
                                  ),
                                );
                              }),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                state.data[index].image!),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    state.data[index].title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: AppColors.mainText,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$' +
                                            state.data[index].price.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellowAccent,
                                            size: 25,
                                          ),
                                          Text(
                                            state.data[index].rating!.rate
                                                .toString(),
                                            style: AppTextStyle.s16w600,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
