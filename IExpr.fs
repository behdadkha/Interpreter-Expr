module IExpr
open System 
//The IExpr is a type with the operators of the language
type IExpr = Cons of int 
            | Neg of IExpr
            | Abs of IExpr
            | Plus of IExpr * IExpr
            | Times of IExpr * IExpr
            | Minus of IExpr * IExpr
            | Exp of IExpr * IExpr
//pow function is used to calculate the exp
let pow x y =
    let mutable r = 1
    let mutable newY = y
    while newY > 0 do
        r <- r * x
        newY <- newY - 1
    r

//interpret recursively calls it self to interpret to expr
// the base case is when the expr matches with Cons
let rec interpret expr = 
    match expr with 
    | Cons c1 -> c1
    | Neg c1 -> -interpret c1 
    | Abs c1 ->  if (interpret c1) < 0 then (-interpret c1) else interpret c1
    | Plus (c1,c2) -> (interpret c1) + (interpret c2) 
    | Times (c1,c2) -> (interpret c1) * (interpret c2) 
    | Minus (c1,c2) -> (interpret c1) - (interpret c2) 
    | Exp (c1,c2) -> pow (interpret c1) (interpret c2) 


(*  
let cons1 = Cons (5)
let cons2 = Cons (6)
let neg = Neg(cons1)
let abs = Abs(neg)
let plus = Plus(cons1,cons2)
let times = Times(cons1,cons2)
let minus = Minus(cons1,cons2)
let exp = Exp(cons1,cons2)
printfn "cons 5: %d" (interpret cons1)
printfn "neg cons 5: %d" (interpret neg)
printfn "abs neg cons 5: %d" (interpret abs)
printfn "plus cons 5 cons 6: %d" (interpret plus)
printfn "times cons 5 cons 6: %d" (interpret times)
printfn "exp cons 5 cons 6: %d" (interpret exp)*)
