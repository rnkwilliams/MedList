class ConditionsController < ApplicationController
    def new
        @medication = Medication.find_by_id(params[:medication_id])
        @condition = @medication.conditions.build
    end

    def create
        @condition = Condition.new(condition_params)
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
    end

    private

    def condition_params
       params.require(:condition).permit(:name, :notes, :medication_id) 
    end
end
