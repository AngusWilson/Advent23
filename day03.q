test:("467..114..";
    "...*......";
    "..35..633.";
    "......#...";
    "617*......";
    ".....+.58.";
    "..592.....";
    "......755.";
    "...$.*....";
    ".664.598..")

input: read0 `$"Advent23/inputs/day03.txt"


d3p1:{[grid]
    
    s:not grid in ".",.Q.n;
    
    m:((-1;-1);
    (-1;0);
    (-1;1);
    (0;-1);
    (0;1);
    (1;-1);
    (1;0);
    (1;1));
    
    x:0;
    y:0;
    
    adjNumbers:();
    strNumber:"";
    wasNumber:0b;
    proxSymbol:0b;
    while[x< count grid;
        while[y<count first grid;
            //Am I a number
            isNumber:grid[x;y] in .Q.n;
            if[not isNumber;
                //am I a termination of a number
                if[wasNumber;
                    /If so, was any of it next to a symbol
                    if[proxSymbol;
                        adjNumbers,:value strNumber;
                        ];
                    strNumber:"";
                    proxSymbol:0b;
                    ];
                wasNumber:0b;
                ];
  
            if[isNumber;
                wasNumber:1b;
                //Append to local number string
                strNumber,:grid[x;y];
                //check surroundings is symbol
                proxSymbol:proxSymbol or any s ./: (x;y)+'/:m;
                    
                //If I'm a number, but also end of line, I'm terminated number
                if[(y+1)~count first grid;
                    if[proxSymbol;
                        adjNumbers,:value strNumber;
                        ];
                    strNumber:"";
                    proxSymbol:0b;
                    wasNumber:0b;
                    ];
                ];
            y+:1;
            ]
        y:0;
        x+:1];


    sum adjNumbers
    }
        
d3p2:{[grid]
    
    s:grid="*";
    
    m:((-1;-1);
    (-1;0);
    (-1;1);
    (0;-1);
    (0;1);
    (1;-1);
    (1;0);
    (1;1));
    
    x:0;
    y:0;
    
    localGearLoc:();
    adjNumbers:flip `number`gearLoc!(();());
    strNumber:"";
    wasNumber:0b;
    proxSymbol:0b;
    while[x< count grid;
        while[y<count first grid;
            //Am I a number
            isNumber:grid[x;y] in .Q.n;
            if[not isNumber;
                //am I a termination of a number
                if[wasNumber;
                    /If so, was any of it next to a symbol
                    if[proxSymbol;
                        //Maintaining numbers and locations of gears next to them
                        adjNumbers:adjNumbers uj flip `number`gearLoc!(value strNumber;localGearLoc);
                        ];
                    strNumber:"";
                    proxSymbol:0b;
                    localGearLoc:();
                    ];
                wasNumber:0b;
                ];
  
            if[isNumber;
                wasNumber:1b;
                //Append to local number string
                strNumber,:grid[x;y];
                //check surroundings is symbol
                proxGear:s ./: locs:(x;y)+'/:m;
                /If we do have one, record it to tag local number
                if[any proxGear;
                    gearLoc:(`$/:" " sv/: string locs) where proxGear;
                    localGearLoc,:gearLoc;
                    ];
                proxSymbol:proxSymbol or any proxGear;
                    
                //If I'm a number, but also end of line, I'm terminated number
                if[(y+1)~count first grid;
                    if[proxSymbol;
                        adjNumbers,:value strNumber;
                        ];
                    strNumber:"";
                    proxSymbol:0b;
                    wasNumber:0b;
                    ];
                ];
            y+:1;
            ];
        y:0;
        x+:1];

    //Use table to group by gears, and then calc ratios
    byGear:select number by gearLoc from distinct adjNumbers;
    gratio:update ratio:prd each number from select from byGear where 2=count each number;
    exec sum ratio from gratio
    }
