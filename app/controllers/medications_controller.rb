class MedicationsController < ApplicationController
    def new
        @medication = Medication.new
        @medication.build_category
    end

    private

    def medication_params
    
    end
end
