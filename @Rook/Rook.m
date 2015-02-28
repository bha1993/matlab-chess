classdef Rook < ChessPiece
    %ROOK Represents a rook piece in chess.
    %   Calls the ChessPiece superclass' constructor and defines getSymbol
    %   as appropiate.
    
    properties
    end
    
    methods
        function obj = Rook(pos, board, team)
            obj@ChessPiece(pos, board, team);
        end
        
        function y = getSymbol(obj) %#ok<MANU>
            y = 'R';
        end
        
        function y = getMoveArray(obj)
            out = {};
            curr_pos = obj.Position;
            x_pos = curr_pos(1);
            y_pos = curr_pos(2);
            curr_index = 1;            
            
            %up
            up_arr = [];
            if y_pos < 8
                start = y_pos + 1;
                for i = start:8
                    up_arr = [up_arr; x_pos i];  %#ok<AGROW>
                end
                out{1, curr_index} = up_arr;
                curr_index = curr_index + 1;
            end
            %down
            down_arr = [];
            if y_pos > 1
                start = y_pos - 1;
                for i = start:-1:1
                    down_arr = [down_arr; x_pos i];  %#ok<AGROW>
                end
                out{1, curr_index} = down_arr;
                curr_index = curr_index + 1;
            end
            %left
            left_arr = [];
            if x_pos > 1
                start = x_pos - 1;
                for i = start:-1:1
                    left_arr = [left_arr; i y_pos]; %#ok<AGROW>
                end
                out{1, curr_index} = left_arr;
                curr_index = curr_index + 1;
            end
            %right
            right_arr = [];
            if x_pos < 8
                start =  x_pos + 1;
                for i = start:8
                    right_arr = [right_arr; i y_pos]; %#ok<AGROW>
                end
                out{1, curr_index} = right_arr;
            end
            
            y = out;
        end
    end
    
end

