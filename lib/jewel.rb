require 'httparty'

class Jewel
  include HTTParty
  
  def initialize(email, password)
    response = self.class.post(storage("sessions"), body: {"email": email, "password": password})
    puts response.code
    raise "Error" if response.code == 404
    @auth_token = response["auth_token"]
  end
  
  def get_me
    response = self.class.get(storage("users/me"), headers: {"authorization" => @auth_token})
    @user_data = JSON.parse(response.body)
  end
  
  def get_mentor_availability (mentor_id)
    response = self.class.get(storage("mentors/#{mentor_id}/student_availability"), headers: {"authorization" => @auth_token})
    @mentor_data = JSON.parse(response.body)
  end
  
  def get_roadmaps (roadmap_id)
    response = self.class.get(storage("roadmaps/#{roadmap_id}"), headers: {"authorization" => @auth_token})
    @roadmap_data = JSON.parse(response.body)
  end
  
  def get_checkpoints (checkpoint_id)
    response = self.class.get(storage("checkpoints/#{checkpoint_id}"), headers: {"authorization" => @auth_token})
    @checkpoint_data = JSON.parse(response.body)
  end
  
  
  private
  def storage(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end
  
end

