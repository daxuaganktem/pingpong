class Game < ApplicationRecord
    validates :player1, :player2, :point1, :point2, presence: true
    after_initialize :increase_win_loss

    def increase_win_loss
        if (point1 > point2)
            winner = player1
            loser = player2
    
        else
            winner = player2
            loser = player1
        end
    won_user = User.find(winner)
    lost_user = User.find(loser)
    won_user_win = won_user.win.next
    lost_user_loss = lost_user.loss.next
    won_user.win = won_user_win
    lost_user.loss = lost_user_loss
    end

end

