class Helpers 
    
   def self.current_user(session)
       user=User.find_by_id(session[:user_id])
   end

   def self.is_logged_in?(session)
        !!session[:user_id]
   end
    

   def self.all_members(session)
      all_members = self.current_user(session).members
   end


   def self.all_desease(session)
      @all_diseases1 =[]
      members= self.all_members(session)
      members.each do |member| 
          member.histories.each do |his| 
             @all_diseases1 << his.disease
          end
      end
      @all_diseases1.compact.uniq
   end  

   def self.all_histories(session)
      all_histories =[]
      members= self.current_user(session).members
      members.each do |member| 
          member.histories.each do |his| 
             all_histories << his
          end
      end
      @all_histories.compact.uniq
   end  

   def self.all_procedures(session)
      all_procedures =[]
      members= self.current_user(session).members
      members.each do |member| 
          member.procedure.each do |proc| 
             all_procedures << proc          
          end
      end
      all_procedures.compact.uniq
   end 


end