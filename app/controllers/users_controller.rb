class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @prototypes = user.prototypes
    @occupation = user.occupation
    @position = user.position
    @profile = user.profile
  end

end
