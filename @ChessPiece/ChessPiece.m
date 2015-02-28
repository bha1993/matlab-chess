classdef ChessPiece < handle
    %CHESSPIECE Abstract class representing a general chess piece.
    %   Position and team are self explanatory properties of the class. A
    %   general constructor determines these properties via the constructor
    %   and adds the ChessPiece to the ChessBoard. There is also an
    %   abstract getSymbol class that is defined in the subclass.
    
    properties
        Board
        Position
        Team        
    end
    
    methods
        function obj = ChessPiece(pos, board, team)
            obj.Position = pos;
            obj.Team = team;
            board.addPiece(obj);
            obj.Board = board;
        end
        
        function die(piece)
            brd = piece.Board;
            brd.removePiece(piece);
        end
        
        function move(piece, pos)
            mvs = piece.getMoves();
            sz = size(mvs);
            valid = false;
            attack_type = 0; %0 is an arbitrary value
            
            for i = 1:sz(1)
                curr = mvs(i,:);
                if (curr(1) == pos(1)) && (curr(2) == pos(2))
                    valid = true;
                    attack_type = curr(3);
                    break;
                end
            end
            
            if valid
                [~, occ_piece] = piece.Board.checkPosition(pos);
                piece.Position = pos;
                if attack_type                    
                    occ_piece.die();
                end
            end
        end
    end
    
    methods(Abstract)
        y = getSymbol(obj);
        y = getMoveArray(obj);
    end
end

