*-----------------------------------------------------------
* Title      :  EXPERIMENT 6 PART 2
* Written by :  ELIF ARIKAN / OMER MALIK KALEMBASI
* Date       :  21.11.2021
* Description: 
*-----------------------------------------------------------
            ORG     $2020
ARR         DC.B    23, 42, 54, 44, 33, 90, 86, 49
        
            ORG     $2000
FIRST       DC.L    $2020           Address of the ARR's first element 
LAST        DC.L    $2024           Address of the ARR's second element
    
            ORG     $3000           Program start

MAINLOOP    MOVE.B  #0, D6            

COUNTER     CMP.B   #7, D6          Checks the bigger iteration of Bubble Sort Algorithm
            BEQ     PRINT           
            
            MOVE.B  #0, D5          Resets the smaller iteration of Bubble Sort Algorithm
            
            ADD.B   #1, D6          Increases the bigger iteration every step

            MOVE.L  FIRST, A0       Turning back to the top of the ARR
            MOVE.L  LAST, A1
        
LOOP        CMP.B   #7, D5          
            BEQ     COUNTER
            
            MOVE.B  (A0)+, D0          
            MOVE.B  (A0), D1
            CMP.B   D0, D1
            BLT     SWAP            If current element D0 less than previous element D1, jumps SWAP 
            BGT     CHECK           If current element D0 greater than previous element D1, jumps CHECK
        
SWAP        MOVE.B  D1, -(A0)       Moves current element to previous element's address 
            ADDA.L  #1, A0          Increases the address
            MOVE.B  D0,(A0)         Moves previous element to current element's address
            ADD.B   #1, D5  
            JMP     LOOP
        
CHECK       ADD.B   #1, D5          
            JMP     LOOP
            
PRINT       MOVE.L  FIRST, A1       Print steps which we wrote at Part 1
             
            MOVE    #7, D3          D3 carries the (array_size - 1)  
        
FOR         MOVE.B  (A1)+, D1  
            
            MOVE.B  #3, D0
            TRAP    #15      
        
            DBRA    D3, FOR         decrementing D3 by 1         

            CMP.W   #0, D3  
            BEQ     HALT  
        
HALT        MOVE.B  #9, D0
            TRAP    #15
       
        
            END     $3000
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
