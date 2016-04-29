class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show]
  def new
    @hospital = Hospital.new
  end
  
  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      session[:hospital_id] = @hospital.id
      flash[:success] ="#{current_user.name}様のアカウントが登録されました "
      redirect_to @hospital
    else
      render 'new'
    end
  end
  
  def index
  end
  
  def show
  end

  def destroy
  end
    
  def update
  end
  
private
  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:name, :login_id, :department_id, :password,
                                 :password_confirmation)
  end
end

