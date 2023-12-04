input: read0 `$"Advent23/inputs/day02.txt"

//Function that takes string of single round, formats into single row table
parseRound:{
    x:reverse each " " vs/: trim ","vs x;
    enlist (`$x[;0])!value each  x[;1]
    }

//Take a single game, parse each round and uj, to create table of the round
//Col headers are colour, values are number of cubes
parseGame:{
    (uj/)parseRound each ";" vs last ":" vs x
    }

//Using formatted table, compare the limits
isImpossible:{[game;limits]
    any any each (flip  game) >' limits
    }

d2p1:{
    games:parseGame each  x;
    sum 1+where not isImpossible[;limits] each games
    }

d2p2:{
    sum {sum prd max x} each parseGame each  x
    }
