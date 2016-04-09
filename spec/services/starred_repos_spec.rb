require 'rails_helper'

describe NickHub do
  context "#starred_repos" do
    it "returns starred repos" do
      VCR.use_cassette("nick_hub#starred_repos") do
        user = User.create(username: "NickyBobby")
        service = NickHub.new(user)
        starred_repos = service.get_starred_repos
        starred_repo = starred_repos.first[:owner]
        expect(starred_repo[:login]).to eq("ShannonPaige")
        expect(starred_repos.first[:name]).to eq("comic-db")
        expect(starred_repos.count).to eq(1)
      end
    end
  end
end
