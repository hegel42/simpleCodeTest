import 'package:flutter/material.dart';
import 'package:simplecode_test1/constants/app_colors.dart';
import 'package:simplecode_test1/constants/app_fonts.dart';
import '../../generated/l10n.dart';
import '../../repo/api_controller.dart';
import '../models/products.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key, required this.articleID}) : super(key: key);
  final int articleID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).articleDetails,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<Products>(
        future: ApiControl.fetchArticleByID(articleID),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(snapshot.data!.image!),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppTextStyle.s24w500.copyWith(
                              color: AppColors.mainText,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data!.category!.toString(),
                                style: AppTextStyle.s16w600.copyWith(
                                  color: AppColors.secText,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    snapshot.data!.rating!.rate.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '(' +
                                        snapshot.data!.rating!.count
                                            .toString() +
                                        ' Reviews)',
                                    style: AppTextStyle.s16w600.copyWith(
                                      color: AppColors.secText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Description',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppTextStyle.mainTextStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            snapshot.data!.description!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 7,
                            style: AppTextStyle.s14w400
                                .copyWith(color: AppColors.secText),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ' + snapshot.data!.price!.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800),
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: AppColors.primary,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: Text(
                                  '+ Add To Cart',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: AppTextStyle.s16w400.copyWith(
                                    color: AppColors.designWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
