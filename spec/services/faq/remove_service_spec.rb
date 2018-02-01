require_relative './../../spec_helper.rb'

describe FaqModule::RemoveService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    context "With valid ID" do
      before do 
        faq = create(:faq, company: @company)
        @removeService = FaqModule::RemoveService.new({"id" => faq.id})
        @response = @removeService.call()
      end

      it "message remove Faq " do
        expect(@response).to match("Deletado com sucesso")
      end

      it "remove Faq from database" do
        expect(Faq.all.count).to eq(0)
      end
    end

    context "With invalid ID" do
      it "receive error message" do
        @removeService = FaqModule::RemoveService.new({"id" => rand(1..9999)})
        response = @removeService.call()
        expect(response).to match("Questão inválida, verifique o Id")
      end
    end 
   end
end