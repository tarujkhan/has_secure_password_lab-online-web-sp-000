# require 'rails_helper'
# 
# RSpec.describe UsersController, type: :controller do
# 
#   let(:steven) {{name: 'Steven',
#             password: 'un1verse',
#             password_confirmation: 'un1verse'}}
# 
#   describe 'create' do
#     it "creates a new user" do
#       post :create, params: { user: steven }
#       expect(User.last.name).to eq('Steven')
#     end
# 
#     it "logs you in" do
#       post :create, params: { user: steven }
#       expect(session[:user_id]).to eq(User.last.id)
#     end
# 
#     it "sets your password if the confirmation matches" do
#       post :create, params: { user: steven }
#       expect(User.last.authenticate(steven[:password])).to eq(User.last)
#     end
# 
#     it "redirects you if your password and confirmation don't match" do
#       typo = steven.merge(password_confirmation: 'uni111verse')
#       post :create, params: { user: typo }
#       expect(response).to redirect_to(controller: 'users', action: 'new')
#     end
#   end
# end
require 'rails_helper'
RSpec.describe User, type: :model do
  it 'has a password field' do
    expect(User.new).to respond_to(:password)
  end
  it 'has a name field' do
    expect(User.new).to respond_to(:name)
  end
  it 'has a password confirmation field' do
    expect(User.new).to respond_to(:password_confirmation)
  end
  it 'is valid if password and password_confirmation match' do
    user = User.new
    user.password = user.password_confirmation = 'foo'
    expect(user.valid?).to be true    
  end
  it 'is valid if password is set and password_confirmation is nil' do
     user = User.new
     user.password = 'foo'
     expect(user.valid?).to be true 
  end
  it "is invalid if password and password_confirmation are both non-nil and don't match" do
    user = User.new
    user.password = 'foo'
    user.password_confirmation = 'fo0'
    expect(user.valid?).to be false
  end
  describe 'authenticate' do
    it 'returns the user if credentials match' do
      user = User.new
      user.password = 'foo'
      expect(user.authenticate('foo')).to eq(user)
    end
    it "returns falsey if credentials don't match" do
      user = User.new
      user.password = 'foo'
      expect(user.authenticate('fo0')).to be_falsey 
    end
  end
end