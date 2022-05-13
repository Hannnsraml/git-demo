import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Risa Reborn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // APPBAR -----------------------------------------------------------
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              size: 28,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: const Icon(
                CupertinoIcons.square_arrow_right,
                size: 28,
              ),
              onPressed: () {}),
          const SizedBox(height: 10),
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        title: RichText(
          text: TextSpan(
              text: "Hi Peserta PMMB",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      // BODY ------------------------------------------------------------
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  DashboardGrid(),
                  Text('Ini Isi Carousel \nDashboard\nSpasi Sized box'),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('Ini Isi DashboardViewList')),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: Container(
                height: 15,
                decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: <Color>[
                    //     Pallete.background,
                    //     Pallete.background.withOpacity(0)
                    //   ],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                      Theme.of(context).scaffoldBackgroundColor
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(24)),
                  child: const Text.rich(TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        child: Icon(
                      CupertinoIcons.add,
                      size: 21,
                      color: Colors.white,
                    )),
                    TextSpan(
                        text: "Tambah Log",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500))
                  ])),
                ),
              )),
          Positioned(
            bottom: 50,
            right: 40,
            child: IconButton(
                icon: const Icon(CupertinoIcons.circle_grid_3x3_fill, size: 28),
                onPressed: () {}),
          ),
          Positioned(
            bottom: 50,
            left: 40,
            child: IconButton(
                icon: const Icon(
                  CupertinoIcons.square_arrow_down,
                  size: 28,
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}

class Dashboard {
  const Dashboard(this.title, this.icon,
      {this.color = Colors.blue, this.route = ""});
  final String title;
  final IconData icon;
  final Color color;
  final String route;
}

class DashboardGrid extends StatefulWidget {
  const DashboardGrid({Key? key}) : super(key: key);

  @override
  _DashboardGridState createState() => _DashboardGridState();
}

class DisableOverScrollGlow extends StatelessWidget {
  const DisableOverScrollGlow({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: child);
  }
}

class _DashboardGridState extends State<DashboardGrid> {
  final List<Dashboard> dashboardItems = Content.homeMenu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      height: 190,
      child: DisableOverScrollGlow(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dashboardItems.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, int i) => GestureDetector(
              onTap: () {
                print('Ini bisa di tap');
              },
              child: DashboardIcon(dashboardItems[i])),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 5,
          ),
        ),
      ),
    ));
  }
}

class DashboardIcon extends StatelessWidget {
  const DashboardIcon(this.dashboardItem);
  final Dashboard dashboardItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          splashColor: Colors.blue,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // 25
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: dashboardItem.color,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Colors.blue,
                      blurRadius: 0,
                      offset: Offset(0, 3),
                      spreadRadius: 2)
                ],
              ),
              child: Icon(
                dashboardItem.icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: Text(
            dashboardItem.title,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
      ],
    );
  }
}

class Content {
  static final List<Dashboard> homeMenu = <Dashboard>[
    const Dashboard("Dashboard", CupertinoIcons.chart_bar_circle),
    const Dashboard("Cctv", CupertinoIcons.camera),
    const Dashboard("Computer", CupertinoIcons.device_desktop),
    const Dashboard("Stock", CupertinoIcons.rectangle_on_rectangle_angled),
    const Dashboard("Improvement", CupertinoIcons.rocket),
    const Dashboard("Checklist", CupertinoIcons.chevron_down_square),
    const Dashboard("Check Virtual", CupertinoIcons.checkmark_seal),
    const Dashboard("Application", CupertinoIcons.square_stack_3d_up),
    const Dashboard("Altai", CupertinoIcons.wifi),
    const Dashboard("Handheld", CupertinoIcons.device_laptop),
    const Dashboard("UPS", CupertinoIcons.battery_25),
    const Dashboard("Printer", CupertinoIcons.printer),
    const Dashboard("Server", CupertinoIcons.keyboard_chevron_compact_down),
    const Dashboard("Gate", CupertinoIcons.building_2_fill),
    const Dashboard("Network", CupertinoIcons.link),
    const Dashboard("Fisik CCTV", CupertinoIcons.doc_checkmark),
    const Dashboard("Fisik Altai", CupertinoIcons.checkmark_rectangle),
    const Dashboard("Cfg Server", CupertinoIcons.greaterthan_circle_fill),
    const Dashboard("Other", CupertinoIcons.question_circle),
  ];
}
