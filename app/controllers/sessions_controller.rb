class SessionsController < ApplicationController
  def new

  end

  def create
    @hospital = Hospital.find_by(login_id: params[:session][:login_id])
    if @hospital && @hospital.authenticate(params[:session][:password])
      session[:hospital_id] = @hospital.id
      flash[:info] = " #{@hospital.name} でログインしました"
      redirect_to @hospital
    else
      flash[:danger] = 'ID/Passwordの組み合わせが間違えています'
      render 'new'
    end
  end
  
  def destroy
    session[:hospital_id] = nil
    redirect_to root_path
  end
end
