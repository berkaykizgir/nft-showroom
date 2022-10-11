import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:nft_showroom/screens/nft_screen.dart';

class NFTListView extends StatefulWidget {
  const NFTListView({Key? key, required this.startIndex, this.duration = 30}) : super(key: key);
  final int startIndex;
  final int duration;

  @override
  State<NFTListView> createState() => _NFTListViewState();
}

class _NFTListViewState extends State<NFTListView> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  _autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final scrollEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(
      () {
        _scrollController.animateTo(currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
            duration: Duration(seconds: widget.duration), curve: Curves.linear);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * math.pi,
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NFTDisplay(nft: 'assets/nft/${widget.startIndex + index}.png'),
              )),
              child: Hero(
                  tag: 'assets/nft/${widget.startIndex + index}.png',
                  child: Image.asset(
                    'assets/nft/${widget.startIndex + index}.png',
                    width: 130,
                  )),
            );
          },
        ),
      ),
    );
  }
}
