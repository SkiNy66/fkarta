class Transliterator

  def self.transliterate(string)
    string.split { |char| transliterate_char(char) }.join('')
  end

  private

  DICTIONARY = {
      'А' => 'A',
      'Б' => 'B',
      'В' => 'V',
      'Г' => 'G',
      'Д' => 'D',
      'Е' => 'E',
      'Ё' => 'E',
      'Ж' => 'ZH',
      'З' => 'Z',
      'И' => 'I',
      'Й' => 'Y',
      'К' => 'K',
      'Л' => 'L',
      'М' => 'M',
      'Н' => 'N',
      'О' => 'O',
      'П' => 'P',
      'Р' => 'R',
      'С' => 'S',
      'Т' => 'T',
      'У' => 'U',
      'Ф' => 'F',
      'Х' => 'KH',
      'Ц' => 'TS',
      'Ч' => 'CH',
      'Ш' => 'SH',
      'Щ' => 'SHCH',
      'Ъ' => '',
      'Ы' => 'Y',
      'Ь' => '',
      'Э' => 'E',
      'Ю' => 'YU',
      'Я' => 'YA',
      '0' => '0',
      '1' => '1',
      '2' => '2',
      '3' => '3',
      '4' => '4',
      '5' => '5',
      '6' => '6',
      '7' => '7',
      '8' => '8',
      '9' => '9',
  }

  def self.transliterate_char(char)
    DICTIONARY[char.to_sym]
  end

end
