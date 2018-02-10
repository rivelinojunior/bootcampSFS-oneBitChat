require_relative './../../spec_helper.rb'

describe LinkModule::CreateService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    context 'With valid params' do
      before do 
        @link = create(:link, company: @company)
        
        @createService = LinkModule::CreateService.new({ 
          "subject-original" => @link.subject, 
          "url-original" => @link.url 
        })
      end
      
      it "receive sucess message" do
        response = @createService.call()
        expect(response).to match("Criado com sucesso")  
      end

      it "create link in database" do
        expect(Link.last.url).to match(@link.url)
        expect(Link.last.subject).to match(@link.subject)
        expect(Link.last.company_id).to match(@link.company.id)
      end
    end

    context 'Without valid params' do
      before do
        @link = create(:link, company: @company)
      end

      it 'Only without subjetc params' do
        @link.subject = ""
        createService = LinkModule::CreateService.new({ 
          "subject-original" => @link.subject, 
          "url-original" => @link.url 
        })
        response = createService.call()
        expect(response).to match "Assunto Obrigatório"
      end

      it 'Only without url params' do
        @link.url = ""
        createService = LinkModule::CreateService.new({ 
          "subject-original" => @link.subject, 
          "url-original" => @link.url 
        })
      
        response = createService.call()
        expect(response).to match "URL Obrigatória"
      end
    end
  end
end
