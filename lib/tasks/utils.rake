namespace :utils do

  #################################################################
  desc "Cria Administradores Fake"
  task generate_admins: :environment do
    puts "CRIANDO ADMINISTRADORES..."

    10.times do
      adm = Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email, 
        password: "1234567890", 
        password_confirmation: "1234567890",
        )
       adm.roles << Role.find_by_name("Admin")
    end

    puts "ADMINISTRADORES CADASTRADO COM SUCESSO!"
  end
#################################################################

end
