require 'spec_helper'
require 'mocks/card'
require 'mocks/user'
require 'timecop'


RSpec.describe Fkarta, vcr: { :cassette_name => "user_rules", :record => :once } do
  before do
    Timecop.freeze(Date.new(2017, 11, 24))

    require 'dev_config/init_params'
    Fkarta::params(DevConfig::CONFIG_PARAMS)
  end

  let!(:user_rules) { Fkarta::rules_by(User.new) }

  it 'returns right count of user rules' do
    expect(user_rules.count).to eq 57
  end

  it 'returns array with user rules' do
    expect(user_rules).to eq [{"cntTINcard"=>{:level_1=>"M", :level_2=>"M50", :level_3=>"", :rule_flag=>"1", :rule_value=>"0"}}, {"CntAllTINUsers"=>{:level_1=>"M", :level_2=>"M52", :level_3=>"", :rule_flag=>"1", :rule_value=>"0"}}, {"cntcardpassport"=>{:level_1=>"M", :level_2=>"M49", :level_3=>"", :rule_flag=>"1", :rule_value=>"2"}}, {"SA"=>{:level_1=>"A", :level_2=>"A1", :level_3=>"", :rule_flag=>"1", :rule_value=>"2"}}, {"CntAllPhonesUsers"=>{:level_1=>"M", :level_2=>"M39", :level_3=>"", :rule_flag=>"1", :rule_value=>"2"}}, {"CntAllPassportsUsers"=>{:level_1=>"M", :level_2=>"M48", :level_3=>"", :rule_flag=>"1", :rule_value=>"1"}}, {"FirstDateSA"=>{:level_1=>"A", :level_2=>"A1", :level_3=>"A1.1", :rule_flag=>"1", :rule_value=>"2017-11-21"}}, {"FirstDateUseCardSA"=>{:level_1=>"M", :level_2=>"M37", :level_3=>"", :rule_flag=>"1", :rule_value=>"2017-11-21"}}, {"FirstDateUsePhoneSA"=>{:level_1=>"I", :level_2=>"I4", :level_3=>"", :rule_flag=>"1", :rule_value=>"2017-11-21"}}, {"Num_cellph_SP_90"=>{:level_1=>"I", :level_2=>"I3", :level_3=>"I3.3", :rule_flag=>"1", :rule_value=>"1"}}, {"Num_cellph_SP_120"=>{:level_1=>"I", :level_2=>"I3", :level_3=>"I3.4", :rule_flag=>"1", :rule_value=>"1"}}, {"Num_cellph_SP_180"=>{:level_1=>"I", :level_2=>"I3", :level_3=>"I3.5", :rule_flag=>"1", :rule_value=>"1"}}, {"Num_cellph_SP_360"=>{:level_1=>"I", :level_2=>"I3", :level_3=>"I3.6", :rule_flag=>"1", :rule_value=>"1"}}, {"NumCrdPhone_60"=>{:level_1=>"M", :level_2=>"M23", :level_3=>"M23.2", :rule_flag=>"1", :rule_value=>"1"}}, {"CntCardUser_SameAp"=>{:level_1=>"M", :level_2=>"M37", :level_3=>"", :rule_flag=>"1", :rule_value=>"86"}}, {"Num_cellph_SP_60"=>{:level_1=>"I", :level_2=>"I3", :level_3=>"I3.2", :rule_flag=>"1", :rule_value=>"1"}}, {"NumR_DIL_30"=>{:level_1=>"A", :level_2=>"A4", :level_3=>"A4.2_30", :rule_flag=>"1", :rule_value=>"86"}}, {"NumR_DIL_180"=>{:level_1=>"A", :level_2=>"A4", :level_3=>"A4.2_180", :rule_flag=>"1", :rule_value=>"86"}}, {"NumR_DIL_120"=>{:level_1=>"A", :level_2=>"A4", :level_3=>"A4.2_120", :rule_flag=>"1", :rule_value=>"86"}}, {"NumR_DIL_60"=>{:level_1=>"A", :level_2=>"A4", :level_3=>"A4.2_60", :rule_flag=>"1", :rule_value=>"86"}}, {"Num_cellph_SP_30"=>{:level_1=>"I", :level_2=>"I3", :level_3=>"I3.1", :rule_flag=>"1", :rule_value=>"1"}}, {"NumCrdPhone_180"=>{:level_1=>"M", :level_2=>"M23", :level_3=>"M23.5", :rule_flag=>"1", :rule_value=>"1"}}, {"NumCrdPhone_360"=>{:level_1=>"M", :level_2=>"M23", :level_3=>"M23.6", :rule_flag=>"1", :rule_value=>"1"}}, {"NumCrdPhone_90"=>{:level_1=>"M", :level_2=>"M23", :level_3=>"M23.3", :rule_flag=>"1", :rule_value=>"1"}}, {"cntcardusers"=>{:level_1=>"M", :level_2=>"M21", :level_3=>"", :rule_flag=>"1", :rule_value=>"4"}}, {"NumCrdPhone_120"=>{:level_1=>"M", :level_2=>"M23", :level_3=>"M23.4", :rule_flag=>"1", :rule_value=>"1"}}, {"NumR_DIL_360"=>{:level_1=>"A", :level_2=>"A4", :level_3=>"A4.2_360", :rule_flag=>"1", :rule_value=>"86"}}, {"NumCrdPhone_30"=>{:level_1=>"M", :level_2=>"M23", :level_3=>"M23.1", :rule_flag=>"1", :rule_value=>"1"}}, {"Num_cellph_SP_all"=>{:level_1=>"I", :level_2=>"I3", :level_3=>"", :rule_flag=>"1", :rule_value=>"1"}}, {"NumCrdPhone_all"=>{:level_1=>"M", :level_2=>"M23", :level_3=>"", :rule_flag=>"1", :rule_value=>"1"}}, {"NumR_DIL_90"=>{:level_1=>"A", :level_2=>"A4", :level_3=>"A4.2_90", :rule_flag=>"1", :rule_value=>"86"}}, {"NumR_DIL_all"=>{:level_1=>"A", :level_2=>"A4", :level_3=>"A4.2_all", :rule_flag=>"1", :rule_value=>"86"}}, {"cntallcardsusers"=>{:level_1=>"M", :level_2=>"M36", :level_3=>"", :rule_flag=>"1", :rule_value=>"1"}}, {"cardFound"=>{:level_1=>"M", :level_2=>"M1", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastSuccessfulDischargeDate"=>{:level_1=>"M", :level_2=>"M11", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastSuccessfulDischargeAmount"=>{:level_1=>"M", :level_2=>"M8", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"firstTransferFromMFODate"=>{:level_1=>"M", :level_2=>"M5", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"countIssuedFor180Days"=>{:level_1=>"M", :level_2=>"M4", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"countIssuedFor30Days"=>{:level_1=>"M", :level_2=>"M2", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"mfoIssuedFor90Days"=>{:level_1=>"M", :level_2=>"M19", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"mfoIssuedFor30Days"=>{:level_1=>"M", :level_2=>"M18", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"totalRecurrentAmount"=>{:level_1=>"M", :level_2=>"M16", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"totalIssuedAmount"=>{:level_1=>"M", :level_2=>"M15", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"totalDischargeAmount"=>{:level_1=>"M", :level_2=>"M14", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"mfoCountFor180Days"=>{:level_1=>"M", :level_2=>"M13", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"mfoCountFor90Days"=>{:level_1=>"M", :level_2=>"M12", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"countIssuedFor90Days"=>{:level_1=>"M", :level_2=>"M3", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"mfoCountFor30Days"=>{:level_1=>"M", :level_2=>"M11", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastTransferFromMFODate"=>{:level_1=>"M", :level_2=>"M10", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastSuccessfulRecurrentAmount"=>{:level_1=>"M", :level_2=>"M9", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastRecurrentAmount"=>{:level_1=>"M", :level_2=>"M7", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"mfoIssuedFor180Days"=>{:level_1=>"M", :level_2=>"M20", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastRecurrentDate"=>{:level_1=>"M", :level_2=>"M9", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"transfersFromMFO"=>{:level_1=>"M", :level_2=>"M17", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastDischargeDate"=>{:level_1=>"M", :level_2=>"M7", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastDischargeAmount"=>{:level_1=>"M", :level_2=>"M6", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}, {"lastSuccessfulRecurrentDate"=>{:level_1=>"M", :level_2=>"M13", :level_3=>"", :rule_flag=>"0", :rule_value=>""}}]
  end

  it 'returns sorted rule levels' do
    expect(user_rules.map{|hash| hash.values.first.keys == [:level_1, :level_2, :level_3, :rule_flag, :rule_value] }.uniq).to include(true)
  end

  it 'returns right date values' do
    expect(user_rules
               .map{|hash| hash.values.first[:rule_value] if hash.keys.first.to_s.include? 'Date'}.compact.uniq).to contain_exactly('', '2017-11-21')
  end

  after { Timecop.return }

end
