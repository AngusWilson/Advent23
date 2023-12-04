test:("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53";
    "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19";
    "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1";
    "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83";
    "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36";
    "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11")


input: read0 `$"Advent23/inputs/day04.txt"


d4p1:{sum 2 xexp (-1+count each (inter) ./: value each/: "|" vs/: (":" vs/: x)[;1]) except -1}


d4p2:{
    cards:value each/: "|" vs/: (":" vs/: x)[;1]; 
    
    cardCounts:(til c)!(c:count cards)#1;
 
    i:0;
    
    while[i<c;
        w:count (inter) . cards i;
        
        cardCounts,: copies!cardCounts[i]+cardCounts copies:1+i+til w;
        i+:1;
        ];
    sum cardCounts
    }
input
