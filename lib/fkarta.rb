require 'date'
require 'fkarta/version'
require 'fkarta/remoter'
require 'fkarta/xml_helper'
require 'fkarta/transliterator'
require 'fkarta/config'

module Fkarta

  def self.rules_by(user)
    response = Remoter.get_user_data(user)
    xml_doc = Nokogiri::XML(response.body)
    answer_message = xml_doc.xpath('//xsd').first['answer']

    return answer_message if XmlHelper.bad_response?(answer_message)

    XmlHelper.extract_rules xml_doc
  end

end
