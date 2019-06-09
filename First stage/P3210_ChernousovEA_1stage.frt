: iseven 2 % not ;

: isprime
	dup 0 < if 
                else
  	        dup 2 < if 
                drop 
                0 
                else
		        1 >r repeat  
			     dup
			     1 r> +
                             dup >r
		             % 
                             0 = 
                             until 
		r> = 
	        then
	        then
;

: revo ( revolution) ( a b -- a b a ) >r dup r> swap ;
: isprimeallot ( @ for check result )
	isprime
	8 allot 
	swap 
        revo
	! 
;

: revo ( revolution) ( a b -- a b a ) >r dup r> swap ;
: concat ( addr2 addr1 -- straddr )
    ( addr2 addr1 )
    swap
    ( addr1 addr2 )
    revo
    ( addr1 addr2 addr1 )
    count
    ( addr1 addr2 length1 )
    revo
    ( addr1 addr2 length1 addr2 )
    count
    ( addr1 addr2 length1 length2 )
    +
    ( addr1 addr2 length)
    heap-alloc
    ( addr1 addr2 addr )
    dup >r ( ... , addr )
    ( addr1 addr2 addr )
    dup rot 
    ( addr1 addr addr addr2 )
    dup count >r ( ... , length2 )
    ( addr1 addr addr addr2 )
    dup >r ( ... , addr2 ) 
    ( addr1 addr addr addr2 )
    string-copy
    ( addr1 addr ) 
    r> 
    ( addr1 addr addr2 )
    heap-free ( free addr2 )
    ( addr1 addr )
    r>
    ( addr1 addr length2 )
    +
    ( addr1 newaddr )
    swap
    ( newaddr addr1 )
    dup >r ( ... , addr1 )
    string-copy 
    r> heap-free ( free addr1 )
    r> prints       
   ;


: rad ( number -- radical )
	1 
        dup >r
	repeat
		1 + 
		2dup 
                % not
		if      
		        repeat 
		        2dup / 
		        rot 
                        drop 
                        swap
		        2dup % 	
                	until 
                dup r>  
	        * >r
                then
        revo 
        1 =
        until	
        
        2drop
        r>
;