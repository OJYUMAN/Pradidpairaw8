import 'variable.dart';
import 'package:audioplayers/audioplayers.dart';

void simulator(int noteIndex) async {
  //play sound without editing
  final audioPlayer3 = AudioPlayer();
  if (intru == 2) {
    final aj = duoNotes[noteIndex];
    audioPlayer3.play(AssetSource("Sound/$selectedInstrument2/$aj"));
  } else {
    final aj = ekNotes[noteIndex];
    audioPlayer3.play(AssetSource("Sound/$selectedInstrument2/$aj"));
  }
}
