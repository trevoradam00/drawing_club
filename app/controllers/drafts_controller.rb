class DraftsController < ApplicationController

def index
	
end

def new
	@draft = Draft.new
	@project = Project.find(params[:project_id])
end

def create
	@draft = Draft.new(draft_params) #important! otherwise, draft params return nil
	@project = Project.find(params[:project_id])
	@draft.user = User.find(3)
	@draft.project = @project
	
	if @draft.save(draft_params)
		flash[:success] = "Draft has been created"
		redirect_to project_path(@project)
		puts 'hello'
	else
		render 'new'
	end
end

def edit
	@project = Project.find(params[:project_id])
	@draft = @project.drafts.find(params[:id])
end

def update
	@project = Project.find(params[:project_id])
	@draft = @project.drafts.find(params[:id])
	
	if @draft.update(draft_params)
		redirect_to project_draft_path(@project, @draft)
	else
		render 'edit'
	end
end

def show
	@project = Project.find(params[:project_id])
	@draft = @project.drafts.find(params[:id])
end

    
private

	def draft_params
		params.require(:draft).permit(:name, :description, :project_id, :user_id, :draft_id)
	end

end

