classdef Bishop < ChessPiece
    %BISHOP Represents a bishop piece in chess.
    %   Calls the ChessPiece superclass' constructor and defines getSymbol
    %   as appropiate.
    
    properties
    end
    
    methods
        function obj = Bishop(pos, board, team)
            obj@ChessPiece(pos, board, team);
        end
        
        function y = getSymbol(obj) %#ok<MANU>
            y = 'B';
        end
        
        function y = getMoveArray(obj)
            out = {};
            curr_pos = obj.Position;
            x_pos = curr_pos(1);
            y_pos = curr_pos(2);
            curr_index = 1;
            
            %topright
            tr_arr = [];
            if x_pos < 8 && y_pos < 8
                x_temp = x_pos;
                y_temp = y_pos;
                while x_temp < 8 && y_temp < 8
                    x_temp = x_temp + 1;
                    y_temp = y_temp + 1;
                    tr_arr = [tr_arr; x_temp y_temp]; %#ok<AGROW>
                end
                out{1, curr_index} = tr_arr;
                curr_index = curr_index + 1;
            end
            
            %topleft
            tl_arr = [];
            if x_pos > 1 && y_pos < 8
                x_temp = x_pos;
                y_temp = y_pos;
                while x_temp > 1 && y_temp < 8
                    x_temp = x_temp - 1;
                    y_temp = y_temp + 1;
                    tl_arr = [tl_arr; x_temp y_temp]; %#ok<AGROW>
                end
                out{1, curr_index} = tl_arr;
                curr_index = curr_index + 1;
            end
            
            %bottomleft
            bl_arr = [];
            if x_pos > 1 && y_pos > 1
                x_temp = x_pos;
                y_temp = y_pos;
                while x_temp > 1 && y_temp > 1
                    x_temp = x_temp - 1;
                    y_temp = y_temp - 1;
                    bl_arr = [bl_arr; x_temp y_temp]; %#ok<AGROW>
                end
                out{1, curr_index} = bl_arr;
                curr_index = curr_index + 1;
            end
            
            %bottomright
            br_arr = [];
            if x_pos < 8 && y_pos > 1
                x_temp = x_pos;
                y_temp = y_pos;
                while x_temp < 8 && y_temp > 1
                    x_temp = x_temp + 1;
                    y_temp = y_temp - 1;
                    br_arr = [br_arr; x_temp y_temp]; %#ok<AGROW>
                end
                out{1, curr_index} = br_arr;
            end
            
            y = out;
        end
    end
    
end

