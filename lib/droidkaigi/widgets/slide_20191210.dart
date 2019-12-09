import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/base_slide_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/center_statement_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/code_syntax_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/intro_slide.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/table_20191210.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/title_subtitle_widget.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class Slide20191210 extends StatelessWidget {
  const Slide20191210();

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        const BaseSlideWidget(
          mainContentWidget: IntroSlide(),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '自己紹介',
            subtitleElements: const [
              '@mi6ock',
              'Flutter歴6ヶ月',
              'PST株式会社',
              'コーヒー/ゴルフ/スノボ/ボルダリング',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: Image.asset('assets/images/20191210_1.png'),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '要件',
            subtitleElements: const [
              'クロスプラットフォーム',
              'C/C++呼び出し可能',
              'ファイルのやり取りが可能か',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '技術選定',
            subtitleElements: const [
              'Electron',
              'Flutter',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'Electron',
            subtitleElements: const [
              'ChromiumとNode.jsをベースにしたクロスプラットフォーム開発環境',
              'Webリソースの再利用が可能',
              'SlackやVS Codeに採用されている',
              'Github Star 79k',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'Flutter',
            subtitleElements: const [
              'Flutterの利点をそのまま使える',
              'Github Star 81k(Desktop : 6k)'
                  '開発フェーズはアルファより前(Super Alpha)',
              'WindowsやLinuxは将来大きなアーキテクチャの変更が入る',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: CenterStatementWidget('Electronを選んでしまう'),
        ),
        BaseSlideWidget(
          mainContentWidget:
              CenterStatementWidget('悔しいのでFlutter Desktopについて話すよ!'),
        ),
        BaseSlideWidget(
          mainContentWidget: SizedBox(
            width: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Api(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '- 開発途上なので警告なく変更加えるよ',
                  style: smallTitleStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '- macOSは比較的APIが安定しているけど'
                  'WindowsとLinuxのAPIは最終的にはかなりの変更が加えられるよ',
                  style: smallTitleStyle,
                )
              ],
            ),
          ),
        ),
        BaseSlideWidget(
            mainContentWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CodeSyntaxWidget(title: "ツールのアンロック", lang: Syntax.DART, code: """
flutter channel master (macOSならdevでも可能)
flutter config --enable-linux-desktop to enable Linux.
flutter config --enable-macos-desktop to enable macOS.
flutter config —enable-windows-desktop
        """),
          ],
        )),
        BaseSlideWidget(
            mainContentWidget: CodeSyntaxWidget(
                title: "ターゲットプラットフォームのオーバーライド", lang: Syntax.DART, code: """
void _setTargetPlatformForDesktop() {
  if (Platform.isLinux || Platform.isWindows) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  _setTargetPlatformForDesktop();
  runApp(MyApp());
}
        """)),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '魅力①',
            subtitleElements: const [
              'Flutterの美しいMaterialなUI、Hot Reloadによる迅速な開発が可能'
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '魅力②',
            subtitleElements: const [
              'C/C++の呼び出しができる',
              'Windows, LinuxはC API',
              'WindowsとLinuxのPluginsではC++が使われているので呼び出しが容易'
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '魅力③',
            subtitleElements: const ['対応しているPluginsが少ない?拡張できます'],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: CodeSyntaxWidget(
              title: "ディスクトップ向けプラグインの拡張", lang: Syntax.DART, code: """
dependencies:
...
url_launcher: ^5.0.0
url_launcher_fde:
  path: relative/path/to/fde/plugins/flutter_plugins/url_launcher_fde
"""),
        ),
        BaseSlideWidget(
            mainContentWidget: CodeSyntaxWidget(
                title: "ディスクトップ向けプラグインの拡張", lang: Syntax.DART, code: """
    ├── url_launcher
│   ├── CHANGELOG.md
│   ├── LICENSE
│   ├── README.md
│   ├── android
│   ├── example
│   ├── ios
│   ├── lib
│   ├── pubspec.yaml
│   └── test
└── url_launcher_fde
    ├── LICENSE
    ├── ios
    ├── linux
    ├── macos
    ├── pubspec.yaml
    └── windows
""")),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '使えそうなPlugins',
            subtitleElements: const ['対応しているPluginsが少ない?拡張できます'],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: Center(child: Plugins()),
        )
      ],
    );
  }
}
