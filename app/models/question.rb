class Question < ApplicationRecord
    validates :solution, presence: true
    # after_initialize :set_time
    # before_create :time_taken

    # private
    # def set_time
    #     @time = Time.now.sec
    # end
    # def time_taken
    #     self.time_taken = @time
    # end
end
