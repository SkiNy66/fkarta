require 'spec_helper'

RSpec.describe Fkarta do

  before do
    require 'dev_config/init_params'
    Fkarta::params(DevConfig::CONFIG_PARAMS)
  end

  it 'returns right hash of date' do
    expect(Fkarta::Stribog.hex("19830612")).to eq "d9365bc1d27b902466285eff8ef9b95a93cc62a6ca7f6abaa163b6ce18223fc32fd249f0bb5115b0e0443a5e6080be57c6e17f57990ff2a4f07e1da666ca2b6c" end

  it 'returns right hash of string' do
    expect(Fkarta::Stribog.hex("IVANOV")).to eq "0c898fab3da2cb386e7a443a677683be3b177ffe32141cc8aad3e2e287fdef8c1c672932a3b2298d7ed7ff94c863ba5fe297fec62dbb18702b262276267cc854" end
end
