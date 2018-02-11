require_relative './../../spec_helper.rb'

describe LinkModule::ListService do
  before do
    @company = create(:company)
  end
  
  describe "#call" do
    context "List links" do
      before do
        @list_service = LinkModule::ListService.new({})
      end
      
      it "Not found links" do
        response = @list_service.call()
        expect(response).to match("Nada encontrado")
      end

      it "Response with all links" do
        links = []
        (1..5).each do
          links << create(:link, company: @company)
        end

        response = @list_service.call()

        (1..5).each do |i|
          expect(response).to match(links[i - 1].subject)
          expect(response).to match(links[i - 1].url)
        end
      end
    end

    context "Search links" do
      context "With valid query params" do
        it "Response with links" do
          word = FFaker::Lorem.word
          link = create(:link, subject: "#{FFaker::Lorem.phrase} #{word}", company: @company)
          @list_service = LinkModule::ListService.new({"query" => word})
          response = @list_service.call()
          expect(response).to match(link.subject)
        end
      end

      context "With empty query params" do
        it "Not found links" do
          @list_service = LinkModule::ListService.new({"query" => ""})
          response = @list_service.call()
          expect(response).to match("Nada encontrado")
        end
      end    
    end
  end
end