import Test.HUnit

tests = test [ 
    "doubleMe deberia devolver 4" ~: 4 ~=? doubleMe 2,
    "doubleMe deberia devolver 8" ~: 8 ~=? doubleMe 4 
   ]

main = runTestTT tests

doubleMe :: Integer -> Integer
doubleMe n = n * 2


--RedSocial  ([(1,"usuario")], [((1,"usuario"), (1,"usuario"))], [((1,"usuario"), "String", [(1,"usuario")])])

