import 'package:flutter/material.dart';

class TagList extends StatefulWidget {
  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final tagLists = <String>["⭐All", "⚡New", "🕘Expiring Soon"];
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 40,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: selected == index
                            ? Theme.of(context).primaryColor.withOpacity(0.8)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected == index
                              ? Theme.of(context).primaryColor.withOpacity(0.2)
                              : Colors.white,
                        )),
                    child: Text(
                      tagLists[index],
                      style: TextStyle(
                        color: selected == index
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (_, index) => const SizedBox(
                  width: 15,
                ),
            itemCount: tagLists.length));
  }
}
