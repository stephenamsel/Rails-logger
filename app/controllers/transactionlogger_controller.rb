class TransactionloggerController < ApplicationController
  def report
    
    loans = []
    if params[:q] && params[:q][:key] then
      
      key = params[:q][:key]
        
         #eliminating the record id from the key if not only looking at repeated edits of the same record
      loans = Transactionlogger.where(key: key)
      

      if params[:q][:date_gt].present? then
        loans = loans.where("created_at > ?", params[:q][:date_gt].to_datetime)
      end
      if params[:q][:date_lt].present? then
        loans = loans.where("created_at < ?", params[:q][:date_lt].to_datetime)
      end

      if params[:q][:count] then
        threshold = params[:q][:count].to_i
        @flagged = []
        (params[:q][:same].present? && params[:q][:same] == 1) ? grouped = loans.group("user", "recordid") : grouped = loans.group("user")
        
        grouped.count.each do |key, value|
          if value > threshold then
            @flagged.push({user: key, num_events: value})
          end
        end
      else
        @flagged = loans.group("user")
      end
    else
      @flagged = []      
    end
    for flag in @flagged
        flag[:email] = User.find(flag[:user].to_i).name
        flag[:user] = nil
    end
  end

  def alltime
  end
end
