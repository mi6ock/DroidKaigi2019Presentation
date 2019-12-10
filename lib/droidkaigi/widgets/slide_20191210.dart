import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/base_slide_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/center_statement_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/code_syntax_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/data_serialization_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/fetch_data_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/file_picker_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/intro_slide.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/keyboard_listener_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/set_menubar_widget.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/table_20191210.dart';
import 'package:flutter_desktop_example/droidkaigi/widgets/text_input_widget.dart';
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
              'Desktopアプリ',
              'クロスプラットフォーム',
              'C/C++呼び出し',
              'ローカルファイルのやり取り',
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
              'Github Star 81k(Desktop : 6k)',
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
              CenterStatementWidget('悔しいのでFlutter Desktopについて話します!'),
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
            CodeSyntaxWidget(title: 'ツールのアンロック', lang: Syntax.DART, code: '''
flutter channel master (macOSならdevでも可能)
flutter config --enable-linux-desktop to enable Linux.
flutter config --enable-macos-desktop to enable macOS.
flutter config —enable-windows-desktop
        '''),
          ],
        )),
        BaseSlideWidget(
            mainContentWidget: CodeSyntaxWidget(
                title: 'ターゲットプラットフォームのオーバーライド', lang: Syntax.DART, code: '''
void _setTargetPlatformForDesktop() {
  if (Platform.isLinux || Platform.isWindows) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  _setTargetPlatformForDesktop();
  runApp(MyApp());
}
        ''')),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '魅力',
            subtitleElements: const [
              'Flutterの美しいMaterialなUIが使える',
              'Hot Reloadによる迅速な開発が可能',
              'Packageなら使える(API改修などで使えないことも)'
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'Plugins',
            subtitleElements: const [
              '対応しているPluginsが少ない?拡張できます',
              'WindowsはC++とvsxprojを使用',
              'macOSはSwiftおよびObjective-c(m,h)とcocoapodを使用',
              'LinuxはC++とMakeを使用',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: CodeSyntaxWidget(
              title: 'ディスクトップ向けプラグインの拡張', lang: Syntax.DART, code: '''
dependencies:
...
  url_launcher: ^5.0.0
  url_launcher_fde:
    path: relative/path/to/fde/plugins/flutter_plugins/url_launcher_fde
'''),
        ),
        BaseSlideWidget(
            mainContentWidget: CodeSyntaxWidget(
                title: 'ディスクトップ向けプラグインの拡張', lang: Syntax.DART, code: '''
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
''')),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'Desktopに必要そうな機能について紹介します',
            subtitleElements: const [
              '検証はMacのみ',
              '主にflutter-desktop-embeddingのリポジトリを見て書いてます',
              'リポジトリ: https://github.com/google/flutter-desktop-embedding)',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'キーボード入力',
            subtitleElements: const [
              'RawKeyEventDataで生のキー入力取得できます',
              'TextFieldで文字入力取得できます',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: KeyboardListenerWidget(),
        ),
        BaseSlideWidget(
          mainContentWidget: TextInputWidget(),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'メニューバー',
            subtitleElements: const [
              'Flutter-desktop-embeddingのリポジトリにあるmenubarでできます',
              '※macOSとLinuxのみ',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: SetMenubarWidget(),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'データ永続化',
            subtitleElements: const [
              'SharedPreferences ※macOSのみ',
              'sembast(100%Dartで書かれたドキュメント指向のデータベース,IndexedDBとかnedbに似ている)',
              'sembast: https://pub.dev/packages/sembast',
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: DataSerializationWidget(),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'ネットワーク接続',
            subtitleElements: const [
              'dioでお試し',
              'dio: https://pub.dev/packages/dio',
              'json placeholder: https://jsonplaceholder.typicode.com/'
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: CodeSyntaxWidget(
              lang: Syntax.DART, title: 'macOS向けセキュリティ設定 - ネットワーク', code: '''
<--! fileName DebugProfile.entitlements -->
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'>
<plist version='1.0'>
<dict>
    ......
    <key>com.apple.security.network.server</key>
    <true/>
+   <key>com.apple.security.network.client</key>
+   <true/>
</dict>
</plist>
          '''),
        ),
        BaseSlideWidget(
          mainContentWidget: FetchDataWidget(),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'ファイル選択',
            subtitleElements: const [
              'Flutter-destop-embeddingのリポジトリにあるfile_chooserでできます',
              'WindowsとmacOSのみ'
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: CodeSyntaxWidget(
              lang: Syntax.DART, title: 'macOS向けセキュリティ設定 - ファイル', code: '''
<--! fileName DebugProfile.entitlements -->
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'>
<plist version='1.0'>
<dict>
    .......
    <key>com.apple.security.network.client</key>
    <true/>
+  <key>com.apple.security.files.user-selected.read-write</key>
+  <true/>
</dict>
</plist>
          '''),
        ),
        BaseSlideWidget(
          mainContentWidget: FilePickerWidget(),
        ),
//        BaseSlideWidget(
//          mainContentWidget: TitleSubtitleWidget(
//            titleText: '画面の情報取得',
//            subtitleElements: const [
//              'Flutter-desktop-embeddingのリポジトリにあるwindow_sizeでできます',
//              'macOSとLinuxのみ'
//            ],
//          ),
//        ),
//        BaseSlideWidget(
//          mainContentWidget: ScreenUtilWidget(),
//        ),
        BaseSlideWidget(
          mainContentWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'その他GoogleチームがDesktop向けに提供しているプラグイン',
                style: smallTitleStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              Plugins(),
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: 'まとめ',
            subtitleElements: const [
              'macOSはAPIが安定しているため実際に動かしても安定していた(開発中クラッシュ0)',
              'WindowsはGLFW→Win32→(UWP)、LinuxはGLFW→(GTK+?)に変更予定でプラグインの実装が無きものに可能性がある',
              '(感想)macOS向けなら使っても良いかなと思いました'
            ],
          ),
        ),
        BaseSlideWidget(
          mainContentWidget: TitleSubtitleWidget(
            titleText: '参考',
            subtitleElements: const [
              'https://github.com/google/flutter-desktop-embedding/blob/master/macOS-Security.md',
              'https://github.com/flutter/flutter/wiki/Desktop-shells',
              'https://github.com/salihgueler/DroidKaigi2019Presentation',
              'https://medium.com/flutter-community/flutter-on-desktop-a-real-competitor-to-electron-4f049ea6b061'
            ],
          ),
        ),
      ],
    );
  }
}
