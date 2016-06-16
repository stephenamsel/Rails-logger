class Loan < ActiveRecord::Base
  load 'logging.rb'
  
  belongs_to :user
  before_update :logchange
  before_save :roundamount
  
  def roundamount
    self.amount.round(2)
  end
  
  def logchange
    logall(self.user_id)
  end

end
