module Fkarta

  def self.params(params)
    Config.params = params
  end

  class Config
    class << self
      attr_writer :params

      def params
        @params || {}
      end
    end
  end

end
