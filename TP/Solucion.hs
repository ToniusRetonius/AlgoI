module Solucion where
-- Nombre de Grupo: StackOverflow
-- Integrante 1: Martin Comellas, martin@comellas.org, 557/22
-- Integrante 2: Rodrigo Quirino Costa, rodrigoquirinocosta@gmail.com , 595/22
-- Integrante 3: Tomas Felipe Melli, tomas.melli1@gmail.com, 371/22
-- Integrante 4: Vladimir Kannemann, vladimirkannemann@gmail.com , 460/22

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

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

-- Ejercicios

-- (1) la función recibe una tupla RedSocial y retorna una lista de los nombres de los usuarios que la componen 
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = proyectarNombres (usuarios red)

-- (1) la función recibe una lista de usarios de la forma [(id, nombre), ...] y retorna una lista de los nombres de los usuarios en el orden en que ingresaron
proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres ((id, nombre):us) = nombre : proyectarNombres us

-- (2) la función recibe una red social y un usuario y retorna una lista de todos los amigos del usuario ingresado
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (_,[], _) _ = []
amigosDe (us, ((u1,u2):rs), ps) u
    | u == u1 = u2 : amigosDe (us, rs, ps) u
    | u == u2 = u1 : amigosDe (us, rs, ps) u
    | otherwise = amigosDe (us, rs, ps) u 

-- (3) la función recibe una red social y un usuario y devuelve la cantidad de amigos que tiene el usuario ingresado
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = length (amigosDe red u)

-- (4) la función recibe una red y devuelve el usuario con la mayor cantidad de amigos
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ((u:[]), rs, ps) = u
usuarioConMasAmigos ((u:us), rs, ps)
    | cantidadDeAmigos ((u:us), rs, ps) u >= cantidadDeAmigos ((u:us), rs, ps) (head us) = usuarioConMasAmigos ((u:(tail us)), rs, ps)
    | otherwise = usuarioConMasAmigos (us, rs, ps)

-- (5) la función revisa si la cantidad de amigos del usuario con mayor cantidad de amigos es mayor a 10
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = cantidadDeAmigos red (usuarioConMasAmigos red) > 10 

-- (6) la función recibe una redSocial y un usuario y devuelve las publicaciones realizadas por el usuario ingresado
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (us, rs, []) _ = []
publicacionesDe (us, rs, (p:ps)) u
    | u == (usuarioDePublicacion p) = p : publicacionesDe (us, rs, (ps)) u
    | otherwise = publicacionesDe (us, rs, (ps)) u

-- (7) la función recibe una RedSocial y un usuario, a partir de ello va recopilando aquellas publicaciones que el usuario ha likeado
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (us, rs, []) _ = []
publicacionesQueLeGustanA (us, rs, (p:ps)) u 
    | leGustaAUsuario u p == True = p : publicacionesQueLeGustanA (us, rs, ps) u
    | otherwise = publicacionesQueLeGustanA (us, rs, ps) u

-- (7) la función recibe un usuario y una publicación y verifica si le ha dado like  
leGustaAUsuario :: Usuario -> Publicacion -> Bool
leGustaAUsuario u (a, s, l)
    | l == [] = False
    | u == head l = True
    | otherwise = leGustaAUsuario u (a, s, (tail l))

-- (8) la función recibe una RedSocial y DOS usuarios. Mediante un valor de verdad verifica si a ambos usuarios les gustan las mismas publicaciones 
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones (us, rs, []) _ _ = True
lesGustanLasMismasPublicaciones (us, rs, (p:ps)) u1 u2 
    | (leGustaAUsuario u1 p == True) && (leGustaAUsuario u2 p == True) = lesGustanLasMismasPublicaciones (us, rs, ps) u1 u2
    | (leGustaAUsuario u1 p == False) && (leGustaAUsuario u2 p == False) = lesGustanLasMismasPublicaciones (us, rs, ps) u1 u2
    | otherwise = False

-- (9) la función recibe una red social y un usuario1 y devuelve True si algun otro usuario2 de la red likeo todas las publicaciones del usuario1
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red@((u:[]),r,p) u1 = esSeguidorFiel (publicacionesDe red u1) u1 u
tieneUnSeguidorFiel red@((u:us),r,p) u1 
    | esSeguidorFiel (publicacionesDe red  u1) u1 u == False = tieneUnSeguidorFiel (us,r,p) u1
    | otherwise = True

-- (9) se fija si un usuario2 likeo todas las publicaciones de un usuario1. 
-- vamos a asumir que la lista de publicaciones es aquella de todas las publicaciones del usuario1
-- no vale ser seguidor fiel de uno mismo y por tanto se define como False
esSeguidorFiel :: [Publicacion] -> Usuario -> Usuario -> Bool
esSeguidorFiel [] u1 u2 = False
esSeguidorFiel _ u1 u2 | u1 == u2 = False
esSeguidorFiel (p:[]) u1 u2 = leGustaAUsuario u2 p
esSeguidorFiel (p:ps) u1 u2 
    | leGustaAUsuario u2 p == True = True && esSeguidorFiel ps u1 u2
    | otherwise = False

-- (10) la función recibe una red social, un usuario inicial y un usuario final, y devuelve True si existe una secuencia de amistades que conecta al usuario inicial con el usuario final, y False en caso contrario.
-- conceptualmente es : si existe un grafo - flecha que conecte al usuario i con el usuario f tomando como punto de partida al usuario i. Pasando por todos los vínculos existentes entre usuario i, sus amigos y los amigos de sus amigos. 
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red ui uf 
    | ui == uf = False
    | otherwise = existeSecuenciaDeAmigosAux red ui uf []

-- (10) la funcion utiliza un "acumulador" llamado <visitados> para llevar un registro de los usuarios visitados hasta el momento.
-- Es importante destacar que esta función revisa si un usuario (amigo de ui) es igual al usuario final y en caso de no serlo, lo agrega a la lista de <visitados>
existeSecuenciaDeAmigosAux :: RedSocial -> Usuario -> Usuario -> [Usuario] -> Bool
existeSecuenciaDeAmigosAux red u1 uf visitados 
    | u1 == uf = True
    | elem u1 visitados = False
    | otherwise = buscarSecuencia red amigos uf (u1:visitados)
        where amigos = amigosDe red u1
        
-- (10) Se encarga de buscar una secuencia de amigos que conecte al usuario inicial con el usuario final, probando con cada amigo de ui hasta encontrar una solucion o agotar todas las posibilidades.
-- la funcion recibe una red social, una lista de usuarios (que son los amigos de un usuario), el usuario que finaliza la secuencia y <visitados> 
buscarSecuencia :: RedSocial -> [Usuario] -> Usuario -> [Usuario] -> Bool
buscarSecuencia red [] uf visitados = False
buscarSecuencia red (a:amigos) uf visitados
    | existeSecuenciaDeAmigosAux red a uf visitados = True
    | otherwise = buscarSecuencia red amigos uf visitados