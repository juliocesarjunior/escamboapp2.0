class Category < ApplicationRecord
	#Verifica se estar em branco descrição
	validates_presence_of :description
end
