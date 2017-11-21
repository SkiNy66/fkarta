require 'net/https'
require 'nokogiri'

module Fkarta

  class Remoter
    def self.get_user_data(user)
      http, uri = prepare_request
      xml = XmlHelper.xml_for(user)

      http.post(uri.request_uri, "xml=#{xml}")
    end

    private

    def self.prepare_request
      uri = URI.parse(Config::params[:request_url])

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.cert = OpenSSL::X509::Certificate.new(certificate)
      http.key = OpenSSL::PKey::RSA.new(key)
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      return http, uri
    end

    def self.key
      p12.key
    end

    def self.certificate
      p12.certificate
    end

    def self.p12
      @@p12 ||= OpenSSL::PKCS12.new(File.read(Config.params[:path_to_cert]), Config.params[:cert_key])
    end
  end

end
