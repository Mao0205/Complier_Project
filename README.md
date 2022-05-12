# Complier_Project

Grammar for this language is as follow :

    program → Program Identifier Begin declarations statements End
    declarations → declarations Var Identifier | ε
    statements → statements statement | ε
    statement → Set Identifier = arithmeticExpression
                | If booleanExpression Then statements EndIf
                | If booleanExpression Then statements Else statements EndIf
                | While booleanExpression Do statements EndWhile
                | Read Identifier
                | Write arithmeticExpression
                | Exit
    booleanExpression → booleanExpression Or booleanTerm |  booleanTerm
    booleanTerm → booleanTerm And booleanFactor   |   booleanFactor
    booleanFactor → Not booleanFactor | relationExpression
    relationExpression → arithmeticExpression == arithmeticExpression
                          | arithmeticExpression <> arithmeticExpression
                          | arithmeticExpression > arithmeticExpression
                          | arithmeticExpression >= arithmeticExpression
                          | arithmeticExpression < arithmeticExpression
                          | arithmeticExpression <= arithmeticExpression
    arithmeticExpression → arithmeticExpression + arithmeticTerm
                            | arithmeticExpression – arithmeticTerm
                            | arithmeticTerm
    arithmeticTerm → arithmeticTerm * arithmeticFactor
                      | arithmeticTerm / arithmeticFactor
                      | arithmeticTerm % arithmeticFactor
                      | arithmeticFactor
    arithmeticFactor → - arithmeticFactor | primaryExpression
    primaryExpression → IntConst | Identifier | ( arithmeticExpression )
