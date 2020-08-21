class User < ApplicationRecord
    after_initialize :set_win_loss
    after_save :set_diff
    validates :name, :win, :loss, :diff, :username, :password, presence: true

def set_win_loss
  self.win = 0
  self.loss = 0
  self.diff = 0
end

def set_diff
    self.diff = self.win-self.loss
end

end
