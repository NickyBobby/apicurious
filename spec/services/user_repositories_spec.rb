require 'rails_helper'

describe NickHub do
  context "#repositories" do
    it "returns repositories" do
      VCR.use_cassette("nick_hub#repositories") do
        user = User.create(username: "NickyBobby")
        service = NickHub.new(user)
        repositories = service.get_repositories
        repository = repositories.first
        expect(repository[:name]).to eq("apicurious")
        expect(repository[:language]).to eq("HTML")
        expect(repositories.count).to eq(30)
      end
    end
  end
end
