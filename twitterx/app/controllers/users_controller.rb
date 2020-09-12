class UsersController < ApplicationController
def profile
@user = User.current_user
end  
end
