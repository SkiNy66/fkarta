require 'spec_helper'
require 'mocks/card'
require 'mocks/user'

RSpec.describe Fkarta do

  before do
    require 'dev_config/init_params'
    Fkarta::params(DevConfig::CONFIG_PARAMS)
  end

  it 'returns rules' do
    expect(Fkarta::rules_by(User.new).count).to eq 39
  end

end
