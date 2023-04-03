import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazir'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _getAppbar(),
        body: SafeArea(
          child: _getMainBody(),
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppbar() {
    return AppBar(
      centerTitle: true,
      elevation: 15,
      backgroundColor: Colors.purple[800],
      title: Text(
        'عرفان ایزدی',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _getMainBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          _getHeader(),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return Column(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          backgroundImage: AssetImage('images/user.png'),
          radius: 60,
        ),
        SizedBox(height: 15),
        Text(
          'عرفانم یه برنامه نویس و دانشجوی کامپیوتر',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 12),
        Text(':)عاشق برنامه نویسی ام و مجذوب دنیای بی پایان کامپیوتر',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        Text('علاقه مند به برنامه نویسی موبایل، اندروید و فلاتر',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        Text('برای یادگیری ،انگیزه زیادی دارم ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              'و بر این باورم که برای دنیای کامپیوتر انتهایی وجود نداره',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          height: 12,
        ),
        _getRowIcons(),
        SizedBox(height: 12),
        _getSkillCards(),
        SizedBox(height: 12),
        _getResume()
      ],
    );
  }

  Widget _getSkillCards() {
    var images = ['Android', 'Dart', 'Flutter', 'Java', 'Python'];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 4,
      runSpacing: 15,
      children: [
        for (var image in images)
          Card(
            elevation: 6,
            shadowColor: Colors.purple[700],
            child: Column(
              children: [
                Container(
                  height: 80.0,
                  child: Image(
                    image: AssetImage('images/$image.png'),
                    width: 60.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$image'),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _getResume() {
    var resume = [
      'دانشجوی مقطع کارشناسی رشته مهندسی کامپیوتر دانشگاه آزاد واحد اصفهان از سال 1400 ',
      'دانشجوی دوره  Expert Flutter '
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(
            'سابقه کاری من',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: double.infinity, height: 20),
              for (var s in resume)
                Text(
                  '$s',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
            ],
          )
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    launchUrlString('$url');
  }

  Widget _getRowIcons() {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 0.5,
              shadowColor: Colors.blueGrey[700],
              child: IconButton(
                onPressed: () {
                  _launchURL(
                      'https://api.whatsapp.com/send?phone=+989369848759');
                },
                icon: FaIcon(FontAwesomeIcons.squareWhatsapp,
                    color: Colors.blueGrey[700]),
              ),
            ),
            Card(
              elevation: 0.5,
              shadowColor: Colors.blueGrey[700],
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.squareInstagram),
                  color: Colors.blueGrey[700]),
            ),
            Card(
              elevation: 0.5,
              shadowColor: Colors.blueGrey[700],
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.linkedin),
                  color: Colors.blueGrey[700]),
            ),
            Card(
              elevation: 0.5,
              shadowColor: Colors.blueGrey[700],
              child: IconButton(
                  onPressed: () {
                    _launchURL('https://t.me/erfaniz_flutter');
                  },
                  icon: FaIcon(FontAwesomeIcons.telegram),
                  color: Colors.blueGrey[700]),
            ),
            Card(
              elevation: 0.5,
              shadowColor: Colors.blueGrey[700],
              child: IconButton(
                  onPressed: () {
                    _launchURL('https://github.com/ErfanIzadi');
                  },
                  icon: FaIcon(FontAwesomeIcons.squareGithub),
                  color: Colors.blueGrey[700]),
            ),
          ],
        ),
      ],
    );
  }
}
