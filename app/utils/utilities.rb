class Utilities 
    def increase_win_loss(game)
        if (game.point1 > game.point2)
            game.winner = game.player1
            loser = game.player2
        else
            game.winner = game.player2
            loser = game.player1
        end
        
        won_user = User.find(game.winner)
        lost_user = User.find(loser)
        set_user_winloss(won_user, true)
        set_user_winloss(lost_user, false)
        game.save
    end

    def decrease_win_loss(game)   
        if(game.player1==game.winner)
            loser=game.player2
        else
            loser=game.player1
        end
        
        won_user = User.find(game.winner)
        lost_user = User.find(loser)
        delete_user_winloss(won_user, true)
        delete_user_winloss(lost_user, false)
    end

    def set_user_winloss(user,is_winner)
        if is_winner
            user.win = user.win.next
            set_diff_and_save(user)
        else
            user.loss = user.loss.next
            set_diff_and_save(user)
        end
    end

    def delete_user_winloss(user,is_winner)
        if is_winner
            user.win = user.win.pred
            set_diff_and_save(user)
        else
            
            binding.pry
            
            user.loss = user.loss.pred
            set_diff_and_save(user)
        end
    end

    def set_diff_and_save(user)
        user.diff = user.win - user.loss
        user.save
    end


end