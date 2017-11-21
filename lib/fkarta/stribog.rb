module Fkarta

  class Stribog
    def self.hex(string)
      `~/stribog -s #{string}`.chomp
    end
  end

end
