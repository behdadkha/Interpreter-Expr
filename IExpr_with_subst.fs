module IExpr_with_subst
open System 
//IExpr has all the operators of the language
type IExpr = Cons of int 
            | Neg of IExpr
            | Abs of IExpr
            | Plus of IExpr * IExpr
            | Times of IExpr * IExpr
            | Minus of IExpr * IExpr
            | Exp of IExpr * IExpr
            | Ident of String  //interpreting this will fail
            | Subst of String * IExpr * IExpr

let pow x y =
    let mutable r = 1
    let mutable newY = y
    while newY > 0 do
        r <- r * x
        newY <- newY - 1
    r

//substitude e1 into e2 when there is a str in e2
//it recursively checks the expr with the constructors of IExpr
let rec sub str inte1 e2 = 
    match e2 with
    | Cons c1 -> c1
    | Neg c1 -> -(sub str inte1 c1)
    | Abs c1 -> if (sub str inte1 c1) < 0 then -(sub str inte1 c1) else (sub str inte1 c1)
    | Plus (c1,c2) -> (sub str inte1 c1) + (sub str inte1 c2)
    | Times (c1,c2) ->  (sub str inte1 c1) * (sub str inte1 c2)
    | Minus (c1,c2) ->  (sub str inte1 c1) - (sub str inte1 c2)
    | Exp (c1,c2) ->  pow (sub str inte1 c1) (sub str inte1 c2)
    | Ident s -> if (str = s) then inte1 else 0 
    | Subst (s, b1, b2) -> sub s (sub str inte1 b1) b2 //we need to sub the inner expr first
 
//the interpret function works similar to the previouse version
//interpreting open expressions will fail
//also interpreting Ident will fail
let rec interpret expr = 
    match expr with 
    | Cons c1 -> c1
    | Neg c1 -> -interpret c1 
    | Abs c1 ->  if (interpret c1) < 0 then (-interpret c1) else interpret c1
    | Plus (c1,c2) -> (interpret c1) + (interpret c2) 
    | Times (c1,c2) -> (interpret c1) * (interpret c2) 
    | Minus (c1,c2) -> (interpret c1) - (interpret c2) 
    | Exp (c1,c2) -> pow (interpret c1) (interpret c2) 
    | Ident s -> 0
    | Subst (s, e1, e2) -> sub s (interpret e1) e2

(*let id = Ident "a"
let subs = Subst("a",Cons 5, id)
printfn "%d" (interpret subs)

let id1 = Ident "a"
let sm = Plus(Cons 5, id1)
let neg = Neg(sm)
let subst = Subst("a", Cons 5, neg)
printfn "%d" (interpret subst)

let id2 = Ident "a"
let nega = Neg(id2)
let ms = Abs(nega)
let su = Subst("a", Cons 2, ms)
printfn "%d" (interpret su)

let pls = Plus(Cons 5, id2)
let suba = Subst("a", Cons 5, pls)
printfn "%d" (interpret suba)

let y = Ident "y"
let ss = Subst("y", Cons 13, y)
printfn "%d" (interpret ss)*)
