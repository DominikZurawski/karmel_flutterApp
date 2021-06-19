library karmel_app.globals;

import 'page_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:karmel_app/audio.dart';

DateTime? focusedDay; // = DateTime.now();
DateTime? selectedDay;
PageManager? pageManager;
YoutubePlayerController? controller;
TextEditingController? idController;
TextEditingController? seekToController;

PlayerState? playerState;
YoutubeMetaData? videoMetaData;

double volume = 100;
bool muted = false;
bool isPlayerReady = false;

String videoUrl = 'https://www.youtube.com/watch?v=62utj_XTcS4';
List<String> ids = [
  '62utj_XTcS4',
  //'6jZDSSZZxjQ',
  //'p2lYr3vM_1w',
  //'7QUtEmBT_-w',
  //'34_PXCzGw1M',
  //'62utj_XTcS4',
];

String silverbarImage = 'assets/Wadi-es-Siah.jpg';
String kolatkaImage = 'https://i.gifer.com/2qOa.gif';

String kolatkaSentence =
    'Temu kto ma Boga,\n' + 'nie brakuje niczego.\n' + 'Jedyny Bóg wystarcza.';
String codziennikUriAudio =
    'https://www.karmel.pl/wp-content/uploads/2021/03/audio_rekolekcje_wielki_post_2021_przemysl_1.mp3';
String codziennikText = "\nZnam dobrze źródło co tryska i płynie, \n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "Wiem gdzie swe wody ma ten zdrój kryniczny,\n" +
    "Ukryty w głębi tajemnic i wieczny,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "Początku jego nie znam, bo go nie ma,\n" +
    "Lecz wiem, że każdy byt swą mocą trzyma,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "Wiem, że nie może być nic piękniejszego,\n" +
    "Że wszelka piękność pochodzi od Niego,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "Wiem, że w Nim nie ma nic z ziemskich istności,\n" +
    "Że nic nie zrówna Jego wszechmocności,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "Blask jego światła nigdy nie zachodzi,\n" +
    "Bo wszelka światłość od Niego pochodzi,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "A tryskające z niego życia wody\n" +
    "Zraszają otchłań, niebiosa, narody,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "Potok istności w tym źródle wezbrany\n" +
    "W potędze swojej jest niepowstrzymany,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "To wieczne źródło znalazło ukrycie,\n" +
    "W Chlebie Żywota, aby dać nam życie,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "A potok, który od tych dwóch pochodzi,\n" +
    "Żadnej istnością swoją nie przechodzi,\n" +
    "Choć się dobywa wśród nocy.\n" +
    "\n" +
    "I stąd podnosi głos, wzywa stworzenia,\n" +
    "By się syciły w zdrojach Utajenia,\n" +
    "Co się spełniły wśród nocy.\n" +
    " \n" +
    "To jest to źródło, którego pożądam,\n" +
    "To jest Chleb Życia, który tu oglądam,\n" +
    "Choć się dobywa wśród nocy.\n" +
    " \n" +
    " (Znam dobrze źródło, czyli śpiew duszy cieszącej się poznaniem Boga przez wiarę, św. Jan od Krzyża) \n";

String studniaText = "\n  " +
    "Z Twojej tu jestem przyczyny:\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Boże, mądrości przedwieczna –\n" +
    "nieprzewyższony Majestat,\n" +
    "dla duszy łasko łask pełna,\n" +
    "Bóg, możny, On, w łaskawości –\n" +
    "schyl się ku wielkiej małości,\n" +
    "gdy woła słowy czułymi:\n" +
    "Co pragniesz ze mną uczynić?Twojam, Ty stworzyć mnie chciałeś,\n" +
    "Twoja, Ty mnie odkupiłeś,\n" +
    "Twoja, znosiłeś cierpliwie,\n" +
    "Twoja, bo mnie powołałeś,\n" +
    "Twoja, wszak na mnie czekałeś\n" +
    "i drogi mnie nie zmyliły –\n" +
    "Co pragniesz ze mną uczynić?Cóż, miłosierny nasz Panie,\n" +
    "czynić ma sługa niegodny?\n" +
    "Jakie ów grzeszny niewolnik\n" +
    "ma powierzone zadanie?\n" +
    "Oto, Najmilszy mój, masz mnie,\n" +
    "oto przed sobą mnie widzisz:\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "Pragnę Ci dać całą siebie,\n" +
    "serce Twym dłoniom poruczę,\n" +
    "ciało me, życie i duszę,\n" +
    "każde uczucie, pragnienie,\n" +
    "Miły mój, me odkupienie;\n" +
    "więc jako swoją mnie przyjmij.\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "Życie – lub śmierci daj dopust,\n" +
    "zdrowie lub niedomaganie,\n" +
    "w sławie daj żyć lub niesławie,\n" +
    "wojnę mi daj albo pokój,\n" +
    "słabość lub hart – sam wyrokuj –\n" +
    "zgodnam z sądami Twoimi.\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Moc albo też poniżenie,\n" +
    "męstwo mi daj lub przelękłość,\n" +
    "radość lub niepocieszenie,\n" +
    "niebo daj – albo daj piekło,\n" +
    "chłód albo słońca zapiekłość\n" +
    "Twojam, siłami wszystkimi.\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Chcesz – mogę być rozmodlona,\n" +
    "lub mogę nieczuła stać się,\n" +
    "cna i ku Tobie skłoniona,\n" +
    "a jeśli nie – oschła raczej.\n" +
    "Najwyższy w swym Majestacie,\n" +
    "to tylko pokój mi czyni:\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "W miłości swojej daj zatem\n" +
    "światło – lub w ciemność je zamień;\n" +
    "chędogie daj bytowanie\n" +
    "albo daj głód, niedostatek,\n" +
    "jasność – lub mrok ponad światem,\n" +
    "szlakiem wiedź tym albo innym –\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Z miłości czynu zaniechać?\n" +
    "Zaniecham, jeśli rozkażesz.\n" +
    "Jeśli pracować mam wszakże,\n" +
    "to w trudzie moja pociecha:\n" +
    "gdzie?, kiedy?, jak? – niech nie czekam!\n" +
    "Rzeknij mi słowo, Jedyny –\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Daj mi Kalwarię lub Tabor,\n" +
    "raj lub pustynię jałową,\n" +
    "daj Hiobem być – poznać słabość,\n" +
    "Janem – na piersi Twej głową;\n" +
    "bujny w winnicy dać owoc\n" +
    "albo też schnąć – jak zamyślisz.\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Jak Józef skuty w kajdany\n" +
    "albo w Egipcie gospodarz,\n" +
    "Dawid boleśnie skarany\n" +
    "czy Dawid – władca i mocarz,\n" +
    "Jonasz, gdy tonąć ma w wodach,\n" +
    "lub zratowany z głębiny.\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Milczeć lub odkryć się w słowach,\n" +
    "mniej dawać plonu lub więcej,\n" +
    "w prawie oglądać swą nędzę\n" +
    "lub Ewangelii kosztować,\n" +
    "cierpieć lub kwitnąć gotowam –\n" +
    "byleś Ty trwał we mnie żywy.\n" +
    "Co pragniesz ze mną uczynić?\n" +
    "\n" +
    "Z Twojej tu jestem przyczyny:\n" +
    "Co pragniesz ze mną uczynić?" +
    "\n   ";

String studniaImage = 'assets/Teresa.jpg';
