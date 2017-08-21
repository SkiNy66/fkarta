require 'date'
require 'fkarta/version'
require 'fkarta/remoter'
require 'fkarta/xml_helper'
require 'fkarta/transliterator'
require 'fkarta/config'


module Fkarta

  def self.rules_by(user)
    response = Remoter.get_user_data(user)

    return "Response code: #{response.code}" if bad_response?(response)

    XmlHelper.extract_rules response.body
  end

  private

  def self.bad_response?(response)
    response.code != '200'
  end

end
