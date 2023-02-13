import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TextPad());
}

class TextPad extends StatelessWidget {
  const TextPad({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Pad',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const Notebooks(title: 'title'),
    );
  }
}

class Notebooks extends StatefulWidget {
  const Notebooks({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Notebooks> createState() => _NotebooksState();
}

String handleKeyboard(KeyEvent event) {
  var retString = "";
  // Maybe see https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/services/keyboard_maps.g.dart
  List keyTable = [
    [LogicalKeyboardKey.keyA, "A"],
    [LogicalKeyboardKey.keyB, "B"],
    [LogicalKeyboardKey.keyC, "C"],
    [LogicalKeyboardKey.keyD, "D"],
    [LogicalKeyboardKey.keyE, "E"],
    [LogicalKeyboardKey.keyF, "F"],
    [LogicalKeyboardKey.keyG, "G"],
    [LogicalKeyboardKey.keyH, "H"],
    [LogicalKeyboardKey.keyI, "I"],
    [LogicalKeyboardKey.keyJ, "J"],
    [LogicalKeyboardKey.keyK, "K"],
    [LogicalKeyboardKey.keyL, "L"],
    [LogicalKeyboardKey.keyM, "M"],
    [LogicalKeyboardKey.keyN, "N"],
    [LogicalKeyboardKey.keyO, "O"],
    [LogicalKeyboardKey.keyP, "P"],
    [LogicalKeyboardKey.keyQ, "Q"],
    [LogicalKeyboardKey.keyR, "R"],
    [LogicalKeyboardKey.keyS, "S"],
    [LogicalKeyboardKey.keyT, "T"],
    [LogicalKeyboardKey.keyU, "U"],
    [LogicalKeyboardKey.keyV, "V"],
    [LogicalKeyboardKey.keyW, "W"],
    [LogicalKeyboardKey.keyX, "X"],
    [LogicalKeyboardKey.keyY, "Y"],
    [LogicalKeyboardKey.keyZ, "Z"],
    [LogicalKeyboardKey.f1, "F1"],
    [LogicalKeyboardKey.f2, "F2"],
    [LogicalKeyboardKey.f3, "F3"],
    [LogicalKeyboardKey.f4, "F4"],
    [LogicalKeyboardKey.f5, "F5"],
    [LogicalKeyboardKey.f6, "F6"],
    [LogicalKeyboardKey.f7, "F7"],
    [LogicalKeyboardKey.f8, "F8"],
    [LogicalKeyboardKey.f9, "F9"],
    [LogicalKeyboardKey.f10, "F10"],
    [LogicalKeyboardKey.f11, "F11"],
    [LogicalKeyboardKey.f12, "F12"],
    [LogicalKeyboardKey.f13, "F13"],
    [LogicalKeyboardKey.f14, "F14"],
    [LogicalKeyboardKey.f15, "F15"],
    [LogicalKeyboardKey.f16, "F16"],
    [LogicalKeyboardKey.f17, "F17"],
    [LogicalKeyboardKey.f18, "F18"],
    [LogicalKeyboardKey.f19, "F19"],
    [LogicalKeyboardKey.f20, "F20"],
    [LogicalKeyboardKey.f21, "F21"],
    [LogicalKeyboardKey.f22, "F22"],
    [LogicalKeyboardKey.f23, "F23"],
    [LogicalKeyboardKey.f24, "F24"],
    [LogicalKeyboardKey.goHome, "goHome"],
    [LogicalKeyboardKey.goBack, "goBack"],
    [LogicalKeyboardKey.call, "call"],
    [LogicalKeyboardKey.endCall, "endCall"],
    [LogicalKeyboardKey.digit0, "0"],
    [LogicalKeyboardKey.digit1, "1"],
    [LogicalKeyboardKey.digit2, "2"],
    [LogicalKeyboardKey.digit3, "3"],
    [LogicalKeyboardKey.digit4, "4"],
    [LogicalKeyboardKey.digit5, "5"],
    [LogicalKeyboardKey.digit6, "6"],
    [LogicalKeyboardKey.digit7, "7"],
    [LogicalKeyboardKey.digit8, "8"],
    [LogicalKeyboardKey.digit9, "9"],
    [LogicalKeyboardKey.asterisk, "*"],
    [LogicalKeyboardKey.numberSign, "numberSign"],
    [LogicalKeyboardKey.arrowUp, "↑"],
    [LogicalKeyboardKey.arrowDown, "↓"],
    [LogicalKeyboardKey.arrowLeft, "←"],
    [LogicalKeyboardKey.arrowRight, "→"],
    [LogicalKeyboardKey.select, "select"],
    [LogicalKeyboardKey.audioVolumeUp, "AudioVolUp"],
    [LogicalKeyboardKey.audioVolumeDown, "AudioVolDown"],
    [LogicalKeyboardKey.power, "Power"],
    [LogicalKeyboardKey.camera, "Camera"],
    [LogicalKeyboardKey.clear, "Clear"],
    [LogicalKeyboardKey.comma, ","],
    [LogicalKeyboardKey.period, "."],
    [LogicalKeyboardKey.altLeft, "altLeft"],
    [LogicalKeyboardKey.altRight, "altRight"],
    [LogicalKeyboardKey.shiftLeft, "shiftLeft"],
    [LogicalKeyboardKey.shiftRight, "shiftRight"],
    [LogicalKeyboardKey.tab, "TAB"],
    [LogicalKeyboardKey.space, "Space"],
    [LogicalKeyboardKey.symbol, "Symbol"],
    [LogicalKeyboardKey.launchWebBrowser, "WebBrowser"],
    [LogicalKeyboardKey.launchMail, "Mail"],
    [LogicalKeyboardKey.enter, "Enter"],
    [LogicalKeyboardKey.backspace, "Backspace"],
    [LogicalKeyboardKey.backquote, "`"],
    [LogicalKeyboardKey.minus, "-"],
    [LogicalKeyboardKey.equal, "="],
    [LogicalKeyboardKey.bracketLeft, "("],
    [LogicalKeyboardKey.bracketRight, ")"],
    [LogicalKeyboardKey.backslash, "\\"],
    [LogicalKeyboardKey.semicolon, ";"],
    [LogicalKeyboardKey.quote, "\""],
    [LogicalKeyboardKey.slash, "/"],
    [LogicalKeyboardKey.at, "@"],
    [LogicalKeyboardKey.headsetHook, "headsetHook"],
    [LogicalKeyboardKey.cameraFocus, "cameraFocus"],
    [LogicalKeyboardKey.add, "+"],
    [LogicalKeyboardKey.contextMenu, "contextMenu"],
    [LogicalKeyboardKey.notification, "notification"],
    [LogicalKeyboardKey.browserSearch, "browserSearch"],
    [LogicalKeyboardKey.mediaPlayPause, "mediaPlayPause"],
    [LogicalKeyboardKey.mediaStop, "mediaStop"],
    [LogicalKeyboardKey.mediaTrackNext, "mediaTrackNext"],
    [LogicalKeyboardKey.mediaTrackPrevious, "mediaTrackPrevious"],
    [LogicalKeyboardKey.mediaRewind, "mediaRewind"],
    [LogicalKeyboardKey.mediaFastForward, "mediaFastForward"],
    [LogicalKeyboardKey.microphoneVolumeMute, "microphoneVolumeMute"],
    [LogicalKeyboardKey.pageUp, "pageUp"],
    [LogicalKeyboardKey.pageDown, "pageDown"],
    [LogicalKeyboardKey.modeChange, "modeChange"],
    [LogicalKeyboardKey.gameButtonA, "gameButtonA"],
    [LogicalKeyboardKey.gameButtonB, "gameButtonB"],
    [LogicalKeyboardKey.gameButtonC, "gameButtonC"],
    [LogicalKeyboardKey.gameButtonX, "gameButtonX"],
    [LogicalKeyboardKey.gameButtonY, "gameButtonY"],
    [LogicalKeyboardKey.gameButtonZ, "gameButtonZ"],
    [LogicalKeyboardKey.gameButtonLeft1, "gameButtonLeft1"],
    [LogicalKeyboardKey.gameButtonRight1, "gameButtonRight1"],
    [LogicalKeyboardKey.gameButtonLeft2, "gameButtonLeft2"],
    [LogicalKeyboardKey.gameButtonRight2, "gameButtonRight2"],
    [LogicalKeyboardKey.gameButtonThumbLeft, "gameButtonThumbLeft"],
    [LogicalKeyboardKey.gameButtonThumbRight, "gameButtonThumbRight"],
    [LogicalKeyboardKey.gameButtonStart, "gameButtonStart"],
    [LogicalKeyboardKey.gameButtonSelect, "gameButtonSelect"],
    [LogicalKeyboardKey.gameButtonMode, "gameButtonMode"],
    [LogicalKeyboardKey.escape, "escape"],
    [LogicalKeyboardKey.delete, "delete"],
    [LogicalKeyboardKey.controlLeft, "controlLeft"],
    [LogicalKeyboardKey.controlRight, "controlRight"],
    [LogicalKeyboardKey.capsLock, "capsLock"],
    [LogicalKeyboardKey.scrollLock, "scrollLock"],
    [LogicalKeyboardKey.metaLeft, "metaLeft"],
    [LogicalKeyboardKey.metaRight, "metaRight"],
    [LogicalKeyboardKey.fn, "fn"],
    [LogicalKeyboardKey.printScreen, "printScreen"],
    [LogicalKeyboardKey.pause, "pause"],
    [LogicalKeyboardKey.home, "home"],
    [LogicalKeyboardKey.end, "end"],
    [LogicalKeyboardKey.insert, "insert"],
    [LogicalKeyboardKey.browserForward, "browserForward"],
    [LogicalKeyboardKey.mediaPlay, "mediaPlay"],
    [LogicalKeyboardKey.mediaPause, "mediaPause"],
    [LogicalKeyboardKey.close, "close"],
    [LogicalKeyboardKey.eject, "eject"],
    [LogicalKeyboardKey.mediaRecord, "mediaRecord"],
    [LogicalKeyboardKey.numLock, "numLock"],
    [LogicalKeyboardKey.numpad0, "numpad0"],
    [LogicalKeyboardKey.numpad1, "numpad1"],
    [LogicalKeyboardKey.numpad2, "numpad2"],
    [LogicalKeyboardKey.numpad3, "numpad3"],
    [LogicalKeyboardKey.numpad4, "numpad4"],
    [LogicalKeyboardKey.numpad5, "numpad5"],
    [LogicalKeyboardKey.numpad6, "numpad6"],
    [LogicalKeyboardKey.numpad7, "numpad7"],
    [LogicalKeyboardKey.numpad8, "numpad8"],
    [LogicalKeyboardKey.numpad9, "numpad9"],
    [LogicalKeyboardKey.numpadDivide, "numpadDivide"],
    [LogicalKeyboardKey.numpadMultiply, "numpadMultiply"],
    [LogicalKeyboardKey.numpadSubtract, "numpadSubtract"],
    [LogicalKeyboardKey.numpadAdd, "numpadAdd"],
    [LogicalKeyboardKey.numpadDecimal, "numpadDecimal"],
    [LogicalKeyboardKey.numpadComma, "numpadComma"],
    [LogicalKeyboardKey.numpadEnter, "numpadEnter"],
    [LogicalKeyboardKey.numpadEqual, "numpadEqual"],
    [LogicalKeyboardKey.numpadParenLeft, "numpadParenLeft"],
    [LogicalKeyboardKey.numpadParenRight, "numpadParenRight"],
    [LogicalKeyboardKey.audioVolumeMute, "audioVolumeMute"],
    [LogicalKeyboardKey.info, "info"],
    [LogicalKeyboardKey.channelUp, "channelUp"],
    [LogicalKeyboardKey.channelDown, "channelDown"],
    [LogicalKeyboardKey.zoomIn, "zoomIn"],
    [LogicalKeyboardKey.zoomOut, "zoomOut"],
    [LogicalKeyboardKey.tv, "tv"],
    [LogicalKeyboardKey.guide, "guide"],
    [LogicalKeyboardKey.dvr, "dvr"],
    [LogicalKeyboardKey.browserFavorites, "browserFavorites"],
    [LogicalKeyboardKey.closedCaptionToggle, "closedCaptionToggle"],
    [LogicalKeyboardKey.settings, "settings"],
    [LogicalKeyboardKey.tvPower, "tvPower"],
    [LogicalKeyboardKey.tvInput, "tvInput"],
    [LogicalKeyboardKey.stbPower, "stbPower"],
    [LogicalKeyboardKey.stbInput, "stbInput"],
    [LogicalKeyboardKey.avrPower, "avrPower"],
    [LogicalKeyboardKey.avrInput, "avrInput"],
    [LogicalKeyboardKey.colorF0Red, "colorF0Red"],
    [LogicalKeyboardKey.colorF1Green, "colorF1Green"],
    [LogicalKeyboardKey.colorF2Yellow, "colorF2Yellow"],
    [LogicalKeyboardKey.colorF3Blue, "colorF3Blue"],
    [LogicalKeyboardKey.appSwitch, "appSwitch"],
    [LogicalKeyboardKey.gameButton1, "gameButton1"],
    [LogicalKeyboardKey.gameButton2, "gameButton2"],
    [LogicalKeyboardKey.gameButton3, "gameButton3"],
    [LogicalKeyboardKey.gameButton4, "gameButton4"],
    [LogicalKeyboardKey.gameButton5, "gameButton5"],
    [LogicalKeyboardKey.gameButton6, "gameButton6"],
    [LogicalKeyboardKey.gameButton7, "gameButton7"],
    [LogicalKeyboardKey.gameButton8, "gameButton8"],
    [LogicalKeyboardKey.gameButton9, "gameButton9"],
    [LogicalKeyboardKey.gameButton10, "gameButton10"],
    [LogicalKeyboardKey.gameButton11, "gameButton11"],
    [LogicalKeyboardKey.gameButton12, "gameButton12"],
    [LogicalKeyboardKey.gameButton13, "gameButton13"],
    [LogicalKeyboardKey.gameButton14, "gameButton14"],
    [LogicalKeyboardKey.gameButton15, "gameButton15"],
    [LogicalKeyboardKey.gameButton16, "gameButton16"],
    [LogicalKeyboardKey.groupNext, "groupNext"],
    [LogicalKeyboardKey.mannerMode, "mannerMode"],
    [LogicalKeyboardKey.tv3DMode, "tv3DMode"],
    [LogicalKeyboardKey.launchContacts, "launchContacts"],
    [LogicalKeyboardKey.launchCalendar, "launchCalendar"],
    [LogicalKeyboardKey.launchMusicPlayer, "launchMusicPlayer"],
    [LogicalKeyboardKey.zenkakuHankaku, "zenkakuHankaku"],
    [LogicalKeyboardKey.eisu, "eisu"],
    [LogicalKeyboardKey.nonConvert, "nonConvert"],
    [LogicalKeyboardKey.convert, "convert"],
    [LogicalKeyboardKey.hiraganaKatakana, "hiraganaKatakana"],
    [LogicalKeyboardKey.intlYen, "intlYen"],
    [LogicalKeyboardKey.intlRo, "intlRo"],
    [LogicalKeyboardKey.kanjiMode, "kanjiMode"],
    [LogicalKeyboardKey.launchAssistant, "launchAssistant"],
    [LogicalKeyboardKey.brightnessDown, "brightnessDown"],
    [LogicalKeyboardKey.brightnessUp, "brightnessUp"],
    [LogicalKeyboardKey.mediaAudioTrack, "mediaAudioTrack"],
    [LogicalKeyboardKey.sleep, "sleep"],
    [LogicalKeyboardKey.wakeUp, "wakeUp"],
    [LogicalKeyboardKey.pairing, "pairing"],
    [LogicalKeyboardKey.mediaTopMenu, "mediaTopMenu"],
    [LogicalKeyboardKey.mediaLast, "mediaLast"],
    [LogicalKeyboardKey.tvDataService, "tvDataService"],
    [LogicalKeyboardKey.tvRadioService, "tvRadioService"],
    [LogicalKeyboardKey.teletext, "teletext"],
    [LogicalKeyboardKey.tvNumberEntry, "tvNumberEntry"],
    [LogicalKeyboardKey.tvTerrestrialAnalog, "tvTerrestrialAnalog"],
    [LogicalKeyboardKey.tvTerrestrialDigital, "tvTerrestrialDigital"],
    [LogicalKeyboardKey.tvSatellite, "tvSatellite"],
    [LogicalKeyboardKey.tvSatelliteBS, "tvSatelliteBS"],
    [LogicalKeyboardKey.tvSatelliteCS, "tvSatelliteCS"],
    [LogicalKeyboardKey.tvSatelliteToggle, "tvSatelliteToggle"],
    [LogicalKeyboardKey.tvNetwork, "tvNetwork"],
    [LogicalKeyboardKey.tvAntennaCable, "tvAntennaCable"],
    [LogicalKeyboardKey.tvInputHDMI1, "tvInputHDMI1"],
    [LogicalKeyboardKey.tvInputHDMI2, "tvInputHDMI2"],
    [LogicalKeyboardKey.tvInputHDMI3, "tvInputHDMI3"],
    [LogicalKeyboardKey.tvInputHDMI4, "tvInputHDMI4"],
    [LogicalKeyboardKey.tvInputComposite1, "tvInputComposite1"],
    [LogicalKeyboardKey.tvInputComposite2, "tvInputComposite2"],
    [LogicalKeyboardKey.tvInputComponent1, "tvInputComponent1"],
    [LogicalKeyboardKey.tvInputComponent2, "tvInputComponent2"],
    [LogicalKeyboardKey.tvInputVGA1, "tvInputVGA1"],
    [LogicalKeyboardKey.tvAudioDescription, "tvAudioDescription"],
    [LogicalKeyboardKey.tvAudioDescriptionMixUp, "tvAudioDescriptionMixUp"],
    [LogicalKeyboardKey.tvAudioDescriptionMixDown, "tvAudioDescriptionMixDown"],
    [LogicalKeyboardKey.zoomToggle, "zoomToggle"],
    [LogicalKeyboardKey.tvContentsMenu, "tvContentsMenu"],
    [LogicalKeyboardKey.tvTimer, "tvTimer"],
    [LogicalKeyboardKey.help, "help"],
    [LogicalKeyboardKey.navigatePrevious, "navigatePrevious"],
    [LogicalKeyboardKey.navigateNext, "navigateNext"],
    [LogicalKeyboardKey.navigateIn, "navigateIn"],
    [LogicalKeyboardKey.navigateOut, "navigateOut"],
    [LogicalKeyboardKey.mediaSkipForward, "mediaSkipForward"],
    [LogicalKeyboardKey.mediaSkipBackward, "mediaSkipBackward"],
    [LogicalKeyboardKey.mediaStepForward, "mediaStepForward"],
    [LogicalKeyboardKey.mediaStepBackward, "mediaStepBackward"],
    [LogicalKeyboardKey.cut, "cut"],
    [LogicalKeyboardKey.copy, "copy"],
    [LogicalKeyboardKey.paste, "paste"],
  ];

  for (var i in keyTable) {
    var evType = "";
    if (event is KeyDownEvent) {
      evType = "KeyDown";
    } else if (event is KeyRepeatEvent) {
      evType = "KeyRepeat";
    } else if (event is KeyUpEvent) {
      evType = "KeyUp";
    }

    if (event.logicalKey == i[0]) {
      retString = evType + "_" + i[1];
      break;
    }
  }

  return retString;
}

class _NotebooksState extends State<Notebooks> {
  String _current = '';
  var _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Focus(
            autofocus: true,
            onKeyEvent: (node, event) {
              var retString = handleKeyboard(event);
              if (retString == "") {
                return KeyEventResult.ignored;
              } else {
                setState(() {
                  _text += '[' + retString + ']';
                });
                return KeyEventResult.handled;
              }
            },
            child: Column(
              children: <Widget>[
                TextField(
                  controller: TextEditingController(text: _current),
                  maxLines: 20,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (text) {
                    _current = text;
                  },
                ),
                Text(_text),
              ],
            )),
      ),
    );
  }
}
