
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MemorieApp());

const bg = Color(0xFFFFF8F1);
const brown = Color(0xFF805044);
const pink = Color(0xFFF078B2);
const yellow = Color(0xFFFFD36A);
const purple = Color(0xFFB9A5E8);
const green = Color(0xFF9EDDB4);

class MemorieApp extends StatelessWidget {
  const MemorieApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Memoriê',
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: pink),
      appBarTheme: const AppBarTheme(
        backgroundColor: bg,
        foregroundColor: brown,
        centerTitle: true,
      ),
    ),
    home: const HomeScreen(),
  );
}

class GameTheme {
  final String title;
  final String description;
  final List<String> symbols;

  const GameTheme(this.title, this.description, this.symbols);
}

const themes = <GameTheme>[
  GameTheme('Animais fofinhos', 'Encontre os animais fofinhos!', [
    '🐱','🐶','🐼','🦊','🐸','🐵','🐰','🐻','🐨','🐹',
    '🐯','🐷','🐮','🐭','🐔','🐧','🐤','🦉','🦋','🐢'
  ]),
  GameTheme('Animais da fazenda', 'Encontre os animais da fazenda!', [
    '🐮','🐷','🐔','🐴','🐑','🐐','🦆','🐓','🐣','🐤',
    '🐄','🐖','🐏','🐎','🐕','🐈','🐇','🦃','🐥','🐾'
  ]),
  GameTheme('Animais selvagens', 'Encontre os animais selvagens!', [
    '🦁','🐯','🐘','🦒','🦓','🦛','🦏','🐆','🐅','🐊',
    '🦍','🐒','🐪','🐫','🦘','🐿️','🦔','🦌','🐻','🐺'
  ]),
  GameTheme('Animais marinhos', 'Encontre os animais do oceano!', [
    '🐬','🐳','🐋','🦈','🐙','🦀','🦞','🦐','🐠','🐟',
    '🐡','🪼','🦑','🦭','🐢','🪸','🐚','🦪','🦆','🦦'
  ]),
  GameTheme('Aves e borboletas', 'Encontre as aves e borboletas!', [
    '🦜','🦚','🦩','🦢','🦉','🦅','🦆','🐦','🐧','🐓',
    '🐤','🦋','🐝','🐞','🪲','🪰','🦗','🐌','🪶','🪺'
  ]),
  GameTheme('Frutas coloridas', 'Encontre as frutas!', [
    '🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🫐','🍒',
    '🍑','🥭','🍍','🥥','🥝','🍈','🍏','🍅','🫒','🍋‍🟩'
  ]),
  GameTheme('Doces e sobremesas', 'Encontre os doces e sobremesas!', [
    '🍰','🎂','🧁','🍩','🍪','🍫','🍬','🍭','🍮','🍯',
    '🍡','🍦','🍧','🍨','🥧','🍿','🍘','🍥','🧇','🥮'
  ]),
  GameTheme('Comidas gostosas', 'Encontre as comidas!', [
    '🍕','🍔','🍟','🌭','🥪','🌮','🌯','🥙','🧆','🥗',
    '🍝','🍜','🍣','🍱','🥟','🍤','🥞','🥐','🥨','🧀'
  ]),
  GameTheme('Bebidas', 'Encontre as bebidas!', [
    '🥛','🧋','🧃','🥤','☕','🍵','🫖','🍼','🍶','🍺',
    '🍷','🥂','🍹','🍸','🍾','🧉','🧊','🫗','🥄','🍽️'
  ]),
  GameTheme('Cores e formas', 'Encontre cores e formas!', [
    '🔴','🟠','🟡','🟢','🔵','🟣','⚫','⚪','🟤','🟥',
    '🟧','🟨','🟩','🟦','🟪','⬛','⬜','🔶','🔷','💠'
  ]),
  GameTheme('Roupas', 'Encontre as roupas!', [
    '👕','👖','👗','👚','🧥','🥼','🦺','🥻','🩱','🩳',
    '👔','👘','🧣','🧤','🧦','👙','👟','👠','🥾','🥿'
  ]),
  GameTheme('Acessórios', 'Encontre os acessórios!', [
    '👜','👛','👝','🎒','🧳','👓','🕶️','🥽','🌂','☂️',
    '⌚','💍','📿','👑','🎩','🧢','👒','💼','🪭','🪮'
  ]),
  GameTheme('Objetos do dia a dia', 'Encontre os objetos!', [
    '📱','☎️','💻','⌨️','🖱️','🖨️','📷','📺','📻','🔋',
    '🔦','💡','🕯️','🧯','🔑','🔒','🪞','🧴','🧸','🪑'
  ]),
  GameTheme('Cozinha', 'Encontre os objetos da cozinha!', [
    '🥄','🍴','🔪','🥣','🥢','🍽️','🫙','🧂','🍳','🥘',
    '🫕','🧈','🧊','🧽','🧹','🧺','🫧','🥡','🫖','🥤'
  ]),
  GameTheme('Casa e móveis', 'Encontre os itens da casa!', [
    '🛏️','🛋️','🪑','🚪','🪟','🪞','🪴','🧸','🕰️','🖼️',
    '🪜','🧹','🧺','🪣','🛁','🚿','🪥','🧻','🧼','🛎️'
  ]),
  GameTheme('Brinquedos', 'Encontre os brinquedos!', [
    '🧸','🪀','🪁','🎈','🎯','🎲','🧩','🪅','🪆','🎮',
    '🕹️','🪇','🎨','🪄','🧱','🚂','🚗','🪃','⚽','🏀'
  ]),
  GameTheme('Estrelas e magia', 'Encontre os símbolos mágicos!', [
    '⭐','🌟','✨','💫','🌙','☀️','🌈','🦄','🪄','🔮',
    '🧚','🧙','🧝','🧞','🧜','🧛','🧟','👑','💎','🪽'
  ]),
  GameTheme('Flores e jardins', 'Encontre as flores e plantas!', [
    '🌸','🌼','🌻','🌹','🌷','🪻','🌺','🪷','💐','🌱',
    '🌿','☘️','🍀','🌵','🌴','🌳','🌲','🪴','🍁','🍄'
  ]),
  GameTheme('Clima e natureza', 'Encontre os símbolos da natureza!', [
    '☀️','🌤️','⛅','🌥️','☁️','🌧️','⛈️','🌩️','🌨️','❄️',
    '☃️','🌪️','🌫️','🌈','💧','💦','🌊','🔥','🌋','🌬️'
  ]),
  GameTheme('Espaço sideral', 'Encontre os objetos do espaço!', [
    '🌍','🌎','🌏','🌕','🌖','🌗','🌘','🌑','🌒','🌓',
    '🌔','🌙','⭐','🌟','🪐','☄️','🚀','🛸','👽','🌌'
  ]),
  GameTheme('Transportes terrestres', 'Encontre os transportes terrestres!', [
    '🚗','🚕','🚙','🚌','🚎','🏎️','🚓','🚑','🚒','🚐',
    '🚚','🚛','🚜','🏍️','🛵','🚲','🛴','🚂','🚃','🚆'
  ]),
  GameTheme('Transportes aéreos e aquáticos', 'Encontre os transportes!', [
    '✈️','🛫','🛬','🛩️','🚁','🚀','🛸','🛶','⛵','🚤',
    '🛥️','🛳️','🚢','🛟','🪂','🎈','🛻','🚠','🚡','🚟'
  ]),
  GameTheme('Lugares e cidades', 'Encontre os lugares!', [
    '🏠','🏡','🏢','🏬','🏥','🏦','🏨','🏫','🏪','🏭',
    '🏛️','⛪','🕌','🛕','🏰','🏯','🗼','🗽','🌉','⛲'
  ]),
  GameTheme('Escola e estudos', 'Encontre os materiais escolares!', [
    '📚','📖','📕','📗','📘','📙','📓','📒','📔','✏️',
    '🖊️','🖍️','📝','📏','📐','✂️','📎','📌','🎒','🖇️'
  ]),
  GameTheme('Música', 'Encontre os instrumentos e símbolos musicais!', [
    '🎸','🎹','🎺','🎷','🎻','🪕','🥁','🪘','🪇','🎤',
    '🎧','🎼','🎵','🎶','📯','🪈','🪗','🔔','📻','🎙️'
  ]),
  GameTheme('Esportes', 'Encontre os itens esportivos!', [
    '⚽','🏀','🏈','⚾','🥎','🎾','🏐','🏉','🥏','🎱',
    '🏓','🏸','🏒','🏑','🥍','🏏','⛳','🥊','🥋','🎿'
  ]),
  GameTheme('Viagem e férias', 'Encontre os itens de viagem!', [
    '🧳','🎒','🗺️','🧭','🛂','🎫','🎟️','🏖️','🏝️','🏕️',
    '⛺','🏨','🚆','✈️','🚢','📸','🌞','🩴','🕶️','🧴'
  ]),
  GameTheme('Profissões', 'Encontre símbolos de profissões!', [
    '👩‍⚕️','👨‍⚕️','👩‍🍳','👨‍🍳','👩‍🚒','👨‍🚒','👩‍🏫','👨‍🏫',
    '👩‍🔬','👨‍🔬','👩‍🎨','👨‍🎨','👩‍🚀','👨‍🚀','👮','🕵️',
    '👷','💂','🧑‍🌾','🧑‍🔧'
  ]),
  GameTheme('Ferramentas', 'Encontre as ferramentas!', [
    '🔨','🪓','⛏️','⚒️','🛠️','🔧','🪛','🔩','⚙️','🗜️',
    '🪚','🪜','🧰','🪝','🧲','🔗','⛓️','🪤','🪠','🧱'
  ]),
  GameTheme('Beleza e cuidados', 'Encontre os itens de cuidado pessoal!', [
    '🪥','🧴','🧼','🪒','🪮','💄','💅','🧽','🛁','🚿',
    '🧻','🪞','🧺','🧦','🧖','🩹','🩺','💊','🧴','🪥'
  ]),
  GameTheme('Insetos', 'Encontre os insetos e pequenos animais!', [
    '🐝','🦋','🐛','🐌','🐞','🪲','🪳','🦟','🪰','🦗',
    '🕷️','🕸️','🦂','🐜','🪱','🐸','🦎','🐢','🦔','🐿️'
  ]),
  GameTheme('Répteis e anfíbios', 'Encontre os répteis e anfíbios!', [
    '🐸','🐢','🐍','🦎','🐊','🐉','🐲','🦖','🦕','🪲',
    '🐌','🦀','🐊','🐍','🐸','🦎','🐢','🦕','🦖','🐉'
  ]),
  GameTheme('Vida no fundo do mar', 'Encontre as criaturas marinhas!', [
    '🐙','🦑','🪼','🦀','🦞','🦐','🐚','🪸','🐠','🐟',
    '🐡','🦈','🐬','🐳','🐋','🦭','🦦','🦪','🐢','🪸'
  ]),
  GameTheme('Doces de festa', 'Encontre as guloseimas de festa!', [
    '🎂','🧁','🍰','🍭','🍬','🍫','🍩','🍪','🍡','🍮',
    '🍦','🍧','🍨','🥧','🎈','🎁','🎉','🎊','🕯️','🍿'
  ]),
  GameTheme('Café da manhã', 'Encontre os alimentos do café da manhã!', [
    '🥐','🥯','🍞','🥖','🧇','🥞','🧈','🥚','🍳','🥓',
    '🥛','☕','🫖','🍯','🍓','🍌','🥣','🥄','🧃','🧀'
  ]),
  GameTheme('Horta e vegetais', 'Encontre os vegetais!', [
    '🥕','🌽','🥦','🥬','🥒','🍆','🫑','🧄','🧅','🥔',
    '🍠','🫛','🥗','🍅','🍄','🌶️','🫚','🥜','🫘','🌱'
  ]),
  GameTheme('Emoções e expressões', 'Encontre as carinhas!', [
    '😀','😃','😄','😁','😆','😅','😂','🥹','😊','😎',
    '😍','🥰','😘','🤩','🥳','😴','🤔','😋','😇','🤗'
  ]),
  GameTheme('Corações e sentimentos', 'Encontre os símbolos de carinho!', [
    '❤️','🩷','🧡','💛','💚','💙','🩵','💜','🤎','🖤',
    '🤍','💖','💗','💓','💞','💕','💘','💝','💟','❣️'
  ]),
  GameTheme('Festa e presentes', 'Encontre os itens de festa!', [
    '🎁','🎈','🎉','🎊','🎀','🎂','🧁','🥳','🎭','🎨',
    '🎆','🎇','✨','🎵','🎶','🪅','🪩','🎤','📸','🌟'
  ]),
  GameTheme('Joias e tesouros', 'Encontre os tesouros!', [
    '💎','💍','👑','🏆','🥇','🥈','🥉','🪙','💰','💵',
    '💴','💶','💷','💳','🔮','🧿','📿','⚱️','🗝️','🔑'
  ]),
  GameTheme('Montanhas e aventuras', 'Encontre os itens de aventura!', [
    '⛰️','🏔️','🌋','🏕️','⛺','🧭','🗺️','🪵','🔥','🥾',
    '🎒','🧗','🪨','🌲','🌳','🌿','🦅','🌄','🪢','🧤'
  ]),
  GameTheme('Inverno e neve', 'Encontre os símbolos do inverno!', [
    '❄️','☃️','⛄','🌨️','🧊','🧣','🧤','🧥','🧦','🥾',
    '🏔️','⛷️','🏂','🛷','🌬️','☁️','🌲','🦌','🐧','🧢'
  ]),
  GameTheme('Verão e praia', 'Encontre os itens de verão!', [
    '🏖️','🏝️','🌞','☀️','🩴','🩱','🩳','🕶️','🧴','🏄',
    '🏊','🛟','🐚','🦀','🐬','🍉','🍦','🧃','⛱️','🌊'
  ]),
  GameTheme('Mundo dos dinossauros', 'Encontre os dinossauros e figuras pré-históricas!', [
    '🦖','🦕','🌋','🥚','🌴','🌿','🪨','🦴','🐾','🦎',
    '🪺','🌳','🌲','🍃','☄️','🌎','🔥','🐉','🐲','🦴'
  ]),
  GameTheme('Fundo do espaço', 'Encontre as figuras do espaço!', [
    '🚀','🛸','👽','🪐','🌌','🌠','☄️','🌑','🌕','🌙',
    '⭐','🌟','✨','💫','🔭','🛰️','🌍','🌎','🌏','👨‍🚀'
  ]),
  GameTheme('Mistura de animais', 'Encontre os animais!', [
    '🦁','🐼','🐨','🦊','🐻','🐯','🐸','🐵','🐰','🐶',
    '🐱','🐹','🐷','🐮','🐭','🐔','🐧','🦄','🦋','🐢'
  ]),
  GameTheme('Mistura de alimentos', 'Encontre as comidas e bebidas!', [
    '🍎','🍓','🍌','🍉','🍇','🍕','🍔','🍟','🍩','🍰',
    '🧁','🍪','🍫','🥛','🧃','☕','🍦','🍿','🥐','🍯'
  ]),
  GameTheme('Mistura de objetos', 'Encontre os objetos!', [
    '📱','💻','⌚','📷','🎒','👜','🔑','💡','📚','✏️',
    '🧸','🎮','🎧','🕶️','🧴','🪞','🧲','🔔','🧳','🖊️'
  ]),
  GameTheme('Desafio arco-íris', 'Encontre as cores e símbolos!', [
    '🌈','🔴','🟠','🟡','🟢','🔵','🟣','🩷','⭐','🌟',
    '💜','💙','💚','💛','🧡','❤️','✨','💫','🔶','🔷'
  ]),
  GameTheme('Desafio final', 'Encontre todos os pares do desafio final!', [
    '🐱','🍓','🚀','🎸','📱','🌻','🍕','🦋','🎁','⚽',
    '🧸','🍉','💎','🚗','🐬','🧁','🌈','📚','🪐','👑'
  ]),
];

class LevelInfo {
  final String title;
  final String description;
  final int themeIndex;
  final int pairs;

  const LevelInfo(this.title, this.description, this.themeIndex, this.pairs);
}

final List<LevelInfo> levels = List.generate(50, (i) {
  final themeIndex = i % themes.length;
  final pairs = i < 5 ? 10 : i < 15 ? 12 : i < 30 ? 15 : i < 40 ? 18 : 20;
  return LevelInfo(
    themes[themeIndex].title,
    themes[themeIndex].description,
    themeIndex,
    pairs,
  );
});

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 8),
                    const Text('🧠', style: TextStyle(fontSize: 54)),
                    const SizedBox(height: 4),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 51,
                          height: 1.05,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -2.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'Memori',
                            style: TextStyle(color: brown),
                          ),
                          TextSpan(
                            text: 'ê',
                            style: TextStyle(color: pink),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Combine, descubra\ne divirta-se!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        height: 1.3,
                        color: brown,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const _HomeCards(),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFCF8),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: brown.withOpacity(0.07),
                            blurRadius: 16,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: _Feature(
                              icon: Icons.style_rounded,
                              title: '50 fases',
                              subtitle: 'para explorar',
                              color: purple,
                            ),
                          ),
                          SizedBox(
                            height: 54,
                            child: VerticalDivider(
                              color: Color(0xFFF3C9D9),
                              thickness: 2,
                            ),
                          ),
                          Expanded(
                            child: _Feature(
                              icon: Icons.star_rounded,
                              title: 'Novos temas',
                              subtitle: 'e desafios',
                              color: yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 300,
                      height: 76,
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GameScreen(),
                          ),
                        ),
                        icon: const Icon(Icons.play_arrow_rounded, size: 36),
                        label: const Text(
                          'JOGAR',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pink,
                          foregroundColor: Colors.white,
                          elevation: 5,
                          shadowColor: pink.withOpacity(0.25),
                          shape: const StadiumBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      '—  Treine sua memória no seu ritmo  —',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9A6D7D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LevelsScreen(),
                        ),
                      ),
                      icon: const Icon(Icons.grid_view_rounded, size: 19),
                      label: const Text('VER AS 50 FASES'),
                      style: TextButton.styleFrom(foregroundColor: brown),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeCards extends StatelessWidget {
  const _HomeCards();

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 170,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(
          child: _SampleCard(
            emoji: '🍓',
            color: Color(0xFFFFD6E4),
            angle: 0,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _SampleCard(
            emoji: '🐼',
            color: Color(0xFFDCCFFF),
            angle: 0,
            front: true,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _SampleCard(
            emoji: '⭐',
            color: Color(0xFFFFE6A8),
            angle: 0,
          ),
        ),
      ],
    ),
  );
}

class _SampleCard extends StatelessWidget {
  final String emoji;
  final Color color;
  final double angle;
  final bool front;

  const _SampleCard({
    required this.emoji,
    required this.color,
    required this.angle,
    this.front = false,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Transform.rotate(
      angle: angle,
      child: Container(
        width: double.infinity,
        height: front ? 155 : 145,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white, width: 5),
          boxShadow: [
            BoxShadow(
              color: brown.withOpacity(0.10),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            emoji,
            style: TextStyle(fontSize: front ? 54 : 48),
          ),
        ),
      ),
    ),
  );
}

class _Feature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _Feature({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Icon(icon, color: color, size: 35),
      const SizedBox(height: 5),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: brown,
          fontSize: 14,
          fontWeight: FontWeight.w900,
        ),
      ),
      const SizedBox(height: 3),
      Text(
        subtitle,
        textAlign: TextAlign.center,
        style: const TextStyle(color: brown, fontSize: 12),
      ),
    ],
  );
}

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Escolha uma fase')),
    body: ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: levels.length,
      itemBuilder: (context, i) {
        final level = levels[i];
        return Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: i.isEven ? pink : purple,
              child: Text(
                '${i + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              level.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${level.pairs} pares • ${level.description}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GameScreen(startLevel: i),
              ),
            ),
          ),
        );
      },
    ),
  );
}

class MemoryCard {
  final int id;
  final String emoji;
  bool faceUp = false;
  bool matched = false;

  MemoryCard({required this.id, required this.emoji});
}

class GameScreen extends StatefulWidget {
  final int startLevel;
  const GameScreen({super.key, this.startLevel = 0});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Random random = Random();
  List<MemoryCard> cards = [];
  final List<int> selected = [];
  Timer? timer;

  late int level;
  int moves = 0;
  int matchedPairs = 0;
  int seconds = 0;
  bool checking = false;
  bool gameFinished = false;
  bool timerStarted = false;

  LevelInfo get info => levels[level];
  GameTheme get gameTheme => themes[info.themeIndex];

  @override
  void initState() {
    super.initState();
    level = widget.startLevel.clamp(0, 49);
    _createCards();
  }

  void _createCards() {
    final uniqueSymbols = gameTheme.symbols.toSet().toList();
    uniqueSymbols.shuffle(random);
    final symbols = uniqueSymbols.take(info.pairs).toList();

    final deck = [...symbols, ...symbols]..shuffle(random);
    cards = List.generate(
      deck.length,
      (i) => MemoryCard(id: i, emoji: deck[i]),
    );
  }

  void _startTimer() {
    if (timerStarted) return;
    timerStarted = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted && !gameFinished) {
        setState(() => seconds++);
      }
    });
  }

  void _tapCard(int index) {
    if (checking || gameFinished) return;
    final card = cards[index];
    if (card.faceUp || card.matched) return;

    _startTimer();
    setState(() {
      card.faceUp = true;
      selected.add(index);
    });

    if (selected.length == 2) {
      moves++;
      _checkPair();
    }
  }

  void _checkPair() {
    checking = true;
    final a = selected[0];
    final b = selected[1];

    if (cards[a].emoji == cards[b].emoji) {
      setState(() {
        cards[a].matched = true;
        cards[b].matched = true;
        matchedPairs++;
        selected.clear();
        checking = false;
      });

      if (matchedPairs == info.pairs) _finishLevel();
    } else {
      Timer(const Duration(milliseconds: 850), () {
        if (!mounted) return;
        setState(() {
          cards[a].faceUp = false;
          cards[b].faceUp = false;
          selected.clear();
          checking = false;
        });
      });
    }
  }

  void _finishLevel() {
    gameFinished = true;
    timer?.cancel();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _showResult();
    });
  }

  void _showResult() {
    final last = level == 49;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Dialog(
        backgroundColor: bg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                last ? '🏆' : '🎉',
                style: const TextStyle(fontSize: 62),
              ),
              Text(
                last ? 'Você venceu tudo!' : 'Fase concluída!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: brown,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                last
                    ? 'Você completou as 50 fases!'
                    : 'Você concluiu ${info.title}!',
              ),
              const SizedBox(height: 18),
              _ResultLine(emoji: '🎯', label: 'Jogadas', value: '$moves'),
              _ResultLine(
                emoji: '⏱️',
                label: 'Tempo',
                value: _formatTime(seconds),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                    setState(() => level = last ? 0 : level + 1);
                    _restartLevel();
                  },
                  icon: Icon(
                    last ? Icons.replay_rounded : Icons.arrow_forward,
                  ),
                  label: Text(last ? 'JOGAR NOVAMENTE' : 'PRÓXIMA FASE'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar ao início',
                  style: TextStyle(color: brown),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _restartLevel() {
    timer?.cancel();
    setState(() {
      moves = 0;
      matchedPairs = 0;
      seconds = 0;
      checking = false;
      gameFinished = false;
      timerStarted = false;
      selected.clear();
      _createCards();
    });
  }

  String _formatTime(int value) =>
      '${(value ~/ 60).toString().padLeft(2, '0')}:'
      '${(value % 60).toString().padLeft(2, '0')}';

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: bg,
      foregroundColor: brown,
      centerTitle: true,
      title: Text(
        'Fase ${level + 1} de 50',
        style: const TextStyle(fontWeight: FontWeight.w900),
      ),
      actions: [
        IconButton(
          onPressed: _restartLevel,
          icon: const Icon(Icons.refresh_rounded),
        ),
      ],
    ),
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    emoji: '🎯',
                    label: 'JOGADAS',
                    value: '$moves',
                    color: const Color(0xFFFFE6A0),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _InfoCard(
                    emoji: '⏱️',
                    label: 'TEMPO',
                    value: _formatTime(seconds),
                    color: const Color(0xFFFFD9EC),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _InfoCard(
                    emoji: '⭐',
                    label: 'PARES',
                    value: '$matchedPairs/${info.pairs}',
                    color: const Color(0xFFDDF4E4),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: Column(
              children: [
                Text(
                  info.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: brown,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  info.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: brown),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey('level_$level'),
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: cards.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.88,
              ),
              itemBuilder: (context, index) => _MemoryCardWidget(
                card: cards[index],
                onTap: () => _tapCard(index),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: SizedBox(
              width: double.infinity,
              height: 46,
              child: OutlinedButton.icon(
                onPressed: _restartLevel,
                icon: const Icon(Icons.replay_rounded),
                label: const Text(
                  'RECOMEÇAR FASE',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: brown,
                  side: const BorderSide(color: Color(0xFFD9C0A8)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _InfoCard extends StatelessWidget {
  final String emoji, label, value;
  final Color color;

  const _InfoCard({
    required this.emoji,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 9),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.white, width: 2),
    ),
    child: Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            color: brown,
          ),
        ),
        const SizedBox(height: 3),
        FittedBox(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: brown,
            ),
          ),
        ),
      ],
    ),
  );
}

class _MemoryCardWidget extends StatelessWidget {
  final MemoryCard card;
  final VoidCallback onTap;

  const _MemoryCardWidget({
    required this.card,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const colors = [
      Color(0xFFFFB9D9),
      Color(0xFFBDB0FF),
      Color(0xFFFFD980),
      Color(0xFFA8E8C0),
      Color(0xFFFFC4A8),
    ];

    final revealed = card.faceUp || card.matched;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: card.matched ? null : onTap,
        borderRadius: BorderRadius.circular(17),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            color: card.matched
                ? const Color(0xFFDFF4E4)
                : revealed
                    ? Colors.white
                    : colors[card.id % colors.length],
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: brown.withOpacity(0.10),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                revealed ? card.emoji : '?',
                style: TextStyle(
                  fontSize: revealed ? 43 : 40,
                  fontWeight: FontWeight.w900,
                  color: revealed ? brown : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultLine extends StatelessWidget {
  final String emoji, label, value;

  const _ResultLine({
    required this.emoji,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: brown,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: brown,
          ),
        ),
      ],
    ),
  );
}
