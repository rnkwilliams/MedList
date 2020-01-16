class ConditionsController < ApplicationController
    def new
        @medication = Medication.find_by_id(params[:medication_id])
        @condition = @medication.conditions.build
    end

    def index
    end
end
