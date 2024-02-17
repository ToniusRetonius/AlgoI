import Test.HUnit
import Solucion

-- Caso de testeo main:

main = runTestTT todosLosTest

todosLosTest = test [testSuite_Ej1, testSuite_Ej2, testSuite_Ej3, testSuite_Ej4, testSuite_Ej5, testSuite_Ej6, testSuite_Ej7, testSuite_Ej8, testSuite_Ej9, testSuite_Ej10]

-- Casos de testeo por ejercicio:

run1 = runTestTT testSuite_Ej1
run2 = runTestTT testSuite_Ej2
run3 = runTestTT testSuite_Ej3
run4 = runTestTT testSuite_Ej4
run5 = runTestTT testSuite_Ej5
run6 = runTestTT testSuite_Ej6
run7 = runTestTT testSuite_Ej7
run8 = runTestTT testSuite_Ej8
run9 = runTestTT testSuite_Ej9
run10 = runTestTT testSuite_Ej10

testSuite_Ej1 = test [
    " Caso 1: red no vacia" ~: (nombresDeUsuarios redA) ~?= ["Toto","Rodri","Tincho","Vlad","Paula"],
    " Caso 2: red vacia" ~: (nombresDeUsuarios redVacia) ~?= [],
 
    " Caso 3: lista de usuarios no vacia" ~: (proyectarNombres usuariosA) ~?= ["Toto","Rodri","Tincho","Vlad","Paula"],
    " Caso 4: lista de usuarios vacía" ~: (proyectarNombres usuariosVacia) ~?= []  
    ]

testSuite_Ej2 = test [
    " Caso 1: usuario con amigos" ~: (amigosDe redA usuario1) ~?= [usuario2, usuario5],
    " Caso 2: usuario sin amigos" ~: (amigosDe redB usuario5) ~?= [] 
    ]

testSuite_Ej3 = test [
    " Caso 1: cantidad de amigos > 0" ~: (cantidadDeAmigos redA usuario2) ~?= 3,
    " Caso 2: cantidad de amigos = 0" ~: (cantidadDeAmigos redB usuario5) ~?= 0 
    ]

testSuite_Ej4 = test [
    " Caso 2: red con un solo usuario " ~: (usuarioConMasAmigos redG) ~?= usuario1,
    " Caso 1: el maximo puede tomar 1 valor " ~: (usuarioConMasAmigos redA) ~?= usuario2,
    " Caso 3: el máximo puede tomar 2 valores" ~: expectAny (usuarioConMasAmigos redB) [usuario1, usuario2], 
    " Caso 4: el máximo puede tomar 3 valores" ~: expectAny (usuarioConMasAmigos redE) [usuario1, usuario2, usuario3] 
    ]

testSuite_Ej5 = test [
    " Caso 1: red vacia" ~: (estaRobertoCarlos redVacia) ~?= False,
    " Caso 2: tiene menos de 10 amigos" ~: (estaRobertoCarlos redA) ~?= False,
    " Caso 3: tiene exactamente 10 amigos" ~: (estaRobertoCarlos redH) ~?= False,
    " Caso 4: tiene más de 10 amigos" ~: (estaRobertoCarlos redF) ~?= True
    ]

testSuite_Ej6 = test [
    " Caso 1: otros realizaron publicaciones, el usuario realizó más de 1 publicación" ~: (publicacionesDe redB usuario1) ~?= [pub1_3, pub1_4, pub1_5],
    " Caso 2: otros realizaron publicaciones, el usuario realizó 1 publicación" ~: (publicacionesDe redC usuario4) ~?= [pub4_2],
    " Caso 3: otros realizaron publicaciones, el usuario no realizó publicaciones" ~: (publicacionesDe redC usuario2) ~?= [], 
    " Caso 4: otros no realizaron publicaciones, el usuario sí realizó publicaciones" ~: (publicacionesDe redI usuario1) ~?= [pub1_1],
    " Caso 5: otros no realizaron publicaciones, el usuario no realizó publicaciones" ~: (publicacionesDe redF usuario1) ~?= []
    ]

testSuite_Ej7 = test [
    " Caso 1 : al usuario le gustan publicaciones" ~: (publicacionesQueLeGustanA redC usuario9) ~?= [pub1_6,pub2_6,pub3_6,pub1_8,pub3_8, pub1_9,pub2_9,pub2_10,pub3_10],
    " Caso 2 : al usuario no le gusta ninguna publicación" ~: (publicacionesQueLeGustanA redB usuario1) ~?= [],
    " Caso 3 : el usuario se da like dos veces a sí mismo" ~: (publicacionesQueLeGustanA redD usuario13) ~?= [pub2_11, pub1_12, pub3_13]
    ]
    
testSuite_Ej8 = test [
    " Caso 1: u1 = u2" ~: (lesGustanLasMismasPublicaciones redJ usuario2 usuario2) ~?= True,
    " Caso 2: u1 /= u2, u1 likeo publicaciones, u2 no" ~: (lesGustanLasMismasPublicaciones redJ usuario5 usuario1) ~?= False,
    " Caso 3: u1 /= u2, u2 likeo publicaciones, u1 no"~: (lesGustanLasMismasPublicaciones redJ usuario1 usuario5)  ~?= False,
    " Caso 4: u1 /= u2, ninguno likeo publicaciones" ~: (lesGustanLasMismasPublicaciones redJ usuario1 usuario3) ~?= True,
    " Caso 5: u1 /= u2, los dos likearon distintas publicaciones" ~: (lesGustanLasMismasPublicaciones redA usuario1 usuario3) ~?= False,
    " Caso 6: u1 /= u2, los dos likearon las mismas publicaciones" ~: (lesGustanLasMismasPublicaciones redB usuario1 usuario3) ~?= True
    ]

testSuite_Ej9 = test [
    " Caso 1: tiene seguidor fiel" ~: (tieneUnSeguidorFiel redA usuario1) ~?= True,
    " Caso 2: no tiene seguidor fiel" ~: (tieneUnSeguidorFiel redB usuario3) ~?= False,
    " Caso 3: es seguidor fiel de si mismo" ~: (tieneUnSeguidorFiel redJ usuario14) ~?= False,
    " Caso 4: no tiene publicaciones" ~: (tieneUnSeguidorFiel redI usuario2) ~?= False,
    " Caso 5: unico usuario" ~: (tieneUnSeguidorFiel redG usuario1) ~?= False
    ]

testSuite_Ej10 = test [
    " Caso 1: existe secuencia" ~: (existeSecuenciaDeAmigos redA usuario1 usuario3) ~?= True,
    " Caso 2: no existe secuencia" ~: (existeSecuenciaDeAmigos redB usuario1 usuario5) ~?= False,
    " Caso 3: simetría1" ~: (existeSecuenciaDeAmigos redC usuario8 usuario10) ~?= True,
    " Caso 4: simetría2" ~: (existeSecuenciaDeAmigos redC usuario10 usuario8) ~?= True,
    " Caso 5: secuencia larga" ~: (existeSecuenciaDeAmigos redD usuario1 usuario13) ~?= True,
    " Caso 6: secuencia larga falsa" ~: (existeSecuenciaDeAmigos redD usuario1 usuario14) ~?= False,   
    " Caso 7: ui = uf" ~: (existeSecuenciaDeAmigos redA usuario1 usuario1) ~?= False
    ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

-- Definimos -- 
usuario1 = (1, "Toto")
usuario2 = (2, "Rodri")
usuario3 = (3, "Tincho")
usuario4 = (4, "Vlad")
usuario5 = (5, "Paula")
usuario6 = (6,"usuario6")
usuario7 = (7,"usuario7")
usuario8 = (8,"usuario8")
usuario9 = (9,"usuario9")
usuario10 = (10,"usuario10")
usuario11 = (11,"usuario11")
usuario12 = (12,"usuario12")
usuario13 = (13,"usuario13")
usuario14 = (14,"usuario14")

rel1_2 = (usuario1, usuario2)
rel1_3 = (usuario1, usuario3)
rel1_4 = (usuario1, usuario4)
rel1_5 = (usuario1, usuario5)
rel1_6 = (usuario1, usuario6)
rel1_7 = (usuario1, usuario7)
rel1_8 = (usuario1, usuario8)
rel1_9 = (usuario1, usuario9)
rel1_10 = (usuario1, usuario10)
rel1_11 = (usuario1, usuario11)
rel1_12 = (usuario1, usuario12)
rel3_2 = (usuario3, usuario2)
rel2_4 = (usuario2, usuario4)
rel2_5 = (usuario2, usuario5)
rel3_4 = (usuario4, usuario3)
rel3_5 = (usuario5, usuario3)
rel5_4 = (usuario4, usuario5)
rel5_6 = (usuario5, usuario6)
rel6_7 = (usuario6,usuario7)
rel7_8 = (usuario7,usuario8)
rel6_8 = (usuario6,usuario8)
rel6_9 = (usuario6,usuario9)
rel8_9 = (usuario8,usuario9)
rel9_10 = (usuario9,usuario10)
rel9_11 = (usuario9,usuario11)
rel10_12 = (usuario10,usuario12)
rel10_11 = (usuario10, usuario11)
rel11_12 = (usuario11, usuario12)
rel11_13 = (usuario11,usuario13)
rel12_13 = (usuario12,usuario13)

pub1_1 = (usuario1, "Este es mi primer post", [usuario2, usuario4])
pub1_2 = (usuario1, "Este es mi segundo post", [usuario4])
pub1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
pub1_4 = (usuario1, "Este es mi cuarto post", [])
pub1_5 = (usuario1, "Este es como mi quinto post", [usuario5])
pub2_1 = (usuario2, "esto es parte del test", [usuario4])
pub2_2 = (usuario2, "el test dio 0 Failures", [usuario1, usuario4])
pub3_1 = (usuario3, "Lorem Ipsum", [])
pub3_2 = (usuario3, "dolor sit amet", [usuario2])
pub3_3 = (usuario3, "texto de relleno", [usuario2, usuario5])
pub4_1 = (usuario4, "Denle like", [usuario1, usuario2])
pub4_2 = (usuario4, "No le den like", [])
pub4_3 = (usuario4, "hola", [usuario1, usuario3])
pub1_6 = (usuario6, "1er pub", [usuario6, usuario7, usuario8 , usuario9]) 
pub2_6 = (usuario6, "2da pub", [usuario7, usuario8 , usuario9])
pub3_6 = (usuario6, "3ra pub", [usuario8 , usuario9])
pub1_7 = (usuario7, "1er pub", []) 
pub1_8 = (usuario8, "1er pub", [usuario8 , usuario9])
pub2_8 = (usuario8, "2da pub", [usuario6, usuario7, usuario8 , usuario10])
pub3_8 = (usuario8, "3ra pub", [usuario7, usuario9])
pub1_9 = (usuario9, "1er pub", [usuario7, usuario9 , usuario10])
pub2_9 = (usuario9, "2da pub", [usuario8 , usuario9])
pub1_10 = (usuario10, "1er pub", [usuario6, usuario7])
pub2_10 = (usuario10, "2da pub", [usuario6, usuario9 , usuario10])
pub3_10 = (usuario10, "3ra pub", [usuario6, usuario7, usuario9 , usuario10])
pub1_11 = (usuario11, "1er pub", [usuario7, usuario9 , usuario10, usuario11 , usuario12])
pub2_11 = (usuario11, "2da pub", [usuario8 , usuario9, usuario10 , usuario13])
pub1_12 = (usuario12, "1er pub", [usuario6, usuario10 , usuario13])
pub2_12 = (usuario12, "2da pub", [usuario8, usuario9 , usuario10])
pub3_12 = (usuario12, "3ra pub", [usuario6, usuario7, usuario9 , usuario10])
pub1_13 = (usuario13, "1er pub", [usuario6, usuario7 , usuario12])
pub2_13 = (usuario13, "2da pub", [usuario6 , usuario12])
pub3_13 = (usuario13, "3ra pub", [usuario6, usuario13 , usuario13]) 
pub1_14 = (usuario14, "1er pub", [usuario14])
pub2_14 = (usuario14, "2da pub", [usuario14])

usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5]
relesA = [rel1_2, rel3_2, rel2_4, rel3_4, rel1_5]
pubA = [pub1_1, pub1_2, pub2_1, pub2_2, pub3_1, pub3_2, pub4_1, pub4_2]
redA = (usuariosA, relesA, pubA)

usuariosB = [usuario1, usuario2, usuario3, usuario5]
relesB = [rel1_2, rel3_2]
pubB = [pub1_3, pub1_4, pub1_5, pub3_1, pub3_2, pub3_3]
redB = (usuariosB, relesB, pubB)

usuariosC = [usuario6,usuario7,usuario8,usuario9,usuario10] 
relC = [rel6_7,rel6_8,rel6_9,rel8_9,rel9_10]
pubC = [pub1_6,pub2_6,pub3_6,pub1_7,pub1_8,pub2_8,pub3_8,pub1_9,pub2_9,pub1_10,pub2_10,pub3_10, pub4_2]
redC = (usuariosC,relC,pubC)

usuariosD = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12, usuario13, usuario14]
relD = [rel1_2, rel3_2, rel3_4, rel5_4, rel5_6, rel6_7, rel7_8, rel8_9, rel9_10, rel10_11, rel11_12, rel12_13]
pubD = [pub1_6,pub2_6,pub3_6,pub1_7,pub1_8,pub2_8,pub3_8,pub1_9,pub2_9,pub1_10,pub2_10,pub3_10,pub1_11,pub2_11,pub1_12,pub2_12,pub3_12,pub1_13,pub2_13, pub4_1, pub3_13]
redD = (usuariosD,relD,pubD)

usuariosE = [usuario1, usuario2, usuario3, usuario4]
relE = [rel1_2, rel1_3, rel3_2]
pubE = [pub1_1, pub1_2]
redE = (usuariosE,relE,pubE)

usuariosF = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12]
relF = [rel1_2, rel1_3, rel1_4, rel1_5, rel1_6, rel1_7, rel1_8, rel1_9, rel1_10, rel1_11, rel1_12]
pubF = []
redF = (usuariosF, relF, pubF)

usuariosG = [usuario1]
relG = []
pubG = []
redG = (usuariosG, relG, pubG)

usuariosH = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12]
relH = [rel1_2, rel1_3, rel1_4, rel1_5, rel1_6, rel1_7, rel1_8, rel1_9, rel1_10, rel1_11]
pubH = []
redH = (usuariosH, relH, pubH)

usuariosI = [usuario1, usuario2, usuario3]
relI = [rel1_2, rel1_3, rel3_2]
pubI = [pub1_1]
redI = (usuariosI,relI,pubI)

usuariosJ = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario14]
relJ = [rel1_2, rel1_3]
pubJ = [pub1_1, pub3_3, pub1_3, pub1_14, pub2_14]
redJ = (usuariosJ,relJ,pubJ)

usuariosVacia = []
relVacia = []
pubVacia = []
redVacia = ([],[],[])