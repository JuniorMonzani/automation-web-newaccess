require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

describe 'Realiza testes de alteração de Grupo de equipamentos.', :editEquipmentGroup do
  login = Login.new
  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new
  
  before(:each) do
    equipmentGroup.visit_List_Equipment_Group
    login.make_Login('admin', $password.to_s)
  end

  context 'Valida os campos desabilitados na alteração de Grupo de Equipamento, são eles:' do
    it 'Número', :verifyFieldNumberDisabled do

    end
  end

end