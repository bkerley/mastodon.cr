require "../../spec_helper"

describe Mastodon::REST::Client do
  subject { Mastodon::REST::Client.new(url: "example.com") }

  it "is a Mastodon::REST::Client" do
    expect(subject).to be_a Mastodon::REST::Client
  end

  it ".user_agent is equal `mastodon.cr/<version>`" do
    expect(subject.user_agent).to eq "mastodon.cr/#{Mastodon::VERSION}"
  end

  describe "initialize without acckess token" do
    subject { Mastodon::REST::Client.new(url: "example.com") }

    it ".access_token is nil" do
      expect(subject.access_token?).to be_nil
    end
  end

  describe "initialize with acckess token string" do
    subject { Mastodon::REST::Client.new(url: "example.com", access_token: "TOKEN") }

    it ".access_token is a OAuth2::AccessToken::Bearer" do
      expect(subject.access_token?).to be_a OAuth2::AccessToken::Bearer
      expect(subject.access_token.access_token).to eq "TOKEN"
    end
  end

  describe "initialize with acckess token" do
    subject {
      bearer_token = OAuth2::AccessToken::Bearer.new(access_token: "TOKEN", expires_in: nil)
      Mastodon::REST::Client.new(url: "example.com", access_token: bearer_token)
    }

    it ".access_token is a OAuth2::AccessToken::Bearer" do
      expect(subject.access_token?).to be_a OAuth2::AccessToken::Bearer
      expect(subject.access_token.access_token).to eq "TOKEN"
    end
  end

  describe ".get(path, params)" do
    subject { Mastodon::REST::Client.new(url: "example.com") }

    describe "with no params" do
      before do
        WebMock.stub(:get, "https://example.com/get").to_return(body: "ok")
      end
      it "is valid" do
        expect(subject.get("/get")).to eq "ok"
      end
    end

    describe "with string params" do
      before do
        WebMock.stub(:get, "https://example.com/get?param1=1&param2=2").to_return(body: "ok")
      end
      it "is valid" do
        expect(subject.get("/get", "param1=1&param2=2")).to eq "ok"
      end
    end

    describe "with hash params" do
      before do
        WebMock.stub(:get, "https://example.com/get?param1=1&param2=2").to_return(body: "ok")
      end
      it "is valid" do
        expect(subject.get("/get", { "param1" => "1", "param2" => "2" })).to eq "ok"
      end
    end
  end

end
