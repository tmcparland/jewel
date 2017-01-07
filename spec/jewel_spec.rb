require 'spec_helper'

describe Jewel, type: :request do
    
    describe 'initialize' do
       it 'authenticates the user', vcr:{cassette_name: :initialize} do
           jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
           expect(jewel.instance_variable_get(:@auth_token)).to be_a String
       end
    end
    
    describe 'get_me' do
      it 'retrieves the user',  vcr: {cassette_name: :get_me} do
        jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
        response = jewel.get_me
        expect(response.instance_variable_get(:@user_data)).to be_a Object
      end
    end
    
    describe 'get_mentor_availability' do
      it 'retrieves the mentor',  vcr: {cassette_name: :get_mentor_availability} do
        jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
        response = jewel.get_mentor_availability(ENV['MENTOR_ID'])
        expect(response.instance_variable_get(:@mentor_data)).to be_a Object
      end
    end
    
    describe 'get_roadmaps' do
       it 'retrieves the roadmap for the user',  vcr: {cassette_name: :get_roadmaps} do
         jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
         response = jewel.get_roadmaps(ENV['ROADMAP_ID'])
         expect(response.instance_variable_get(:@roadmap_data)).to be_a Object
       end
    end 
    
    describe 'get_checkpoints' do
       it 'retrieves the checkpoints for the user',  vcr: {cassette_name: :get_checkpoints} do
         jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
         response = jewel.get_checkpoints(ENV['CHECKPOINT_ID'])
         expect(response.instance_variable_get(:@checkpoint_data)).to be_a Object
       end
    end
    
    describe 'get_messages' do
       it 'retrieves the messages for the user',  vcr: {cassette_name: :get_messages} do
         jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
         response = jewel.get_messages(ENV['MESSAGE_PAGE'])
         expect(response.instance_variable_get(:@message_data)).to be_a Object
       end
    end
    
    describe 'create_message' do
       it 'creates a new message',  vcr: {cassette_name: :create_message} do
         jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
         response = jewel.create_submission(ENV['SENDER'], ENV['RECIPIENT_ID'], nil, nil, nil)
         expect(response.instance_variable_get(:@create_message_data)).to be_a Object
       end
    end
    
    describe 'create_submission' do
       it 'submits a checkpoint',  vcr: {cassette_name: :create_submission} do
         jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
         response = jewel.create_submission(ENV['ENROLLMENT_ID'], ENV['CHECKPOINT_ID'], nil, nil, nil)
         expect(response.instance_variable_get(:@submission_data)).to be_a Object
       end
    end

    describe 'update_submission' do
       it 'updates a submitted a checkpoint',  vcr: {cassette_name: :update_submission} do
         jewel = Jewel.new(ENV['EMAIL'], ENV['PASSWORD'])
         response = jewel.update_submission(ENV['ID'])
         expect(response.instance_variable_get(:@update_data)).to be_a Object
       end
    end
end