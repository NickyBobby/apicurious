require 'rails_helper'

describe NickHub do
  context "#user_info" do
    it "returns user info" do
      VCR.use_cassette("nick_hub#user_info") do
        service = NickHub.new
        user = User.create(username: "NickyBobby")
        user_info = service.get_user_info(user)
        expect(user_info[:login]).to eq("NickyBobby")
        expect(user_info[:name]).to eq("Nicholas")
        expect(user_info[:public_gists]).to eq(9)
        expect(user_info[:followers]).to eq(9)
        expect(user_info[:following]).to eq(16)
        expect(user_info[:location]).to eq("Denver, CO")
        expect(user_info[:hireable]).to eq(nil)
      end
    end
  end
end
