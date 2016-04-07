require 'rails_helper'

describe NickHub do
  context "#repositories" do
    it "returns repositories" do
      VCR.use_cassette("nick_hub#repositories") do
        service = NickHub.new
        user = User.create(username: "NickyBobby")
        repositories = service.get_repositories(user)
        repository = repositories.first
        expect(repository[:name]).to eq("apicurious")
        expect(repository[:language]).to eq("HTML")
        expect(repositories.count).to eq(30)
      end
    end
  end
end
