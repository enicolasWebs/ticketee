class Admin::StatesController < Admin::BaseController
    before_action :set_state, only: [:edit, :update, :destroy]

    def index
        @states = State.all
    end

    def new
        @state = State.new
    end

    def create
        @state = State.new(state_params)
        
        if @state.save
            flash[:notice] = "State has been created."
            redirect_to admin_states_path
        else
            flash.now[:alert] = "State has not been created."
            render "new"
        end
    end

    def edit
    end

    def update
        if @state.update(state_params)
            flash[:notice] = "State has been updated."
            redirect_to admin_states_path
        else
            flash.now[:alert] = "State has not been updated."
            render "edit"
        end
    end

    def destroy
        @state.destroy
        flash[:notice] = "State has been deleted."
        
        redirect_to admin_states_path
    end

    private

        def state_params
            params.require(:state).permit(:name, :background, :color)
        end


        def set_state
            @state = State.find(params[:id])
        end
end
