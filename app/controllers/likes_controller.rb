class LikesController < ApplicationController
  def create
    target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])

    respond_to do |format|
      if current_user.like!(target)
        format.json { render target, status: :created, location: target}
        format.html { redirect_back fallback_location: root_path, :notice => 'success' }
      else
        format.json { render target, :unprocessable_entity, location: target }
        format.html { redirect_back fallback_location: root_path, :notice => 'fail' }
      end
    end
  end

  def destroy
    target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])
    respond_to do |format|
      if current_user.unlike!(target)
        format.json { render target, status: :created, location: target}
        format.html { redirect_back fallback_location: root_path, :notice => 'success' }
      else
        format.json { render target, :unprocessable_entity, location: target }
        format.html { redirect_back fallback_location: root_path, :notice => 'fail' }
      end
    end
  end
end
