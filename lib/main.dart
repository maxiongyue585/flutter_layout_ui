import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      localizationsDelegates: [
//        // ... app-specific localization delegate[s] here
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
//      ],
//      supportedLocales: [Locale('zh', 'CH'), Locale('en', 'US')],
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          child: new Text('Hello World'),
//        ),
//      ),
//    );
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = _TitleSection(
        'Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);
    final Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, 'CALL'),
          _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    final textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps.
        Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes.
        A gondola ride from Kandersteg,
        followed by a half-hour walk through pastures and pine forest,
        leads you to the lake, which warms to 20 degrees Celsius in the summer.
        Activities enjoyed here include rowing, and riding the summer toboggan run.
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps.
        Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes.
        A gondola ride from Kandersteg,
        followed by a half-hour walk through pastures and pine forest,
        leads you to the lake, which warms to 20 degrees Celsius in the summer.
        Activities enjoyed here include rowing, and riding the summer tobog
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter UI basic 1',
      home: Scaffold(
          appBar: AppBar(
            title: Text('布局demo'),
          ),
          // 我们的内容可能会超出屏幕的长度，这里把内容都放到 ListView 里。
          // 除了这种用法，ListView 也可以像我们在 Android 原生开发中使用 ListView 那样，
          // 根据数据动态生成一个个 item。这个我们在下一节再来学习
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/horse.jpg',
                height: 240.0,
                // cover 类似于 Android 开发中的 centerCrop，其他一些类型，读者可以查看
                // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )),
    );
  }
}

class _TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int startCount;

  const _TitleSection(this.title, this.subtitle, this.startCount);

  @override
  Widget build(BuildContext context) {
    // 为了给 title section 加上 padding，这里我们给内容套一个 Container
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          //这里为了让标题占满屏幕宽度的剩余空间，用 Expanded 把标题包了起来
          Expanded(
              // 再次提醒读者，Expanded 只能包含一个子元素，使用的参数名是 child。接下来，
              // 为了在竖直方向放两个标题，加入一个 Column。
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 聪明的你，这个时候肯定知道为什么突然加入一个 Container 了。
                  // 跟前面一样，只是为了设置一个 padding
                  Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              )
          ),
          //这里是 Row 的第二个子元素，下面这两个就没用太多值得说的东西了。
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(startCount.toString()),
        ],
      ),
    );
  }
}

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
    // free space；类似于 Android 的 wrap_content。
    // 对应的，还有 MainAxisSize.max
    mainAxisSize: MainAxisSize.min,
    // 沿着 main axis 居中放置
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}
