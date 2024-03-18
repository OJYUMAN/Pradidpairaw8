import 'package:flutter/material.dart';


var keyboardwidth = 0.0;
var chan = "";
List<Widget> boxes = [];
var count = 0;
var MT = 250; //1000milisec/4
List<String> strings = [];
var myController = TextEditingController();
var elements = <String>{};
const List<Widget> vegetables = <Widget>[
  Icon(Icons.play_arrow_rounded),
  Icon(Icons.skip_previous_rounded),
];
//var labelarr = []; //ตัวแปรสําหรับเก็นโน้ตที่ไม่เกี่ยวกับวิตเจ็ต
var labelarr2 = [];

double ranadsize = 0;
bool showkeyboard = false;
double custFontSize = 13;
double notedistance = 2;
List<Widget> textarr = []; //labelarray in swift
bool isSwitched = false;
bool isSwitched2 = false;
final List<bool> _selectedVegetables = <bool>[false, false, false];
bool vertical = false;
List<Widget> textWidgetList = [];
List<Widget> tableElements = [];
List<Widget> pageElements = [];
bool JK = false;
bool showpp1 = false;
bool editin = false;
bool G = false,
    A = false,
    B = false,
    C1 = false,
    D1 = false,
    E1 = false,
    F1 = false,
    G1 = false,
    A0 = false,
    B0 = false,
    C = false,
    D = false,
    E = false,
    E0 = false,
    F = false,
    F0 = false,
    G0 = false,
    Down = false,
    Up = false,
    Delete = false;
String io = "";
var ma = 0; //เป็นค่าที่บอกว่าตอนนี้เหลืองอยู่หน้าไหน
var yy = 89.00;
var xx = 33.00;
var zz = 0.00;
var ppcount = 0.00; //ตําแหน่งของเหลือง
var table = 0;
int Tempo = 60;
bool play = false;
Stopwatch _stopwatch = Stopwatch();
//late Timer _timer;
Color ppcolor = Color.fromRGBO(255, 235, 59, 90);
Color cccolor = Colors.black;
Color cccolor2 = Colors.black;
var filePath = "";
var lebelsave = "";
var krosave = "";
var lebelsave2 = "";
var fakefile = "";
//var title = "";
//var instrument = "";
//var composer = "";
var page = 0;
var ppheight = 34.00;
var intru = 0;
int lastma = 0;
double scaleFactor = 1.0;
double boxsize = 20.0;
List<Widget> pages = [];
//var labelarr = [];
//var kroarr = [];
String selectedInstrument2 = 'Ranatek'; // รูปภาพเริ่มต้น
List<Widget> pagepaper = []; // List to store containers

var scale = 1.0;
double top = 0.0;
double left = 0.0;

final List<String> allNotes = [
  'E0.mp3',
  'F0.mp3',
  'G0.mp3',
  'A0.mp3',
  'B0.mp3',
  'C.mp3',
  'D.mp3',
  'E.mp3',
  'F.mp3',
  'Ghh.mp3',
  'A.mp3',
  'B.mp3',
  'C2.mp3',
  'D2.mp3',
  'E2.mp3',
  'F2.mp3',
  'G3.mp3',
  "Output 1-2.mp3",
];

final List<String> allNoteshro = [
  'E0.wav',
  'F0.wav',
  'G0k.wav',
  'A0k.wav',
  'B0k.wav',
  'Ck.wav',
  'Dk.wav',
  'Ek.wav',
  'Fk.wav',
  'Gk.wav',
  'Ak.wav',
  'Bk.wav',
  'C2k.wav',
  'D2k.wav',
  'E2k.wav',
  'F2k.wav',
  'G3k.wav',
  "",
];

final List<String> duoNotes = [
  'E0.wav',
  'F0.wav',
  'G0.wav',
  'A0.wav',
  'B0.wav',
  'C.wav',
  'D.wav',
  'E.wav',
  'F.wav',
  'G.wav',
  'A.wav',
  'B.wav',
  'C2.wav',
  'D2.wav',
  'E2.wav',
  'F2.wav',
  'G2.wav',
  "Output 1-2.wav",
];

final List<String> ekNotes = [
  'G0.mp3',
      'A0.mp3',
      'B0.mp3',
      'C.mp3',
      'D.mp3',
      'E.mp3',
      'F.mp3',
      'Ghh.mp3',
      'A.mp3',
      'B.mp3',
      'C2.mp3',
      'D2.mp3',
      'E2.mp3',
      'F2.mp3',
      'G3.mp3',
];


final List<String> piano = [
  'c3.mp3',
  'd3.mp3',
  'e3.mp3',
  'f3.mp3',
  'g3.mp3',
  'a3.mp3',
  'b3.mp3',
  'c4.mp3',
  'd4.mp3',
  'e4.mp3',
  'f4.mp3',
  'g4.mp3',
  'a4.mp3',
  'b4.mp3',
  'c4.mp3',


];


List<bool> isSelected = [true, false];

bool isYellow = true;

List<Color> buttonColors = List.generate(
    1000000,
        (index) =>
        Color.fromRGBO(255, 228, 103, 0.0));


final List<bool> selectedVegetables = <bool>[false, false];