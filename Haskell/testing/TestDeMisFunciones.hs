module TestDeMisFunciones where

import Test.HUnit
import MultiplosDeN

-- Casos de Testo

run = runTestTT testSuite1Impl1
run2 = runTestTT testSuite1Impl2
run3 = runTestTT testSuite2Impl1
run4 = runTestTT testSuite2Impl2

testSuite1Impl1 = test [
    "Caso 1: Multiplos de 0" ~: (multiplosDeNImpl1 0 [0,0,0]) ~?= [0,0,0],
    "Caso 2: Lista vacia" ~: (multiplosDeNImpl1 5 []) ~?= [],
    "Caso 3: Hay un solo multiplo" ~: (multiplosDeNImpl1 5 [3, 12, 5, 6]) ~?= [5],
    "Caso 4: No hay multiplos con n neg" ~: (multiplosDeNImpl1 (-3) [4, -7]) ~?= [],
    "Caso 5: Hay mas de un multiplo con n neg" ~: (multiplosDeNImpl1 (-3) [4, 3, -3]) ~?= [3, -3],
    "Caso 6: No hay multiplos con n pos" ~: (multiplosDeNImpl1 2 [-7, -3, 65]) ~?= [],
    "Caso 7: Hay mas de un multiplo con n pos" ~: (multiplosDeNImpl1 2 [-2,2]) ~?= [-2,2]
    ]

testSuite1Impl2 = test [
    "Caso 1: Multiplos de 0" ~: (multiplosDeNImpl2 0 [0,0,0]) ~?= [0,0,0],
    "Caso 2: Lista vacia" ~: (multiplosDeNImpl2 5 []) ~?= [],
    "Caso 3: Hay un solo multiplo" ~: (multiplosDeNImpl2 5 [3, 12, 5, 6]) ~?= [5],
    "Caso 4: No hay multiplos con n neg" ~: (multiplosDeNImpl2 (-3) [4, -7]) ~?= [],
    "Caso 5: Hay mas de un multiplo con n neg" ~: (multiplosDeNImpl2 (-3) [4, 3, -3]) ~?= [3, -3],
    "Caso 6: No hay multiplos con n pos" ~: (multiplosDeNImpl2 2 [-7, -3, 65]) ~?= [],
    "Caso 7: Hay mas de un multiplo con n pos" ~: (multiplosDeNImpl2 2 [-2,2]) ~?= [-2,2]
    ]


testSuite2Impl1 = test [
    "Caso 1: Multiplos de 0" ~: (multiplosDeNImpl1 0 [0,2,7,123,0,5,0,12]) ~?= [0,0,0],
    "Caso 2: Lista vacia" ~: (multiplosDeNImpl1 5 []) ~?= [],
    "Caso 3: Hay un solo multiplo" ~: (multiplosDeNImpl1 5 [3, 12, 5, 6]) ~?= [5],
    "Caso 4: No hay multiplos con n neg" ~: (multiplosDeNImpl1 (-3) [1, 4, -7]) ~?= [],
    "Caso 5: Hay mas de un multiplo con n neg" ~: (multiplosDeNImpl1 (-3) [1, 4, -7, -3, 6]) ~?= [-3, 6],
    "Caso 6: No hay multiplos con n pos" ~: (multiplosDeNImpl1 2 [1, -7, -3, 65]) ~?= [],
    "Caso 7: Hay mas de un multiplo con n pos" ~: (multiplosDeNImpl1 2 [1, 0, 2, 4, 6]) ~?= [0, 2, 4, 6]
    ]

testSuite2Impl2 = test [
    "Caso 1: Multiplos de 0" ~: (multiplosDeNImpl2 0 [0,2,7,123,0,5,0,12]) ~?= [0,0,0],
    "Caso 2: Lista vacia" ~: (multiplosDeNImpl2 5 []) ~?= [],
    "Caso 3: Hay un solo multiplo" ~: (multiplosDeNImpl2 5 [3, 12, 5, 6]) ~?= [5],
    "Caso 4: No hay multiplos con n neg" ~: (multiplosDeNImpl2 (-3) [1, 4, -7]) ~?= [],
    "Caso 5: Hay mas de un multiplo con n neg" ~: (multiplosDeNImpl2 (-3) [1, 4, -7, -3, 6]) ~?= [-3, 6],
    "Caso 6: No hay multiplos con n pos" ~: (multiplosDeNImpl2 2 [1, -7, -3, 65]) ~?= [],
    "Caso 7: Hay mas de un multiplo con n pos" ~: (multiplosDeNImpl2 2 [1, 0, 2, 4, 6]) ~?= [0, 2, 4, 6]
    ]