import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => ListItemWidget(index: index),
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  final int index;

  const ListItemWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  late SharedPreferences _prefs;
  late String _countKey;
  int count = 0;

  @override
  void initState() {
    super.initState();
    _countKey = 'count_${widget.index}';
    _loadCount();
  }

  Future<void> _loadCount() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      count = _prefs.getInt(_countKey) ?? 0;
    });
  }

  Future<void> _saveCount() async {
    await _prefs.setInt(_countKey, count);
  }

  void _incrementCount() {
    setState(() {
      count++;
    });
    _saveCount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(count.toString()),
          MaterialButton(
            onPressed: _incrementCount,
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}
