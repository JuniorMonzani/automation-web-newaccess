require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

describe 'Realiza testes de busca e exclusão na página que lista os Grupos de equipamentos.', :listEquipmentGroup do
  login = Login.new
  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new
  
  before(:each) do
        equipmentGroup.visit_List_Equipment_Group
        login.make_Login('admin', $password.to_s)
    end

    context 'Realizando testes na busca por Grupo de Equipamento:' do
        it 'Valida os valores contidos no filtro de pesquisa.', :verifyValuesFilterSearchEquipmentGroup do
            
            #desmarcando o checkbox de 10 últimas atualizações
            uncheck('MainContentMainMaster_chkLastTenModified')
            
            sleep 5
        end
    end
end
