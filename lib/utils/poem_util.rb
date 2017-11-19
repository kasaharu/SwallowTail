class PoemUtil
  TOTAL_COUNT = 74
  POEM_LIST   = [
    '1: 我等は　姿無きが故に　それを畏れ',
    '2: 人が希望を持ちえるのは　死が目に見えぬものであるからだ',
    '3: もし　わたしが雨だったなら　それが永遠に交わることのない　空と大地を繋ぎ留めるように　誰かの心を繋ぎ留めることができただろうか',
    '4: ぼくたちは　ひかれあう　水滴のように　惑星のように　ぼくたちは　反発しあう　磁石のように　肌の色のように',
    '5: 剣を握らなければ　おまえをまもれない　剣を握ったままでは　おまえを抱き締められない',
    '6: そう、我々に運命などない　無知と恐怖にのまれ　足を踏み外したものたちだけが　運命と呼ばれる濁流の中へと堕ちてゆくのだ',
    '7: 我々は涙を流すべきではない　それは心に対する肉体の敗北であり　我々が心というものを　持て余す存在であるということの　証明にほかならないからだ',
    '8: 錆びつけば　二度と突き立てられず　掴み損なえば　我が身を裂く　そう　誇りとは　刃に似ている',
    '9: ああ　おれたちは皆　眼をあけたまま　空を飛ぶ夢を見てるんだ',
    '10: 俺達は　手を伸ばす　雲を払い　空を貫き　月と火星は掴めても　真実には　まだ届かない',
    '11: 届かぬ牙に　火を灯す　あの星を見ずに済むように　この喉を裂いて　しまわなぬように',
    '12: 我々が岩壁の花を美しいと思うのは　我々が岩壁に足を止めてしまうからだ　怖れ無き　その花のように　空へと踏み出せずいるからだ',
    '13: 誇りを一つ捨てるたび　我等は獣に一歩近付く　心を一つ殺すたび　我等は獣から一歩遠退く',
    '14: 軋む軋む　浄罪の塔　光のごとくに　世界を貫く　揺れる揺れる　背骨の塔　墜ちてゆくのは　ぼくらか　空か',
    '15: ぼくは　ただ　きみに　さよならを言う練習をする',
    '16: 降り頻る太陽の鬣が　薄氷に残る足跡を消していく　欺かれるを恐れるな　世界は既に欺きの上にある',
    '17: 血のように赤く　骨のように白く　孤独のように赤く　沈黙のように白く　獣の神経のように赤く　神の心臓のように白く　溶け出る憎悪のように赤く　凍てつく傷歎のように白く　夜を食む影のように赤く　月を射抜く吐息のように白く輝き 赤く散る',
    '18: あなたの影は　密やかに　行くあての無い　毒針ののように　私の歩みを縫いつける　あなたの光は　しなやかに　給水塔を打つ　落雷のように　私の命の源を断つ',
    '19: そう、何ものも　わたしの世界を　変えられはしない',
    '20: 美しきを愛に譬ふのは　愛の姿を知らぬ者　醜きを愛に譬ふのは　愛を知ったと驕る者',
    '21: この世のすべては　あなたを追いつめる為にある',
    '22: 我等の世界に意味など無く　そこに生きる我々にも　意味など無い　無意味な我らは　世界を想う　そこに意味は無いと知ることにすら　意味など無いというのに',
    '23: 俺たちは滝の中の魚　俺たちは籠の中の虫　俺たちは波濤の残骸　髑髏の錫杖　力の奔流　それを呑む鯨　俺たちは五本角の雄牛　俺たちは火を吹く怪物　泣き叫ぶ子供　ああ　俺たちは　月光に毒されている',
    '24: どいつもこいつも、ぶっ壊れちまえ',
    '25: 我々は皆　生まれながらにして死んでいる　終焉は常に　始まりの前から　そこに在るのだ
    生きることが　何かを知り続けることならば　我々が最後に知るものこそが終焉であり　終焉をついに見出し　完全に知ることこそが　即ち死なのだ　我々は何かを知ろうとしてはならない　死を超越できぬ者は　何ものも知ろうとしてはならないのだ',
    '26: 私の胸に深く突き刺さるその声は　鳴り止まぬ歓声に似ている',
    '27: 私達　一つとして　混じりあうものはない　二つとして　同じ貌をしていない　三つ目の　瞳を持たぬばかりに　四つ目の　方角に希望はない　五つ目は　心臓の場所にある',
    '28: 主よ、我々は　孔雀を見るような目つきで　あなたを見る　それは期待と、渇仰と　恐怖に似た底知れぬものに　縁取られているのだ',
    '29: ただ執拗に　飾り立てる　切り落とされると知りながら　ただ執拗に　磨き上げる　切り落とされると知りながら
    恐ろしのだ　恐ろしのだ　切り落とされる　その時が　切り落とされた　その髪は　死んだあなたに　似てしまう',
    '30: その疵深し、海淵の如し　その罪赤し、死して色無し',
    '31: 世界一嫌いだと言ってくれ',
    '32: 王は駆ける　影を振り切り　鎧を鳴らし　骨を蹴散らし　血肉を啜り　軋みを上げる　心を潰し　独り踏み入る　遥か彼方へ',
    '33: 俺達は虫　不揮発性の　悪意の下で　這い回る蠢虫　首をもたげる　月より高く　憐れなお前等が　見えなくなるまで',
    '34: 私に翼をくれるなら　私はあなたのために飛ぼう　たとえば　この　大地のすべてが　水に沈んでしまうとしても　私に剣をくれるなら　私はあなたのために立ち向かおう
    たとえ　この　空のすべてが　あなたを光で射抜くとしても',
    '35: 産まれ堕ちれば、死んだも同然',
    '36: 信じるのは、まだ',
    '37: 人を美しいとは思わないけれど　花を美しいとは思う　人の姿が花に似るのは　ただ斬り裂かれて倒れる時だ',
    '38: 恐れることは　ただひとつ　恐れを知らぬ　戦士と為ること',
    '39: 愆（あやまつ）は、人　殺すは、鬼',
    '40: 心在るが故に妬み　心在るが故に喰らい　心在るが故に奪い　心在るが故に傲り　心在るが故に侮り　心在るが故に怒り　心在るが故に　お前のすべてを欲する',
    '41: 失くしたものを　奪い取る　血と肉と骨と　あとひとつ',
    '42: 犠牲無き世界など　ありはしない　気付かないのか　我々は　血の海に　灰を浮かべた地獄の名を　仮に世界と　呼んでいるのだ',
    '43: 腐敗は我が友　夜は我が僕　鴉にこの身を啄ませながら　楡の館でお前を待つ',
    '44: 確信した正義とは、悪である　正義が正義たり得る為には　常に自らの正義を疑い続けなければならない',
    '45: 伏して生きるな、立ちて死すべし',
    '46: 不幸を知ることは　怖ろしくはない　怖ろしいのは　過ぎ去った幸福が　戻らぬと知ること',
    '47: 君が明日　蛇となり　人を喰らい　始めるとして　人を喰らった　その口で　僕を愛すと　咆えたとして　僕は果たして　今日と同じに　君を愛すと　言えるだろうか',
    '48: 人は皆、猿のまがいもの　神は皆、人のまがいもの',
    '49: 僕は　ついてゆけるだろうか　君のいない世界のスピードに',
    '50: 時は常に背後から迫り　唸りを上げて眼前に流れ去る　踏み止まれ　時がお前を　美しい過去へと押し流そうと　どれほど牙を剥こうとも　前を見るな　お前の希望は　背後に迫る　冥冥たる濁流の中にしかない',
    '51: あたしの心に　指を入れないで',
    '52: 一緒に数えてくれるかい　君についた　僕の歯型を',
    '53: 僕が　こんなにも若く　こんなにも未熟であるということが　老いさらばえ　完全無欠である大人達には　どうにも許し難いことのようなのだ',
    '54: 変わらぬものは　心だと　言えるのならば　それが強さ',
    '55: 一歩踏み出す　二度と戻れぬ　三千世界の　血の海へ',
    '56: 軍勢ゆきゆきて喇叭（ラッパ）を吹く　耳鳴り止まず星屑のごとく　軍靴の轟き雷鳴のごとく',
    '57: 散りて二度とは　咲かずとも　炎のごとくに　散るぞ美（うるわ）し',
    '58: 魂燃え立つ　雨の降るとも',
    '59: 戦いこそすべて',
    '60: 罪無きあなたは　太陽のよう　罪深きあなたも　太陽のよう',
    '61: 最後の9日間　封じられし滅却師の王は、9日間を以って世界を取り戻す',
    '62: 己の生に抗い続ける　己の心に　牙ある限り',
    '63: 生きることと　生かされることに　違いは無い　死ぬことと　殺されることに　違いが無いように',
    '64: 美しさとは、そこに何もないこと',
    '65: 好きだよ　死ぬほど',
    '66: 断ち斬るものは　命だけかい',
    '67: 御先　真黒　真逆様',
    '68: 毒々しくって　眩々(くらくら)するだろ？',
    '69: 銃弾、鉤爪、軍旗、刀剣、五本指折り　お前を待つ',
    '70: 痛みは無い　その天秤から　眼を逸らせぬ事以外に',
    '71: 吾子の手かわいや　さまよう手　吾をもとめて　流離うて　寄らば離れる　手をとって　引きて歩もう　沙汰の果て',
    '72: 言葉に姿があったなら　暗闇に立つきみに届きはしないだろう',
    '73: 牙より滴る火は消えず　刃立つ野を焼き払い　友の姿を炙り出す',
    '74: 我等は　姿無くとも　歩みは止めず',
  ].freeze

  def self.select_poem
    random_number = rand(TOTAL_COUNT) + 1
    POEM_LIST[random_number]
  end
end
