class ConditionsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if @medication = Medication.find_by_id(params[:medication_id])
            @condition = @medication.conditions.build
        else
            @condition = Condition.new
        end
    end

    def create
        @condition = current_user.conditions.build(condition_params)
        if @condition.save
            redirect_to condition_path(@condition)
        else
            render :new
        end
    end

    def show
        @condition = Condition.find_by_id(params[:id])
    end

    def index
        if @medication = Medication.find_by_id(params[:medication_id])
            @conditions = @medication.conditions
        else
            @conditions = Condition.where(:user_id => current_user.id)
        end
    end

    private

    def condition_params
       params.require(:condition).permit(:name, :notes, :medication_id)
    end
end
