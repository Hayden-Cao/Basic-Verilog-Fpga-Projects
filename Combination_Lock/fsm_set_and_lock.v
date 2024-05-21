`timescale 1ns / 1ps


module fsm_set_and_lock(

    input clk, clear_btn, left_btn, right_btn, up_btn, down_btn, set_switch,
    output reg[3:0] state,
    output reg[15:0] password,
    output reg [1:0] color

    );
    
    
    parameter left = 4'b0001;
    parameter right = 4'b0010;
    parameter up = 4'b0100;
    parameter down = 4'b1000;
    parameter IDLE = 0;
    parameter FirstGuess = 1;
    parameter OneCorr = 2;
    parameter TwoCorr = 3;
    parameter ThreeCorr = 4;
    parameter FourCorr = 5;
    parameter OneWrong = 6;
    parameter TwoWrong = 7;
    parameter ThreeWrong = 8;
    parameter FourWrong = 9;
    parameter FirstSet = 10;
    parameter SetOne = 11;
    parameter SetTwo = 12;
    parameter SetThree = 13;
    parameter SetFour = 14;

    
    reg[3:0] next_state;
    reg[1:0] color_select;
    reg[15:0] next_pass;
    
    initial begin
    
        next_pass = 0;
        next_state = 0;
        color_select = 2'b01;
    
    end
    
    
    always@(posedge clk or posedge clear_btn)
    begin
    
        if(clear_btn)
        begin
            state <= IDLE;
        end
        else
        begin
            state <= next_state; 
            password <= next_pass;
            color <= color_select;
        end
    end

    always@(*)
    begin
        next_state = state;
        color_select = color;
        next_pass = password;
        
        case(state)
        
            IDLE:
                begin
                    color_select = 2'b10;
                    if(set_switch)
                        next_state = FirstSet;
                    else
                        next_state = FirstGuess;
                
                end
            
            FirstSet:
                begin
                    color_select = 2'b01;       
                    next_pass = 16'hFFFF;
                    if(left_btn)
                    begin
                        next_pass[3:0] = left;
                        next_state = SetOne;
                    end else if (right_btn)
                    begin
                        next_pass[3:0] = right;
                        next_state = SetOne;
                    end else if (up_btn)
                    begin
                        next_pass[3:0] = up;
                        next_state = SetOne;
                    end else if (down_btn)
                    begin
                        next_pass[3:0] = down;
                        next_state = SetOne;
                    end 
                        
                        
                end
                
          SetOne:
                begin
                
                    color_select = 2'b01;
                    if(left_btn)
                    begin
                        next_pass[7:4] = left;
                        next_state = SetTwo;
                    end else if (right_btn)
                    begin
                        next_pass[7:4] = right;
                        next_state = SetTwo;
                    end else if (up_btn)
                    begin
                        next_pass[7:4] = up;
                        next_state = SetTwo;
                    end else if (down_btn)
                    begin
                        next_pass[7:4] = down;
                        next_state = SetTwo;
                    end                 
                    
                
                end      
            
           SetTwo:
                begin
                
                    color_select = 2'b01;
                    if(left_btn)
                    begin
                        next_pass[11:8] = left;
                        next_state = SetThree;
                    end else if (right_btn)
                    begin
                        next_pass[11:8] = right;
                        next_state = SetThree;
                    end else if (up_btn)
                    begin
                        next_pass[11:8] = up;
                        next_state = SetThree;
                    end else if (down_btn)
                    begin
                        next_pass[11:8] = down;
                        next_state = SetThree;
                    end                  
                    
                
                end      
                

           SetThree:
                begin
                
                    color_select = 2'b01;
                    if(left_btn)
                    begin
                        next_pass[15:12] = left;
                        next_state = SetFour;
                    end else if (right_btn)
                    begin
                        next_pass[15:12] = right;
                        next_state = SetFour;
                    end else if (up_btn)
                    begin
                        next_pass[15:12] = up;
                        next_state = SetFour;
                    end else if (down_btn)
                    begin
                        next_pass[15:12] = down;
                        next_state = SetFour;
                    end               
                    
                
                end  
         
         SetFour:
                begin
                    password = next_pass;               
                    color_select = 2'b11;            
                end
                
         FirstGuess:
                begin
                
                    color_select = 2'b01;
                    
                    if(left_btn)
                    begin  
                                         
                        if(password[3:0] == left)
                            next_state = OneCorr;
                        else 
                            next_state = OneWrong;  
                                                  
                    end else if (right_btn)
                    begin
                    
                        if(password[3:0] == right)
                            next_state = OneCorr;
                        else 
                            next_state = OneWrong;
                    
                    end else if (up_btn)
                    begin
                    
                        if(password[3:0] == up)
                            next_state = OneCorr;
                        else
                            next_state = OneWrong;    
                    
                    end else if (down_btn)
                    begin
                    
                        if(password[3:0] == down)
                            next_state = OneCorr;
                        else 
                            next_state = OneWrong;
                    
                    end
                    
                    
                end
                
         OneCorr:
                begin
                
                    color_select = 2'b01;
                    
                    if(left_btn)
                    begin  
                                         
                        if(password[7:4] == left)
                            next_state = TwoCorr;
                        else 
                            next_state = TwoWrong;  
                                                  
                    end else if (right_btn)
                    begin
                    
                        if(password[7:4] == right)
                            next_state = TwoCorr;
                        else 
                            next_state = TwoWrong;
                    
                    end else if (up_btn)
                    begin
                    
                        if(password[7:4] == up)
                            next_state = TwoCorr;
                        else
                            next_state = TwoWrong;    
                    
                    end else if (down_btn)
                    begin
                    
                        if(password[7:4] == down)
                            next_state = TwoCorr;
                        else 
                            next_state = TwoWrong;
                    
                    end
                    
                    
                end                
                

         TwoCorr:
                begin
                
                    color_select = 2'b01;
                    
                    if(left_btn)
                    begin  
                                         
                        if(password[11:8] == left)
                            next_state = ThreeCorr;
                        else 
                            next_state = ThreeWrong;  
                                                  
                    end else if (right_btn)
                    begin
                    
                        if(password[11:8] == right)
                            next_state = ThreeCorr;
                        else 
                            next_state = ThreeWrong;
                    
                    end else if (up_btn)
                    begin
                    
                        if(password[11:8] == up)
                            next_state = ThreeCorr;
                        else
                            next_state = ThreeWrong;    
                    
                    end else if (down_btn)
                    begin
                    
                        if(password[11:8] == down)
                            next_state = ThreeCorr;
                        else 
                            next_state = ThreeWrong;
                    
                    end
                    
                    
                end
                
         ThreeCorr:
                begin
                
                    color_select = 2'b01;
                    
                    if(left_btn)
                    begin  
                                         
                        if(password[15:12] == left)
                            next_state = FourCorr;
                        else 
                            next_state = FourWrong;  
                                                  
                    end else if (right_btn)
                    begin
                    
                        if(password[15:12] == right)
                            next_state = FourCorr;
                        else 
                            next_state = FourWrong;
                    
                    end else if (up_btn)
                    begin
                    
                        if(password[15:12] == up)
                            next_state = FourCorr;
                        else
                            next_state = FourWrong;    
                    
                    end else if (down_btn)
                    begin
                    
                        if(password[15:12] == down)
                            next_state = FourCorr;
                        else 
                            next_state = FourWrong;
                    
                    end
                    
                    
                end
                
         FourCorr:
                begin
                   color_select = 2'b10; 
                   password = next_pass;       
                end
                
             OneWrong:
                begin
                    color_select = 2'b01;
                    if(left_btn | right_btn | up_btn | down_btn)
                        next_state = TwoWrong;
                
                end           
                
              TwoWrong:
                begin
                    color_select = 2'b01;
                    if(left_btn | right_btn | up_btn | down_btn)
                        next_state = ThreeWrong;
                
                end    
 
              ThreeWrong:
                begin
                    color_select = 2'b01;
                    if(left_btn | right_btn | up_btn | down_btn)
                        next_state = FourWrong;
                
                end    
          
          FourWrong:
                begin
                    color_select = 2'b00;
                end
                
         default: begin
         end       
         
                 
        endcase
    
    end

    
endmodule
