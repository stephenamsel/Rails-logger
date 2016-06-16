#Module to be used for logging, alerts, and automatic changes to other tables depending on what is in the log-table 

#module Logging
  include SessionHelper #need user-information
  
  def logthis(uid, key, recordid, oldvalue, newvalue)
        
    Transactionlogger.create(user: uid, key: key, recordid: recordid, oldvalue: oldvalue, newvalue: newvalue)
    #contained within a method to enable conditional calls from it
  end
    
  #Methods to log changes in another table
  #Include them in " before_update: " or " before_save: " callbacks
  #"changes" returns differences between a model-object and its corresponding record
  
  def logall(user)
    self.changes.each do |key, value|
      if key != "updated_at" then
        name = self.class.name + " #{key}"
          
        logthis(user, name, self.id, value[0], value[1])
      end
    end
  end
  
  def log_one(user, key)
    if self.changes[key] && self.changes[type][0] != self.changes[type][1] then
      logthis(user, key, self.id, self.changes[type][0], self.changes[type][1])
    end
  end

#end
