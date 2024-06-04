
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///NestedScrollView 整体就是一个 CustomScrollView （实际上是 CustomScrollView 的一个子类）
/// header 和 body 都是 CustomScrollView 的子 Sliver ，注意，虽然 body 是一个 RenderBox，但是它会被包装为 Sliver 。
/// CustomScrollView 将其所有子 Sliver 在逻辑上分为 header 和 body 两部分：header 是前面部分、body 是后面部分。
/// 当 body 是一个可滚动组件时， 它和 CustomScrollView 分别有一个 Scrollable ，由于 body 在 CustomScrollView 的内部，所以称其为内部可滚动组件，称 CustomScrollView 为外部可滚动组件；同时 因为 header 部分是 Sliver，所以没有独立的 Scrollable，滑动时是受 CustomScrollView 的 Scrollable 控制，所以为了区分，可以称 header 为外部可滚动组件（Flutter 文档中是这么约定的）。
/// NestedScrollView 核心功能就是通过一个协调器来协调外部（outer）可滚动组件和内部（inner）可滚动组件的滚动，以使滑动效果连贯统一，协调器的实现原理就是分别给内外可滚动组件分别设置一个 controller，然后通过这两个controller 来协调控制它们的滚动。
class NestedScrollViewTest extends StatefulWidget{
  const NestedScrollViewTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _NestedScrollViewState();
  }

}
class _NestedScrollViewState extends State<NestedScrollViewTest> {
  late TabController _tabController;
  final _tabs = <String>['猜你喜欢', '今日特价', '发现更多', '发现更多啊'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //SliverToBoxAdapter
    return
    /*  Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // 返回一个 Sliver 数组给外部可滚动组件。
          return <Widget>[
            SliverAppBar(
              title: const Text('嵌套ListView'),
              pinned: true, // 固定在顶部
              forceElevated: innerBoxIsScrolled,
            ),
            const SliverToBoxAdapter(
              child:  SizedBox(
                width: 100,
                height:100,
                child: Center(child: Text("111")),
              ),
            ),
            const SliverToBoxAdapter(
              child:  SizedBox(
                width: 100,
                height:100,
                child: Center(child: Text("222")),
              ),
            ),
            const SliverToBoxAdapter(
              child:  SizedBox(
                width: 100,
                height:100,
                child: Center(child: Text("333")),
              ),
            )
            //  buildSliverList(5), //构建一个 sliverList
          ];
        },

        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const ClampingScrollPhysics(), //运行在 iOS 中时，ListView 如果没有设置为 ClampingScrollPhysics，则用户快速滑动到顶部时，会执行一个弹性效果
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text('Item $index')),
            );
          },
        ),
      ),*/
    /*  Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  floating: true,
                  snap: true,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/login/guide_page_one.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          body: Builder(builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
               // buildSliverList()
                const SliverToBoxAdapter(
                  child:  SizedBox(
                    width: 100,
                    height:100,
                    child: Center(child: Text("111")),
                  ),
                ),
                const SliverToBoxAdapter(
                  child:  SizedBox(
                    width: 100,
                    height:100,
                    child: Center(child: Text("222")),
                  ),
                ),
              ],
            );
          }),
        ),
      );*/
      DefaultTabController(
        length: _tabs.length, // tab的数量.
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: const Text('商城'),
                    floating: true,
                    snap: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      tabAlignment: TabAlignment.center,
                      tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: _tabs.map((String name) {
                return Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        const SliverPadding(
                          padding: EdgeInsets.all(8.0),
                       //   sliver: buildSliverList(50),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
  }
}

