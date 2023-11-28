import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poulstar_profile/caption.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poulstar_profile/profileprovider.dart';
import 'package:provider/provider.dart';

const Color backgroundColor = Color(0xff292929);
const Color textEditBackgroundColor = Color(0x0dffffff);
const Color appBarColor = Colors.black87;
const Color primaryTextColor = Color.fromARGB(200, 255, 255, 255);
const Color secondaryTextColor = Color(0xffFAF6F0);
const Color snackBarColor = Colors.teal;
const Color buttonColor = Colors.green;
const String imageBasePath = "assets/images/";
final List<String> languages = ["py", "scratch", "dart", "mysql", "js", "php"];
final List<String> frameWorks = [
  "bootstrap",
  "django",
  "flutter",
  "vue",
  "laravel"
];
//String languageSelected = languages[0];
//String frameworkSelected = frameWorks[0];

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<RedHeart>(
        create: (context) {
          return RedHeart();
        },
      ),
      ChangeNotifierProvider<ChangeTheme>(
        create: (context) {
          return ChangeTheme();
        },
      ),
      ChangeNotifierProvider<LanguageShadow>(
        create: (context) {
          return LanguageShadow();
        },
      ),
      ChangeNotifierProvider<FrameworkShadow>(
        create: (context) {
          return FrameworkShadow();
        },
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8))),
        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
            bodySmall: TextStyle(
              fontSize: 14,
              color: secondaryTextColor,
            ),
            titleSmall: TextStyle(
              fontSize: 14,
              color: secondaryTextColor,
            ),
            titleLarge: TextStyle(
                fontSize: 22,
                color: secondaryTextColor,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                fontSize: 16,
                color: primaryTextColor,
                fontWeight: FontWeight.bold))),
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(background: backgroundColor),
        // useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeTheme changeTheme = Provider.of<ChangeTheme>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8),
                //child: Icon(Icons.nightlight_round),
                child: Consumer<ChangeTheme>(
                  builder: (context, value, child) => InkWell(
                      onLongPress: () => changeTheme.changeIcon(),
                      child: Icon(changeTheme.iconData)),

                  //child: Icon(Icons.sunny)
                ),
              )
            ],
          )
        ],
        title: Text(
          appBarCaptionEn,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Introduction(),
              Divider(),
              ProgrammingLanguages(),
              Divider(),
              ProgrammingFrameWork(),
              CustomTextEdit(
                  title: emailTextEditEn, iconData: CupertinoIcons.at),
              CustomTextEdit(
                title: commentTextEditEn,
                iconData: CupertinoIcons.pencil_ellipsis_rectangle,
              ),
              CustomButton()
            ],
          ),
        ),
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final RedHeart redHeart = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                imageBasePath + "poulstar.png",
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profilePrimaryTitleEn,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    profileSecondaryTitleEn,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        locationEn,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8, top: 20, left: 32),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      redHeart.changeIcon();
                    },
                    child: Consumer<RedHeart>(
                      builder: (context, value, child) {
                        return Icon(
                          redHeart.iconData,
                          color: Colors.redAccent,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Text(
                  profileDescriptionEn,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.justify,
                  softWrap: true,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ProgrammingLanguages extends StatelessWidget {
  const ProgrammingLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    final languageShadows = Provider.of<LanguageShadow>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(children: [
            Text(
              languagesTitleEn,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Icon(Icons.keyboard_double_arrow_down)
          ]),
        ),
        Wrap(children: [
          _ProgrammingLanguagesItem(
            programmingLanguageTitle: "Python",
            imageProgrammingLanguagePath: imageBasePath + languages[0] + ".png",
            onTap: () {
              languageShadows.setShadow = languages[0];
              languageShadows.changeShadowLanguages();
            },
            shadowColor: Colors.blue,
            isSelected: languageShadows.getShadow == languages[0],
          ),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "Scratch",
              imageProgrammingLanguagePath:
                  imageBasePath + languages[1] + ".png",
              onTap: () {
                languageShadows.setShadow = languages[1];
                languageShadows.changeShadowLanguages();
              },
              shadowColor: Colors.orange,
              isSelected: languageShadows.getShadow == languages[1]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "Dart",
              imageProgrammingLanguagePath:
                  imageBasePath + languages[2] + ".png",
              onTap: () {
                languageShadows.setShadow = languages[2];
                languageShadows.changeShadowLanguages();
              },
              shadowColor: Colors.blue,
              isSelected: languageShadows.getShadow == languages[2]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "MySql",
              imageProgrammingLanguagePath:
                  imageBasePath + languages[3] + ".png",
              onTap: () {
                languageShadows.setShadow = languages[3];
                languageShadows.changeShadowLanguages();
              },
              shadowColor: Colors.blue,
              isSelected: languageShadows.getShadow == languages[3]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "JavaScript",
              imageProgrammingLanguagePath:
                  imageBasePath + languages[4] + ".png",
              onTap: () {
                languageShadows.setShadow = languages[4];
                languageShadows.changeShadowLanguages();
              },
              shadowColor: Colors.yellow,
              isSelected: languageShadows.getShadow == languages[4]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "PHP",
              imageProgrammingLanguagePath:
                  imageBasePath + languages[5] + ".png",
              onTap: () {
                languageShadows.setShadow = languages[5];
                languageShadows.changeShadowLanguages();
              },
              shadowColor: Colors.blueGrey,
              isSelected: languageShadows.getShadow == languages[5]),
        ]),
      ],
    );
  }
}

class ProgrammingFrameWork extends StatelessWidget {
  const ProgrammingFrameWork({super.key});

  @override
  Widget build(BuildContext context) {
    final frameworkShadows = Provider.of<FrameworkShadow>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(children: [
            Text(
              frameWorkTitleEn,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Icon(Icons.keyboard_double_arrow_down)
          ]),
        ),
        Wrap(children: [
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "Bootstrap",
              imageProgrammingLanguagePath:
                  imageBasePath + frameWorks[0] + ".png",
              onTap: () {
                frameworkShadows.setShadow = frameWorks[0];
                frameworkShadows.changeShadowFrameWorks();
              },
              shadowColor: Colors.deepPurpleAccent,
              isSelected: frameworkShadows.getShadow == frameWorks[0]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "Django",
              imageProgrammingLanguagePath:
                  imageBasePath + frameWorks[1] + ".png",
              onTap: () {
                frameworkShadows.setShadow = frameWorks[1];
                frameworkShadows.changeShadowFrameWorks();
              },
              shadowColor: Colors.greenAccent,
              isSelected: frameworkShadows.getShadow == frameWorks[1]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "Flutter",
              imageProgrammingLanguagePath:
                  imageBasePath + frameWorks[2] + ".png",
              onTap: () {
                frameworkShadows.setShadow = frameWorks[2];
                frameworkShadows.changeShadowFrameWorks();
              },
              shadowColor: Colors.lightBlue,
              isSelected: frameworkShadows.getShadow == frameWorks[2]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "Vue",
              imageProgrammingLanguagePath:
                  imageBasePath + frameWorks[3] + ".png",
              onTap: () {
                frameworkShadows.setShadow = frameWorks[3];
                frameworkShadows.changeShadowFrameWorks();
              },
              shadowColor: Colors.green,
              isSelected: frameworkShadows.getShadow == frameWorks[3]),
          _ProgrammingLanguagesItem(
              programmingLanguageTitle: "Laravel",
              imageProgrammingLanguagePath:
                  imageBasePath + frameWorks[4] + ".png",
              onTap: () {
                frameworkShadows.setShadow = frameWorks[4];
                frameworkShadows.changeShadowFrameWorks();
              },
              shadowColor: Colors.red,
              isSelected: frameworkShadows.getShadow == frameWorks[4]),
        ]),
      ],
    );
  }
}

class _ProgrammingLanguagesItem extends StatelessWidget {
  final String programmingLanguageTitle;
  final String imageProgrammingLanguagePath;
  final Color shadowColor;
  final bool isSelected;
  final Function() onTap;

  const _ProgrammingLanguagesItem(
      {super.key,
      required this.programmingLanguageTitle,
      required this.imageProgrammingLanguagePath,
      required this.onTap,
      required this.shadowColor,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<LanguageShadow>(builder: (context, value, child) {
              return Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: isSelected
                          ? shadowColor.withOpacity(0.4)
                          : shadowColor.withOpacity(0.0),
                      blurRadius: 50,
                      spreadRadius: 0.5)
                ]),
                child: Image.asset(
                  imageProgrammingLanguagePath,
                  width: 80,
                  height: 80,
                ),
              );
            }
                //child:,
                ),
            const SizedBox(
              height: 4,
            ),
            Text(
              programmingLanguageTitle,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextEdit extends StatelessWidget {
  final String title;
  final IconData iconData;

  const CustomTextEdit(
      {super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 64,
        decoration: BoxDecoration(
            color: textEditBackgroundColor,
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
          decoration:
              InputDecoration(labelText: title, prefixIcon: Icon(iconData)),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: InkWell(
        onTap: () {
          SnackBar snackBar = SnackBar(
              backgroundColor: snackBarColor,
              showCloseIcon: true,
              content: Center(
                  child: Text(
                snackbarEn,
                style: Theme.of(context).textTheme.titleLarge,
              )));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: buttonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              bottomTextEditEn,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
