require 'unicode'

module Fkarta

  class XmlHelper
    def self.xml_for(user)
      root = Nokogiri::XML('<?xml version="1.0" encoding="utf-8"?>')
      now = DateTime.now.strftime('%FT%T')

      Nokogiri::XML::Builder.with(root) { |x|
        x.request '', { 'xmlns:xsd' => 'http://www.w3.org/2001/XMLSchema',
                        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
                        id: '1',
                        date: now,
                        request_type: 'MFO'} do
          x.person_data do
            x.person '', { record_id: user.id.to_s,
                           type: '1', # Заемщик
                           hash_first_name: h(user.first_name),
                           hash_middle_name: h(user.middle_name),
                           hash_last_name: h(user.last_name),
                           hash_birth_date: h(user.birth_date),
                           sex: user.gender == 'male' ? '1' : '2',
                           reason_request: '2'} do
              x.person_docs do
                x.doc! '', {
                            record_id: '1',
                            doc_type: '1', # Паспорт
                            hash_doc_serial: h(user.identity_document_number[0, 4]),
                            hash_doc_number: h(user.identity_document_number[4..-1]),
                            hash_doc_issue_date: h(user.identity_document_issued_on),
                            doc_issue_auth: user.identity_document_issuer
                        }
              end
              x.person_phones do
                x.phone '', { record_id: '1',
                              phone_type: '3',
                              phone_country_code: '7',
                              phone_number: user.mobile_phone.gsub!(/[0-9]/, '') }
              end
              x.person_cards do
                x.card '', { record_id: user.cards.first.id,
                             card_number: user.cards.first.masked_pan,
                             # card_exp_date: "2019-01-01"
                         }
              end
            end
          end
        end
      }.to_xml.chomp
    end

    def self.extract_rules(xml_string)
      xml_doc  = Nokogiri::XML(xml_string)
      rules = []

      xml_doc.xpath('//rule').each do |rule|
        attributes = {}

        RULE_ATTRIBUTE_KEYS.each do |key|
          attributes[key.to_sym] = rule[key]
        end

        rules << { rule['rule_name'] => attributes }
      end

      rules
    end

    private

    RULE_ATTRIBUTE_KEYS = %w(level_1 level_2 level_3 rule_flag rule_value)

    # This method converting string to stribog hash string
    def self.h(string)
      string.gsub!(/[^0-9A-Za-zА-Яа-я]/, '')
      string = Unicode::upcase(string)
      string = Transliterator.transliterate string

      stribog = Stribog::CreateHash.new(string, :convert)
      stribog.(512).hex
    end
  end

end