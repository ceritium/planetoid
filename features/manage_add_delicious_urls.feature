Característica: Editar el delicious del usuario
  Para editar el vinculo al delicious de cada miembro
  como admin
  quiero ver un campo en la edición del usuario para poder editarlo
  

  Escenario: Un admin debe ver el campo del usuario de Delicious
    Dado que soy admin
    Y que existe existe un miembro 'ceritium'
    Entonces voy a editar al usuario ceritium
    Y relleno 'delicious user' con 'ceritium'
    Y presiono "Update"
    Entonces el delicious_user de 'ceritium' debería ser 'ceritium'
    
    
  Escenario: Un visitante debe ver el Delicious de un usuario si lo tiene configurado
    Dado que existe existe un miembro 'ceritium'
    Y voy a show de ceritium
    Entonces debería ver "delicious.com/ceritium"