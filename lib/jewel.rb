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
  
  def get_messages (message_page=1)
    response = self.class.get(storage("message_threads?page=#{message_page}"), headers: {"authorization" => @auth_token})
    @message_data = JSON.parse(response.body)
  end

  def create_message (sender, recipient_id, subject, message)
    response = self.class.post(storage("messages/"), body: {"sender": sender_email, "recipient_id": recipient_id, "subject": subject, "stripped-text": message}, headers: {"authorization" => @auth_token })
    @create_message_data = JSON.parse(response.body)
  end 
  
  def create_submission (enrollment_id, checkpoint_id, assignment_branch, assignment_commit_link, comment)
    response = self.class.post(storage("checkpoints_submissions/"), body: {"checkpoint_id": checkpoint_id, "enrollment_id": enrollment_id, "assignment_branch": assignment_branch, "assignment_commit_link": assignment_commit_link, "comment": comment} headers: {"authorization" => @auth_token})
    @submission_data = JSON.parse(response.body)
  end

  def update_submission (id)
    response = self.class.get(storage("checkpoints_submissions/:#{id}"), headers: {"authorization" => @auth_token})
    @update_data = JSON.parse(response.body)
  end
  
  
  private
  def storage(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end
  
end

