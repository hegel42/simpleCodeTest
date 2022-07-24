import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/persons/bloc_persons.dart';
import '../../../generated/l10n.dart';

class SortBar extends StatefulWidget {
  const SortBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SortBar> createState() => _SortBarState();
}

final List<String> sortItems = [
  'asc',
  'desc',
];

String? ascValue;

class _SortBarState extends State<SortBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton2(
        buttonWidth: double.infinity,
        alignment: AlignmentDirectional.center,
        selectedItemHighlightColor: Colors.greenAccent,
        itemHeight: kMinInteractiveDimension,
        hint: Row(
          children: [
            const Icon(
              Icons.sort_outlined,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              S.of(context).sortProducts,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        items: sortItems
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
        value: ascValue,
        onChanged: (value) {
          setState(
            () {
              ascValue = value as String?;
            },
          );
          BlocProvider.of<BlocProducts>(context).add(
            EventProductsSort(ascValue!),
          );
        },
      ),
    );
  }
}
