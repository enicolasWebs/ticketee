class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        
        if @project.save
            flash[:notice] = "Project has been created."
            redirect_to @project
        else
            flash[:alert] = "Project has not been created."
            render "new"
        end
    end

    def show
        get_project_by_id
    end

    def edit
        get_project_by_id
    end

    def update
        get_project_by_id

        if @project.update(project_params)
            flash[:notice] = "Project has been updated."
            redirect_to @project
        else
            flash[:alert] = "Project has not been updated."
            render "edit"
        end
    end

    def destroy
        get_project_by_id
        @project.destroy
        
        flash[:notice] = "Project has been deleted."

        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:name, :description)
    end

    def get_project_by_id
        @id_param = params.permit(:id)
        @project = Project.find(@id_param[:id])
    end
end
