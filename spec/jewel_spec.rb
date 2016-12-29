require 'spec_helper'

describe Jewel, type: :request do
    
    describe 'initialize' do
       it 'authenticates the user', vcr:{cassette_name: :initialize} do
           jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
           expect(jewel.instance_variable_get(:@auth_token)).to be_a String
       end
       
    end
end