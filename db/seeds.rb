# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

############### CATEGORIAS ###############
puts "CRIANDO CATEGORIAS..."


categories = [ "Animais e acessórios" ,
               "Esportes" ,
               "Para a sua casa" ,
               "Eletrônicos e celulares" ,
               "Música e hobbies" ,
               "Bebês e crianças" ,
               "Moda e beleza" ,
               "Veículos e barcos" ,
               "Imóveis" ,
               "Empregos e negócios" ]

categories.each do |category|
  Category.find_or_create_by(description: category)
end

puts "CATEGORIAS CADASTRADOS COM SUCESSO!"

############### FIM ###############

############### Roles ###############

puts "Cadastrando o ROLES Padrão..."


roles = [ "SuperAdmin" ,
               "Admin",
               "NewUser"  ]

roles.each do |role|
  Role.find_or_create_by(name: role)
end

puts "ROLES CADASTRADO COM SUCESSO!"

############### FIM ###############


############### ADMIN ###############

puts "Cadastrando o Administrador Padrão..."


adm = Admin.create(
  name: "Administrador Geral",
  email: "admin@admin.com", 
  password: "1234567890", 
  password_confirmation: "1234567890",
  )
adm.roles << Role.first


puts "ADMINISTRADOR CADASTRADO COM SUCESSO!"

############### FIM ###############

############### ADMIN ###############

# puts "Cadastrando o Administrador Padrão..."


# Admin.create(
#   name: "Administrador Geral",
#   email: "admin@admin.com", 
#   password: "1234567890", 
#   password_confirmation: "1234567890",
#   roles: 
#   )


# puts "ADMINISTRADOR CADASTRADO COM SUCESSO!"

############### FIM ###############