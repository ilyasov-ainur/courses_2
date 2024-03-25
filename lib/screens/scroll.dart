import 'package:flutter/material.dart';

enum _ScrollContent {
  singleChildScrollView,
  listView,
  listViewBuilder,
  listViewSeparated,
  customScrollView,
}

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  _ScrollContent content = _ScrollContent.singleChildScrollView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (final type in _ScrollContent.values) ...[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          content = type;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: content == type ? Colors.blueAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          type.name,
                        ),
                      )),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: switch (content) {
              _ScrollContent.singleChildScrollView => const _SingleChildScrollView(),
              _ScrollContent.listView => const _ListView(),
              _ScrollContent.listViewBuilder => const _ListViewBuilder(),
              _ScrollContent.listViewSeparated => const _ListViewSeparated(),
              _ScrollContent.customScrollView => const _CustomScrollView(),
            },
          )
        ],
      ),
    );
  }
}

class _SingleChildScrollView extends StatefulWidget {
  const _SingleChildScrollView();

  @override
  State<_SingleChildScrollView> createState() => __SingleChildScrollViewState();
}

class __SingleChildScrollViewState extends State<_SingleChildScrollView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 500,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.cyanAccent,
          ),
          Container(
            height: 500,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.redAccent,
          ),
          Container(
            height: 500,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

class _ListView extends StatefulWidget {
  const _ListView();

  @override
  State<_ListView> createState() => __ListViewState();
}

class __ListViewState extends State<_ListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          color: Colors.cyanAccent,
        ),
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.redAccent,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellowAccent,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.greenAccent,
            ),
          ],
        ),
      ],
    );
  }
}

class _ListViewBuilder extends StatefulWidget {
  const _ListViewBuilder();

  @override
  State<_ListViewBuilder> createState() => __ListViewBuilderState();
}

class __ListViewBuilderState extends State<_ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: index.isEven ? Colors.cyanAccent : Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text('Index $index'),
        );
      },
    );
  }
}

class _ListViewSeparated extends StatefulWidget {
  const _ListViewSeparated();

  @override
  State<_ListViewSeparated> createState() => __ListViewSeparatedState();
}

class __ListViewSeparatedState extends State<_ListViewSeparated> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) =>
          index.isEven ? const SizedBox(height: 8) : const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: index.isEven ? Colors.cyanAccent : Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text('Index $index'),
        );
      },
    );
  }
}

class _CustomScrollView extends StatefulWidget {
  const _CustomScrollView({super.key});

  @override
  State<_CustomScrollView> createState() => __CustomScrollViewState();
}

class __CustomScrollViewState extends State<_CustomScrollView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('SliverAppBar'),
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: FlutterLogo(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.cyanAccent : Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text('Index $index'),
              );
            },
            childCount: 5,
          ),
        ),
        const SliverPadding(padding: EdgeInsets.all(16)),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color: index.isEven ? Colors.cyanAccent : Colors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text('Index $index'),
            );
          },
          itemCount: 10,
        ),
      ],
    );
  }
}
