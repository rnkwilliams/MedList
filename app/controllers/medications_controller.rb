class MedicationsController < ApplicationController
    def new
        @medication = Medication.new
        @medication.build_category
    end

    def create
        @medication = Medication.new(medication_params)
        if @medication.save
            redirect_to medication_path(@medication)
        else
            render :new
        end
    end

    private

    def medication_params
        params.require(:medication).permit(:name, :dosage, :units, :frequency,           :times_per_day, :start_date, :category_id, category_attributes: [:name])
    end
end
