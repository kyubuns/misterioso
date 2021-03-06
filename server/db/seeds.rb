ActiveRecord::Base::transaction() do
  MasterCard.delete_all
  MasterCardLineup.delete_all
  MasterCard.create(code: 1,   rarity:1, name: 'ActionScript')
  MasterCard.create(code: 2,   rarity:1, name: 'Bash')
  MasterCard.create(code: 3,   rarity:1, name: 'BASIC')
  MasterCard.create(code: 4,   rarity:1, name: 'Boo')
  MasterCard.create(code: 5,   rarity:1, name: 'Brainfuck')
  MasterCard.create(code: 6,   rarity:1, name: 'C')
  MasterCard.create(code: 7,   rarity:1, name: 'C#')
  MasterCard.create(code: 8,   rarity:1, name: 'C++')
  MasterCard.create(code: 9,   rarity:1, name: 'Caml')
  MasterCard.create(code: 10,  rarity:1, name: 'CASL')
  MasterCard.create(code: 11,  rarity:1, name: 'COBOL')
  MasterCard.create(code: 12,  rarity:1, name: 'CommonLisp')
  MasterCard.create(code: 13,  rarity:1, name: 'CoffeeScript')
  MasterCard.create(code: 14,  rarity:1, name: 'csh')
  MasterCard.create(code: 15,  rarity:1, name: 'D')
  MasterCard.create(code: 16,  rarity:1, name: 'Dart')
  MasterCard.create(code: 17,  rarity:1, name: 'Delphi')
  MasterCard.create(code: 18,  rarity:1, name: 'Erlang')
  MasterCard.create(code: 19,  rarity:1, name: 'ECMAScript')
  MasterCard.create(code: 20,  rarity:1, name: 'F#')
  MasterCard.create(code: 21,  rarity:1, name: 'FORTRAN')
  MasterCard.create(code: 22,  rarity:1, name: 'GLSL')
  MasterCard.create(code: 23,  rarity:1, name: 'Go')
  MasterCard.create(code: 24,  rarity:1, name: 'Groovy')
  MasterCard.create(code: 25,  rarity:1, name: 'Haskell')
  MasterCard.create(code: 26,  rarity:1, name: 'Haxe')
  MasterCard.create(code: 27,  rarity:1, name: 'HSP')
  MasterCard.create(code: 28,  rarity:1, name: 'Java')
  MasterCard.create(code: 29,  rarity:1, name: 'JavaScript')
  MasterCard.create(code: 30,  rarity:1, name: 'JSX')
  MasterCard.create(code: 31,  rarity:1, name: 'Lua')
  MasterCard.create(code: 32,  rarity:1, name: 'LISP')
  MasterCard.create(code: 33,  rarity:1, name: 'LazyK')
  MasterCard.create(code: 34,  rarity:1, name: 'Objective-C')
  MasterCard.create(code: 35,  rarity:1, name: 'Pascal')
  MasterCard.create(code: 36,  rarity:1, name: 'Perl')
  MasterCard.create(code: 37,  rarity:1, name: 'PHP')
  MasterCard.create(code: 38,  rarity:1, name: 'Prolog')
  MasterCard.create(code: 39,  rarity:1, name: 'Python')
  MasterCard.create(code: 40,  rarity:1, name: 'R')
  MasterCard.create(code: 41,  rarity:1, name: 'Ruby')
  MasterCard.create(code: 42,  rarity:1, name: 'Scala')
  MasterCard.create(code: 43,  rarity:1, name: 'zsh')
  MasterCard.create(code: 44,  rarity:1, name: 'ぼくのかんがえたさいきょうのげんご')
  MasterCard.create(code: 45,  rarity:1, name: '文鳥言語')
  MasterCard.create(code: 46,  rarity:2, name: 'Gentoo')
  MasterCard.create(code: 47,  rarity:2, name: 'Ubuntu')
  MasterCard.create(code: 48,  rarity:2, name: 'CentOS')
  MasterCard.create(code: 49,  rarity:2, name: 'Windows')
  MasterCard.create(code: 50,  rarity:2, name: 'Mac')
  MasterCard.create(code: 100, rarity:5, name: '南ことり')
  MasterCard.create(code: 101, rarity:5, name: 'ﾎﾉｶﾁｬﾝｯ')
  MasterCardLineup.create(name: 'normal_gacha', card_code:   1, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   2, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   3, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   4, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   5, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   6, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   7, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   8, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:   9, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  10, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  11, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  12, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  13, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  14, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  15, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  16, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  17, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  18, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  19, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  20, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  21, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  22, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  23, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  24, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  25, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  26, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  27, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  28, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  29, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  30, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  31, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  32, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  33, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  34, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  35, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  36, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  37, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  38, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  39, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  40, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  41, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  42, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  43, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  44, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  45, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  46, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  47, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  48, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  49, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code:  50, probability: 20)
  MasterCardLineup.create(name: 'normal_gacha', card_code: 100, probability:  1)
  MasterCardLineup.create(name: 'normal_gacha', card_code: 101, probability:  1)

  MasterCard.create(code: 200, rarity:3, name: 'はるか')
  MasterCard.create(code: 201, rarity:3, name: 'ちはや')
  MasterCard.create(code: 202, rarity:3, name: 'ゆきほ')
  MasterCard.create(code: 203, rarity:3, name: 'やよい')
  MasterCard.create(code: 204, rarity:3, name: 'りつこ')
  MasterCard.create(code: 205, rarity:3, name: 'あずさ')
  MasterCard.create(code: 206, rarity:3, name: 'いおり')
  MasterCard.create(code: 207, rarity:3, name: 'まこと')
  MasterCard.create(code: 208, rarity:3, name: 'あみ')
  MasterCard.create(code: 209, rarity:3, name: 'まみ')
  MasterCard.create(code: 210, rarity:3, name: 'みき')
  MasterCard.create(code: 211, rarity:3, name: 'ひびき')
  MasterCard.create(code: 212, rarity:3, name: 'たかね')
  MasterCard.create(code: 213, rarity:4, name: 'ことりさん')
  MasterCardLineup.create(name: 'jinja', card_code: 200, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 201, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 202, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 203, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 204, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 205, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 206, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 207, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 208, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 209, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 210, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 211, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 212, probability: 100)
  MasterCardLineup.create(name: 'jinja', card_code: 213, probability: 50)

  MasterCard.create(code: 1000, rarity:5, name: 'お祝い枠＼ユーザー100人突破／')
  MasterCard.create(code: 1001, rarity:5, name: '年賀状')
end
