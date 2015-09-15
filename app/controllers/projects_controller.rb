class ProjectsController < ApplicationController

def index
	@projects = Project.all
end

def new 
	@project = Project.new
end

def create
	@project = Project.new(project_params)
	@project.user = User.find(3) 				#### TO CHANGE
	
	if @project.save
		flash[:success] = "Project has been created"
		redirect_to projects_path
	else
		render 'new'
	end
end

def edit
	@project = Project.find(params[:id])
end

def update
	@project = Project.find(params[:id])
	if @project.update(project_params)
		flash[:success] = "Project has been updated"
		redirect_to project_path(@project)
	else
		render 'edit'
	end
end


def show
	@project = Project.find(params[:id])
    @drafts = @project.drafts
end


private
	def project_params
		params.require(:project).permit(:name, :description)
	end

end