input: read0 `$"Advent23/inputs/day01.txt"

x:input

d1p1:{sum value each raze each 1 -1 #\:/: x except\: .Q.a}


d1p2:{
    
    n:(
        ("one"  );
        ("two"  );
        ("three");
        ("four" );
        ("five" );
        ("six"  );
        ("seven");
        ("eight");
        ("nine" ));
    n,:enlist each 1_.Q.n;
    
    n:(enlist each n),'(18#1+til 9);
    
    replace:{[n;x]
        r:raze ({ss[x;first y],\:last y}[x;] each n);
        mi:r r[;0] ? min r[;0];
        ma:r r[;0] ? max r[;0];
        x:@[x;mi 0;:;first string mi 1];
        @[x;ma 0;:;first string ma 1]
        };
    
    x:replace[n;]each x;
    
    d1p1 x
    }
