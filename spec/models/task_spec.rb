require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "creation" do 
    before do
      @user = User.create!(email: "ahmad@kafaei.co.uk", 
      username: "ahmad",
      password: "aaaaaa", 
      password_confirmation: "aaaaaa")

      @user2 = User.create!(email: "amdkfe@gmail.com", 
      username: "kafaei",
      password: "bbbbbb", 
      password_confirmation: "bbbbbb")

      @task = Task.create(title: 'wash my car', desc: 'can someone come and wash my car', 
      points: 20, duration: Date.tomorrow, created_at: Date.today, status: 'open', address: '23 london',
      latitude: 51.762520, longitude: -0.017755, user_id: @user.id )
    end

    it "can be created" do
      expect(@task).to be_valid
    end

    it "cannot be created without user_id, latitude, longitude, created_at, duration, points, status & title" do
      @task.user_id = nil
      @task.points = nil
      @task.latitude = nil
      expect(@task).to_not be_valid
    end
  end
end
