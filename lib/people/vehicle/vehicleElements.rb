class Vehicle

    include Capybara::DSL
   
   def visit_vehicle
       visit 'https://autoteste.dimep-ams.com.br/Vehicles/VehiclesLst.aspx?src=person'
   end

 def fields_vehicle(placa, marca, cor, modelo)
    find('#MainContentMainMaster_vehicleEdtControl_txtPlaca').set placa
    find('#MainContentMainMaster_vehicleEdtControl_txtMarca').set marca
    find('#MainContentMainMaster_vehicleEdtControl_txtCor').set cor
    find('#MainContentMainMaster_vehicleEdtControl_txtModelo').set modelo
 end

 def allfields_vehicle(placa, marca, cor, modelo, numero, renavam, anoModelo, anoFabric, observacao)
    find('#MainContentMainMaster_vehicleEdtControl_txtPlaca').set placa
    find('#MainContentMainMaster_vehicleEdtControl_txtMarca').set marca
    find('#MainContentMainMaster_vehicleEdtControl_txtCor').set cor
    find('#MainContentMainMaster_vehicleEdtControl_txtModelo').set modelo
    find('#MainContentMainMaster_vehicleEdtControl_txtNumeroVeiculo').set numero
    find('#MainContentMainMaster_vehicleEdtControl_txtRenavam').set renavam
    find('#MainContentMainMaster_vehicleEdtControl_txtYearModel').set anoModelo
    find('#MainContentMainMaster_vehicleEdtControl_txtYearManufacture').set anoFabric
    find('#MainContentMainMaster_vehicleEdtControl_txtObservacao').set observacao
 end
 
def semPararFields(tag, digito, pessoa)
   find('#MainContentMainMaster_vehicleEdtControl_txtWithoutStopTag').set tag
   find('#MainContentMainMaster_vehicleEdtControl_txtWithoutStopTagDigVerif').set digito
   find('#MainContentMainMaster_vehicleEdtControl_ddlResponsiblePerson').select pessoa
end  

def semPararInformacoes(logradouro, numero, complemento, bairro, cidade, cep, uf)
   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_txtPublicPlace').set logradouro
   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_txtNumber').set numero
   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_txtComplement').set complemento
   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_txtNeighborhood').set bairro
   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_txtCity').set cidade
   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_txtCep').set cep
   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_ddlUf').select uf
end

end