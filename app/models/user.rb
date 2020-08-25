class User < ApplicationRecord
    validates :name, :win, :loss, :diff, :username, :password, presence: true
    after_initialize :init

    def init
      self.win  ||= 0
      self.loss ||= 0
      self.diff ||= 0
    end

end
