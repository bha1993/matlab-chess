classdef Knight < ChessPiece
    %KNIGHT Represents a knight piece in chess.
    %   Calls the ChessPiece superclass' constructor and defines getSymbol
    %   as appropiate.
    
    properties
    end
    
    methods
        function obj = Knight(pos, board, team)
            obj@ChessPiece(pos, board, team);
        end
        
        function y = getSymbol(obj)
            y = 'N';
        end
        
        function y = getMoveArray(obj)
            out = {};
            curr_pos = obj.Position;
            x_pos = curr_pos(1);
            y_pos = curr_pos(2);
            curr_index = 1;
            
            one_up = (y_pos < 8);
            two_up = (y_pos < 7);
            one_down = (y_pos > 1);
            two_down = (y_pos > 2);
            one_left = (x_pos > 1);
            two_left = (x_pos > 2);
            one_right = (x_pos < 8);
            two_right = (x_pos < 7);
            
            if one_up && two_left
                out{1, curr_index} = [x_pos - 2, y_pos + 1];
                curr_index = curr_index + 1;
            end
            
            if one_up && two_right
                out{1, curr_index} = [x_pos + 2, y_pos + 1];
                curr_index = curr_index + 1;
            end
            
            if one_down && two_left
                out{1, curr_index} = [x_pos - 2, y_pos - 1];
                curr_index = curr_index + 1;
            end
            
            if one_down && two_right
                out{1, curr_index} = [x_pos + 2, y_pos - 1];
                curr_index = curr_index + 1;
            end
            
            if one_left && two_up
                out{1, curr_index} = [x_pos - 1, y_pos + 2];
                curr_index = curr_index + 1;
            end
            
            if one_right && two_up
                out{1, curr_index} = [x_pos + 1, y_pos + 2];
                curr_index = curr_index + 1;
            end
            
            if one_left && two_down
                out{1, curr_index} = [x_pos - 1, y_pos - 2];
                curr_index = curr_index + 1;
            end
            
            if one_right && two_down
                out{1, curr_index} = [x_pos + 1, y_pos - 2];
            end
            
            y = out;
        end
    end
    
end

