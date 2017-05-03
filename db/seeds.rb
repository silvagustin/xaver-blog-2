# Eliminar todo ###############################################################
Post.delete_all
Usuario.delete_all

# Usuario #######################################################################
Usuario.create(email: "oby_lacueva@hotmail.com",
			   password: "gaspar",
			   password_confirmation: "gaspar")

Usuario.create(email: "xaver@hotmail.com",
			   password: "gaspar",
			   password_confirmation: "gaspar")

Usuario.create(email: "admin@hotmail.com",
			   password: "gaspar",
			   password_confirmation: "gaspar",
			   es_admin: true)

puts "USUARIOS CREADOS!"

# Posts #######################################################################
un_usuario = Usuario.find_by(email: "oby_lacueva@hotmail.com")
otro_usuario = Usuario.find_by(email: "xaver@hotmail.com")

6.times do
	Post.create(usuario: un_usuario,
						  titulo: Faker::Lorem.sentence,
					    descripcion: Faker::Lorem.sentence(20),
					    cuerpo: Faker::Lorem.paragraph(10))

	un_usuario, otro_usuario = otro_usuario, un_usuario
end


puts "POSTS CREADOS!"
