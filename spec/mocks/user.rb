class User
  def initialize
    @cards = [Card.new]

    @id = 153
    @first_name = "Лаура"
    @last_name = "Нугуманова"
    @middle_name = "Байбулатовна"
    @gender = "male"
    @birth_date = "1986-03-22"

    @mobile_phone = "+7 (701) 055-1177"

    @identity_document = "gov_id_card"
    @identity_document_number = "039604633"
    @identity_document_issued_on = "2016-01-13"
    @identity_document_issuer = "ministry_of_internal_affairs"
    @iin = "860525400683"
  end

  attr_reader :id, :first_name, :middle_name, :last_name, :mobile_phone,
              :birth_date, :birth_place, :identity_document_number, :cards,
              :identity_document_issuer, :gender, :identity_document_issued_on
end