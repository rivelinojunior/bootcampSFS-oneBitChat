module LinkModule
  class RemoveService
    def initialize(params)
      @id = params['id']
    end

    def call
      begin
        @link = Link.find @id
      rescue
        return 'Link inválido, verifique o ID'
      end

      begin
        @link.destroy
        'Deletado com sucesso'
      rescue
        'Problemas ao deletar o link'
      end
    end
  end
end
