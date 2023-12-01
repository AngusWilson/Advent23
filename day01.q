input: read0 `$"Advent23/inputs/day01.txt"

x:input

d1p1:{
    //Drop alpha characters, take first and last, sum
    sum value each raze each 1 -1 #\:/: x except\: .Q.a}


d1p2:{
    
    //Define dict of word numbers and string numbers to string numbers
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
    
    //Func that searches for first and last occurance of any word or string number, then replace with string number
    replace:{[n;x]
        r:raze ({ss[x;first y],\:last y}[x;] each n);
        mi:r r[;0] ? min r[;0];
        ma:r r[;0] ? max r[;0];
        x:@[x;mi 0;:;first string mi 1];
        @[x;ma 0;:;first string ma 1]
        };
    
    x:replace[n;]each x;
    
    //Run through part 1 for result
    d1p1 x
    }
