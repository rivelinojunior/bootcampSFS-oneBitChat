require_relative './../../spec_helper.rb'

describe LinkModule::RemoveService do

  describe "#call" do
    context "With valid ID" do
      before do
        link = create :link
        remove_service = LinkModule::RemoveService.new({"id" => link.id})
        @response = remove_service.call()
      end

      it "message with sucesso" do 
        expect(@response).to match("Deletado com sucesso")
      end

      it "link removed of database" do
        expect(Link.all.count).to eq(0)
      end
    end

    context "With invalid ID" do
      it "receive error message" do
        remove_service = LinkModule::RemoveService.new({"id" => rand(1..999)})
        response = remove_service.call()
        expect(response).to match("Link inválido, verifique o ID")
      end
    end
  end
end