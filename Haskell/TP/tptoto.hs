type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

--RedSocial  ([(1,"usuario1"), (2,"usuario2")], [((1,"usuario1"), (1,"usuario2"))], [((1,"usuario1"), "los posteos van aca", [(1,"usuario1")])])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- EJEMPLOS --
usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Pedro")
usuario4 = (4, "Mariela")
usuario5 = (5, "Natalia")

relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario4, usuario1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 = (usuario2, usuario4)
relacion3_4 = (usuario4, usuario3)

publicacion1_1 = (usuario1, "Este es mi primer post", [usuario2, usuario4])
publicacion1_2 = (usuario1, "Este es mi segundo post", [usuario4])
publicacion1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
publicacion1_4 = (usuario1, "Este es mi cuarto post", [])
publicacion1_5 = (usuario1, "Este es como mi quinto post", [usuario5])

publicacion2_1 = (usuario2, "Hello World", [usuario4])
publicacion2_2 = (usuario2, "Good Bye World", [usuario1, usuario4])

publicacion3_1 = (usuario3, "Lorem Ipsum", [])
publicacion3_2 = (usuario3, "dolor sit amet", [usuario2])
publicacion3_3 = (usuario3, "consectetur adipiscing elit", [usuario2, usuario5])

publicacion4_1 = (usuario4, "I am Alice. Not", [usuario1, usuario2])
publicacion4_2 = (usuario4, "I am Bob", [])
publicacion4_3 = (usuario4, "Just kidding, i am Mariela", [usuario1, usuario3])


usuariosA = [usuario1, usuario2, usuario3, usuario4]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]
redB = (usuariosB, relacionesB, publicacionesB)

-- Ejercicio 1 -- 

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios (u,r,p) =  returnNombre u

returnNombre :: [Usuario] -> [String]
returnNombre [] = []
returnNombre (x:xs) = snd x : returnNombre xs 

-- Ejercicio 2 -- 

-- quiero retornar aquellos usuarios tales q el usuario pasado por consola mantenga una relacion --
-- me dibujo el tipo de dato con el q voy a trabajar [Relacion] = [(usuarioX, usuarioY),....(usuarioZ,usuarioZZ)]
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (u, [], p) user = [] 
amigosDe (u, r:rs, p) user | fst r == user = snd r : amigosDe (u, rs, p) user
                           | snd r == user = fst r : amigosDe (u, rs, p) user
                           | otherwise = amigosDe (u, rs, p) user
                          
-- Ejercicio 3 -- 

-- tomo una redS y quiero ver la cantidad de amigos de un usuario
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos (u,r,p) user = length (amigosDe (u,r,p) user)
 
-- Ejercicio 4 -- 
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos (u,r,p) | cantidadDeAmigos (u,r,p) (head u) > cantidadDeAmigos (u,r,p) (head (tail u))  = head u 
                            | otherwise = usuarioConMasAmigos ((tail u),r,p) 

-- Ejercicio 5 -- 

estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos (u,r,p) | cantidadDeAmigos (u,r,p) (usuarioConMasAmigos (u,r,p)) > 100000 = True
                          | otherwise = False

-- Ejercicio 6 -- 

-- quiero una funcion q me devuelva las publicaciones del usuario pasado por consola -- 
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (u, r, []) _ = []
publicacionesDe (u,r,(p:ps)) user | user == (usuarioDePublicacion p) = p : (publicacionesDe (u,r,ps) user)
                                  | otherwise = publicacionesDe (u,r,ps) user

-- Ejercicio 7 -- 
-- la función recibe una RedSocial y un usuario, a partir de ello va recopilando aquellas publicaciones que el usuario ha likeado
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (u, r, (p:ps)) user | head (likesDePublicacion p) == user = p : publicacionesQueLeGustanA (u, r, ps) user
                                              | otherwise = publicacionesQueLeGustanA (u, r, ps) user

-- Ejercicio 8 -- 
-- la función recibe una RedSocial y DOS usuarios. Mediante un valor de verdad verifica si a ambos usuarios les gustan las mismas publicaciones 
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 | publicacionesQueLeGustanA red u1 == publicacionesQueLeGustanA red u2 = True
                                          | otherwise = False

-- Ejercicio 9 -- 
-- la función recibe una red social y un usuario1 y devuelve True si algun otro usuario2 de la red likeo todas las publicaciones del usuario1
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red user1 | 
-- Ejercicio 10 -- 
-- existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
-- existeSecuenciaDeAmigos red ui uf | 
-- existeSecuenciaDeAmigos red ui uf | elem uf amigos == True = True
--                                   | otherwise = existeSecuenciaDeAmigos red (head amigos) uf 
--                                   where amigos = amigosDe red ui 

