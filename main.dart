import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MemorieApp());

const bg = Color(0xFFFFF8F1);
const brown = Color(0xFF805044);
const pink = Color(0xFFF078B2);
const purple = Color(0xFFB9A5E8);
const green = Color(0xFF9EDDB4);

class MemorieApp extends StatelessWidget {
  const MemorieApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Memoriê',
    theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: pink),
      appBarTheme: const AppBarTheme(backgroundColor: bg, foregroundColor: brown, centerTitle: true)),
    home: const HomeScreen(),
  );
}

class GameTheme {
  final String title, description;
  final List<String> symbols;
  const GameTheme(this.title, this.description, this.symbols);
}

const _animals = ['🐱','🐶','🐼','🦊','🐸','🐵','🐰','🐻','🐨','🐹','🐯','🐷','🐮','🐭','🐔','🐧','🐤','🦉','🦋','🐢'];
const _food = ['🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🫐','🍒','🍑','🥭','🍍','🥥','🥝','🍈','🍏','🍅','🫒','🍋'];
const _sweets = ['🍰','🎂','🧁','🍩','🍪','🍫','🍬','🍭','🍮','🍯','🍡','🍦','🍧','🍨','🥧','🍿','🍘','🍥','🧇','🥮'];
const _objects = ['📱','☎️','💻','⌨️','🖱️','🖨️','📷','📺','📻','🔋','🔦','💡','🕯️','🧯','🔑','🔒','🪞','🧴','🧸','🪑'];
const _nature = ['🌸','🌼','🌻','🌹','🌷','🪻','🌺','🪷','💐','🌱','🌿','☘️','🍀','🌵','🌴','🌳','🌲','🪴','🍁','🍄'];
const _space = ['🌍','🌎','🌏','🌕','🌖','🌗','🌘','🌑','🌒','🌓','🌔','🌙','⭐','🌟','🪐','☄️','🚀','🛸','👽','🌌'];
const _vehicles = ['🚗','🚕','🚙','🚌','🚎','🏎️','🚓','🚑','🚒','🚐','🚚','🚛','🚜','🏍️','🛵','🚲','🛴','🚂','🚃','🚆'];
const _hearts = ['❤️','🩷','🧡','💛','💚','💙','🩵','💜','🤎','🖤','🤍','💖','💗','💓','💞','💕','💘','💝','💟','❣️'];
const _sports = ['⚽','🏀','🏈','⚾','🥎','🎾','🏐','🏉','🥏','🎱','🏓','🏸','🏒','🏑','🥍','🏏','⛳','🥊','🥋','🎿'];
const _travel = ['🧳','🎒','🗺️','🧭','🛂','🎫','🎟️','🏖️','🏝️','🏕️','⛺','🏨','🚆','✈️','🚢','📸','🌞','🩴','🕶️','🧴'];

const themes = <GameTheme>[
  GameTheme('Animais fofinhos','Encontre os animais fofinhos!',_animals),
  GameTheme('Animais da fazenda','Encontre os animais da fazenda!',_animals),
  GameTheme('Animais selvagens','Encontre os animais selvagens!',_animals),
  GameTheme('Animais marinhos','Encontre as criaturas marinhas!',_animals),
  GameTheme('Aves e borboletas','Encontre as aves e borboletas!',_nature),
  GameTheme('Frutas coloridas','Encontre as frutas!',_food),
  GameTheme('Doces e sobremesas','Encontre os doces e sobremesas!',_sweets),
  GameTheme('Comidas gostosas','Encontre as comidas!',_food),
  GameTheme('Bebidas','Encontre as bebidas!',_food),
  GameTheme('Cores e formas','Encontre cores e formas!',['🔴','🟠','🟡','🟢','🔵','🟣','⚫','⚪','🟤','🟥','🟧','🟨','🟩','🟦','🟪','⬛','⬜','🔶','🔷','💠']),
  GameTheme('Roupas','Encontre as roupas!',_objects),
  GameTheme('Acessórios','Encontre os acessórios!',_objects),
  GameTheme('Objetos do dia a dia','Encontre os objetos!',_objects),
  GameTheme('Cozinha','Encontre os objetos da cozinha!',_food),
  GameTheme('Casa e móveis','Encontre os itens da casa!',_objects),
  GameTheme('Brinquedos','Encontre os brinquedos!',['🧸','🪀','🪁','🎈','🎯','🎲','🧩','🪅','🪆','🎮','🕹️','🪇','🎨','🪄','🧱','🚂','🚗','🪃','⚽','🏀']),
  GameTheme('Estrelas e magia','Encontre os símbolos mágicos!',_space),
  GameTheme('Flores e jardins','Encontre as flores e plantas!',_nature),
  GameTheme('Clima e natureza','Encontre os símbolos da natureza!',_nature),
  GameTheme('Espaço sideral','Encontre os objetos do espaço!',_space),
  GameTheme('Transportes terrestres','Encontre os transportes terrestres!',_vehicles),
  GameTheme('Transportes aéreos e aquáticos','Encontre os transportes!',_vehicles),
  GameTheme('Lugares e cidades','Encontre os lugares!',_objects),
  GameTheme('Escola e estudos','Encontre os materiais escolares!',_objects),
  GameTheme('Música','Encontre os instrumentos musicais!',_objects),
  GameTheme('Esportes','Encontre os itens esportivos!',_sports),
  GameTheme('Viagem e férias','Encontre os itens de viagem!',_travel),
  GameTheme('Profissões','Encontre símbolos de profissões!',_objects),
  GameTheme('Ferramentas','Encontre as ferramentas!',_objects),
  GameTheme('Beleza e cuidados','Encontre os itens de cuidado pessoal!',_objects),
  GameTheme('Insetos','Encontre os insetos e pequenos animais!',_nature),
  GameTheme('Répteis e anfíbios','Encontre os répteis e anfíbios!',_animals),
  GameTheme('Vida no fundo do mar','Encontre as criaturas marinhas!',_animals),
  GameTheme('Doces de festa','Encontre as guloseimas de festa!',_sweets),
  GameTheme('Café da manhã','Encontre os alimentos do café da manhã!',_food),
  GameTheme('Horta e vegetais','Encontre os vegetais!',_food),
  GameTheme('Emoções e expressões','Encontre as carinhas!',['😀','😃','😄','😁','😆','😅','😂','🥹','😊','😎','😍','🥰','😘','🤩','🥳','😴','🤔','😋','😇','🤗']),
  GameTheme('Corações e sentimentos','Encontre os símbolos de carinho!',_hearts),
  GameTheme('Festa e presentes','Encontre os itens de festa!',_sweets),
  GameTheme('Joias e tesouros','Encontre os tesouros!',_objects),
  GameTheme('Montanhas e aventuras','Encontre os itens de aventura!',_nature),
  GameTheme('Inverno e neve','Encontre os símbolos do inverno!',_nature),
  GameTheme('Verão e praia','Encontre os itens de verão!',_travel),
  GameTheme('Mundo dos dinossauros','Encontre as figuras pré-históricas!',_animals),
  GameTheme('Fundo do espaço','Encontre as figuras do espaço!',_space),
  GameTheme('Mistura de animais','Encontre os animais!',_animals),
  GameTheme('Mistura de alimentos','Encontre as comidas e bebidas!',_food),
  GameTheme('Mistura de objetos','Encontre os objetos!',_objects),
  GameTheme('Desafio arco-íris','Encontre as cores e símbolos!',['🌈','🔴','🟠','🟡','🟢','🔵','🟣','🩷','⭐','🌟','💜','💙','💚','💛','🧡','❤️','✨','💫','🔶','🔷']),
  GameTheme('Desafio final','Encontre todos os pares do desafio final!',_animals),
];

class LevelInfo {
  final String title, description;
  final int themeIndex, pairs;
  const LevelInfo(this.title,this.description,this.themeIndex,this.pairs);
}
final List<LevelInfo> levels = List.generate(50,(i) {
  final ti=i%themes.length;
  final pairs=i<5?10:i<15?12:i<30?15:i<40?18:20;
  return LevelInfo(themes[ti].title,themes[ti].description,ti,pairs);
});

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context)=>Scaffold(body:SafeArea(child:Center(child:SingleChildScrollView(padding:const EdgeInsets.all(22),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    const Text('🧠',style:TextStyle(fontSize:60)),
    RichText(text:const TextSpan(style:TextStyle(fontSize:50,fontWeight:FontWeight.w900),children:[TextSpan(text:'Memori',style:TextStyle(color:brown)),TextSpan(text:'ê',style:TextStyle(color:pink))])),
    const SizedBox(height:10),const Text('Combine, descubra\ne divirta-se!',textAlign:TextAlign.center,style:TextStyle(fontSize:22,color:brown)),
    const SizedBox(height:24),const Text('🍓     🐼     ⭐',style:TextStyle(fontSize:48)),
    const SizedBox(height:20),const Text('50 fases para explorar',style:TextStyle(fontSize:18,color:brown,fontWeight:FontWeight.bold)),
    const SizedBox(height:24),SizedBox(width:280,height:64,child:ElevatedButton.icon(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const GameScreen())),icon:const Icon(Icons.play_arrow,size:32),label:const Text('JOGAR',style:TextStyle(fontSize:24,fontWeight:FontWeight.w900)),style:ElevatedButton.styleFrom(backgroundColor:pink,foregroundColor:Colors.white)),
    TextButton(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const LevelsScreen())),child:const Text('VER AS 50 FASES',style:TextStyle(color:brown))),
  ])))));
}

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});
  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Escolha uma fase')),body:ListView.builder(itemCount:levels.length,itemBuilder:(context,i)=>Card(color:Colors.white,child:ListTile(leading:CircleAvatar(backgroundColor:i.isEven?pink:purple,child:Text('${i+1}',style:const TextStyle(color:Colors.white))),title:Text(levels[i].title),subtitle:Text('${levels[i].pairs} pares • ${levels[i].description}'),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>GameScreen(startLevel:i))))));
}

class MemoryCard { final int id; final String emoji; bool faceUp=false,matched=false; MemoryCard(this.id,this.emoji); }

class GameScreen extends StatefulWidget {
  final int startLevel;
  const GameScreen({super.key,this.startLevel=0});
  @override State<GameScreen> createState()=>_GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
  final Random random=Random(); List<MemoryCard> cards=[]; final List<int> selected=[];
  Timer? timer; late int level; int moves=0,matchedPairs=0,seconds=0; bool checking=false,finished=false,timerStarted=false;
  LevelInfo get info=>levels[level]; GameTheme get theme=>themes[info.themeIndex];
  @override void initState(){super.initState();level=widget.startLevel.clamp(0,49);_createCards();}
  void _createCards(){
    final symbols=theme.symbols.toSet().toList()..shuffle(random);
    final usable=symbols.take(min(info.pairs,symbols.length)).toList();
    final deck=[...usable,...usable]..shuffle(random);
    cards=List.generate(deck.length,(i)=>MemoryCard(i,deck[i]));
  }
  void _startTimer(){if(timerStarted)return;timerStarted=true;timer=Timer.periodic(const Duration(seconds:1),(_){if(mounted&&!finished)setState(()=>seconds++);});}
  void _tap(int i){
    if(checking||finished||cards[i].faceUp||cards[i].matched)return;
    _startTimer();setState(()=>cards[i].faceUp=true);selected.add(i);
    if(selected.length==2){moves++;_checkPair();}
  }
  void _checkPair(){
    checking=true;final a=selected[0],b=selected[1];
    if(cards[a].emoji==cards[b].emoji){
      setState(()=>{cards[a].matched=true,cards[b].matched=true,matchedPairs++,selected.clear(),checking=false});
      if(matchedPairs==min(info.pairs,theme.symbols.toSet().length))_finish();
    }else{
      Timer(const Duration(milliseconds:850),(){if(!mounted)return;setState(()=>{cards[a].faceUp=false,cards[b].faceUp=false,selected.clear(),checking=false});});
    }
  }
  void _finish(){finished=true;timer?.cancel();Future.delayed(const Duration(milliseconds:300),(){if(mounted)_result();});}
  String _time()=> '${(seconds~/60).toString().padLeft(2,'0')}:${(seconds%60).toString().padLeft(2,'0')}';
  void _result(){
    final last=level==49;
    showDialog<void>(context:context,barrierDismissible:false,builder:(d)=>AlertDialog(backgroundColor:bg,title:Text(last?'🏆 Você venceu tudo!':'🎉 Fase concluída!',textAlign:TextAlign.center),content:Column(mainAxisSize:MainAxisSize.min,children:[Text(last?'Você completou as 50 fases!':'Você concluiu ${info.title}!'),Text('🎯 Jogadas: $moves'),Text('⏱️ Tempo: ${_time()}')]),actions:[TextButton(onPressed:(){Navigator.pop(d);Navigator.pop(context);},child:const Text('Voltar ao início')),ElevatedButton(onPressed:(){Navigator.pop(d);setState(()=>level=last?0:level+1);_restart();},child:Text(last?'JOGAR NOVAMENTE':'PRÓXIMA FASE'))]));
  }
  void _restart(){timer?.cancel();setState((){moves=0;matchedPairs=0;seconds=0;checking=false;finished=false;timerStarted=false;selected.clear();_createCards();});}
  @override void dispose(){timer?.cancel();super.dispose();}
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:Text('Fase ${level+1} de 50'),actions:[IconButton(onPressed:_restart,icon:const Icon(Icons.refresh))]),body:SafeArea(child:Column(children:[
    Padding(padding:const EdgeInsets.all(10),child:Row(children:[Expanded(child:_stat('🎯','JOGADAS','$moves',const Color(0xFFFFE6A0))),const SizedBox(width:8),Expanded(child:_stat('⏱️','TEMPO',_time(),const Color(0xFFFFD9EC))),const SizedBox(width:8),Expanded(child:_stat('⭐','PARES','$matchedPairs/${min(info.pairs,theme.symbols.toSet().length)}',const Color(0xFFDDF4E4)))])),
    Text(info.title,style:const TextStyle(fontSize:19,fontWeight:FontWeight.w900,color:brown)),Padding(padding:const EdgeInsets.all(6),child:Text(info.description,textAlign:TextAlign.center,style:const TextStyle(color:brown))),
    Expanded(child:GridView.builder(padding:const EdgeInsets.all(10),itemCount:cards.length,gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4,crossAxisSpacing:8,mainAxisSpacing:8,childAspectRatio:.88),itemBuilder:(context,i)=>_card(cards[i],()=>_tap(i)))),
    Padding(padding:const EdgeInsets.all(10),child:SizedBox(width:double.infinity,child:OutlinedButton.icon(onPressed:_restart,icon:const Icon(Icons.replay),label:const Text('RECOMEÇAR FASE'))))
  ])));
  Widget _stat(String emoji,String label,String value,Color color)=>Container(padding:const EdgeInsets.symmetric(vertical:8),decoration:BoxDecoration(color:color,borderRadius:BorderRadius.circular(16)),child:Column(children:[Text(emoji,style:const TextStyle(fontSize:20)),Text(label,style:const TextStyle(fontSize:10,fontWeight:FontWeight.bold,color:brown)),Text(value,style:const TextStyle(fontSize:17,fontWeight:FontWeight.w900,color:brown))]));
  Widget _card(MemoryCard c,VoidCallback tap){final open=c.faceUp||c.matched;const colors=[Color(0xFFFFB9D9),Color(0xFFBDB0FF),Color(0xFFFFD980),Color(0xFFA8E8C0),Color(0xFFFFC4A8)];return Material(color:Colors.transparent,child:InkWell(onTap:c.matched?null:tap,borderRadius:BorderRadius.circular(16),child:AnimatedContainer(duration:const Duration(milliseconds:180),decoration:BoxDecoration(color:c.matched?const Color(0xFFDFF4E4):open?Colors.white:colors[c.id%colors.length],borderRadius:BorderRadius.circular(16),border:Border.all(color:Colors.white,width:3),boxShadow:[BoxShadow(color:brown.withOpacity(.1),blurRadius:5,offset:const Offset(0,3))]),child:Center(child:FittedBox(child:Text(open?c.emoji:'?',style:TextStyle(fontSize:open?42:38,fontWeight:FontWeight.w900,color:open?brown:Colors.white))))));}
}
