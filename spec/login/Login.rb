class Login
  #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
  include Capybara::DSL

  def visitLoginNewAccess
    visit 'http://laboratorio.mdacesso.com.br/logon.aspx'
  end

  def receiveCorrectPass
    puts 'Digite a senha do usuário "admin": '
    correctPass = $stdin.gets.strip
    return correctPass.to_s
  end

  def makelogin(fieldlogin, fieldpassword)
    fill_in      'txtUsrLogin',      with: fieldlogin
    fill_in      'txtUserPassLogin', with: fieldpassword
    click_button 'Submit1'
  end
end