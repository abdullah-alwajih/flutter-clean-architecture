part of '../movies.dart';

Widget buildSectionTile(
  BuildContext context, {
  required String text,
  Function()? onTap,
}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.seeMore),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
