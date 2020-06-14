class Helpers 
    
   def self.current_user(session)
       user=User.find_by_id(session[:user_id])
   end

   def self.is_logged_in?(session)
        !!session[:user_id]
   end
    
   def self.all_desease(session)
      @all_diseases =[]
      all_histories =[]
      members= self.current_user(session).members
      members.each do |member| 
          member.histories.each do |his| 
             all_histories << his
             @all_diseases << his.disease
          end
      end
      @all_diseases
   end  


   def self.all_members(session)
      all_members= self.current_user(session).members
   end

end