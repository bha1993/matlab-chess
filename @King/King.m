classdef King < ChessPiece
    %KING Represents a king piece in chess.
    %   Calls the ChessPiece superclass' constructor and defines getSymbol
    %   as appropiate. Also has a ChessGame argument in the class
    %   constructor for later use.
    
    properties
        Game
    end
    
    methods
        function obj = King(pos, board, team, game)
            obj@ChessPiece(pos, board, team);
            obj.Game = game;
            obj.Game.addKing(obj);
        end
        
        function die(piece)
            brd = piece.Board;
            brd.removePiece(piece);
            piece.Game.checkmate(piece);
        end
        
        function y = getSymbol(obj)
            y = 'K';
        end
        
        function y = getMoveArray(obj)
            out = {};
            curr_pos = obj.Position;
            x_pos = curr_pos(1);
            y_pos = curr_pos(2);
            curr_index = 1;  
            
            has_left = (x_pos > 1);
            has_right = (x_pos < 8);
            has_up = (y_pos < 8);
            has_down = (y_pos > 1);
            
            if has_up
                out{1, curr_index} = [x_pos, y_pos + 1];
                curr_index = curr_index + 1;
            end
            
            if has_up && has_left
                out{1, curr_index} = [x_pos - 1, y_pos + 1];
                curr_index = curr_index + 1;
            end
            
            if has_up && has_right
                out{1, curr_index} = [x_pos + 1, y_pos + 1];
                curr_index = curr_index + 1;
            end
            
            if has_left
                out{1, curr_index} = [x_pos - 1, y_pos];
                curr_index = curr_index + 1;
            end
            
            if has_right
                out{1, curr_index} = [x_pos + 1, y_pos];
                curr_index = curr_index + 1;
            end
            
            if has_down
                out{1, curr_index} = [x_pos, y_pos - 1];
                curr_index = curr_index + 1;
            end
            
            if has_down && has_left
                out{1, curr_index} = [x_pos - 1, y_pos - 1];
                curr_index = curr_index + 1;
            end
            
            if has_down && has_right
                out{1, curr_index} = [x_pos + 1, y_pos - 1];
            end
            
            y = out;
        end
    end
    
end

