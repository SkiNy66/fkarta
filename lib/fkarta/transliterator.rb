class Transliterator

  def self.transliterate(string)
    transliterated_string = ''

    string.each_char { |char| transliterated_string += transliterate_char(char) }

    transliterated_string
  end

  private

  def self.transliterate_char(char)
    case char
      when 'А' then return 'A'
      when 'Б' then return 'B'
      when 'В' then return 'V'
      when 'Г' then return 'G'
      when 'Д' then return 'D'
      when 'Е' then return 'E'
      when 'Ё' then return 'E'
      when 'Ж' then return 'ZH'
      when 'З' then return 'Z'
      when 'И' then return 'I'
      when 'Й' then return 'Y'
      when 'К' then return 'K'
      when 'Л' then return 'L'
      when 'М' then return 'M'
      when 'Н' then return 'N'
      when 'О' then return 'O'
      when 'П' then return 'P'
      when 'Р' then return 'R'
      when 'С' then return 'S'
      when 'Т' then return 'T'
      when 'У' then return 'U'
      when 'Ф' then return 'F'
      when 'Х' then return 'KH'
      when 'Ц' then return 'TS'
      when 'Ч' then return 'CH'
      when 'Ш' then return 'SH'
      when 'Щ' then return 'SHCH'
      when 'Ъ' then return ''
      when 'Ы' then return 'Y'
      when 'Ь' then return ''
      when 'Э' then return 'E'
      when 'Ю' then return 'YU'
      when 'Я' then return 'YA'
      when '0' then return '0'
      when '1' then return '1'
      when '2' then return '2'
      when '3' then return '3'
      when '4' then return '4'
      when '5' then return '5'
      when '6' then return '6'
      when '7' then return '7'
      when '8' then return '8'
      when '9' then return '9'
      else
        return 'wrong chars'
    end
  end
end
