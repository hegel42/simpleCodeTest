import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplecode_test1/bloc/persons/bloc_persons.dart';

import '../../../generated/l10n.dart';

class FilterBars extends StatefulWidget {
  const FilterBars({Key? key}) : super(key: key);

  @override
  State<FilterBars> createState() => _FilterBarsState();
}

class _FilterBarsState extends State<FilterBars> {
  final List<String> filterCategory = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];
  final List<Rating> filterRating = [
    Rating(0, 'All'),
    Rating(2, 'Raiting: 2'),
    Rating(3, 'Raiting: 3'),
    Rating(4, 'Raiting: 4'),
    Rating(5, 'Raiting: 5'),

    // 'Raiting: all',
    // 'Raiting: 2',
    // 'Raiting: 3',
    // 'Raiting: 4',
    // 'Raiting: 5',
  ];

  String? valueCategory;
  Rating? valueRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: DropdownButton2(
              alignment: AlignmentDirectional.center,
              selectedItemHighlightColor: Colors.greenAccent,
              itemHeight: kMinInteractiveDimension,
              // isExpanded: true,
              hint: Row(
                children: [
                  const Icon(
                    Icons.category,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    S.of(context).categories,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              items: filterCategory
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  .toList(),
              value: valueCategory,
              onChanged: (value) {
                setState(
                  () {
                    valueCategory = value as String;
                  },
                );

                BlocProvider.of<BlocProducts>(context).add(
                  EventProductsCategory(valueCategory),
                );
              },
            ),
          ),
          Expanded(
            child: DropdownButton2(
              alignment: AlignmentDirectional.center,
              selectedItemHighlightColor: Colors.greenAccent,
              itemHeight: kMinInteractiveDimension,
              hint: Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    S.of(context).rating,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              items: filterRating
                  .map(
                    (item) => DropdownMenuItem<Rating>(
                      value: item,
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  .toList(),
              value: valueRating,
              onChanged: (value) {
                setState(
                  () {
                    valueRating = value as Rating;
                  },
                );
                BlocProvider.of<BlocProducts>(context)
                    .add(EventProductsRating(valueRating?.rating ?? 0));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Rating {
  num rating;
  String title;
  Rating(this.rating, this.title);
}
