require 'rails_helper'

RSpec.describe "Users", type: :request do

  user = FactoryBot.create(:user)
  before do
      auth_token = JsonWebToken.encode(user_id: user.id)
      @headers = {
        "Authorization" => auth_token,
        "Content-Type" => "application/json"
      }
  end
  
  describe  'Post create' do
    it 'return status 200 ' do
          post users_path,  params: {name: user.name , username: user.username , password: user.password, email: user.email}
          
          expect(response).to have_http_status(200)
        
    end
  end

  describe "get #index " do
    it 'return status 200' do
      get users_path, headers: @headers
      expect(response).to have_http_status(200)
    end
  end




  describe "show user " do
    it 'return status 200 ' do
      get "/users/#{user.id}",  headers:  @headers 
      expect(response).to have_http_status(200)
      puts response.body
    
    end

  end
 
  describe "update  user " do
    let(:request_params) do
      {
          name: "rahul",
          username: "r123",
          password: "6565"
        }
    end
    it 'return status 200 ' do
      put "/users/#{user.id}",   headers: @headers , params: request_params.to_json
      expect(response).to have_http_status(200)
      puts response.body
    
    end
   end


  describe "delete user " do
    it 'return status 200' do
     byebug
     delete "/users/#{user.id}" , headers: @headers
     expect(response).to have_http_status(200)
     puts response.body
    
    end

  end

end
