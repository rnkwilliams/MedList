class MedicationsController < ApplicationController

    def index
        @medications = Medication.all
    end

    def new
        @medication = Medication.new
        @medication.build_category
    end

    def create
        @medication = Medication.new(medication_params)
        @medication.user_id = session[:user_id]
        if @medication.save
            redirect_to medication_path(@medication)
        else
            render :new
        end
    end

    def show
        @medication = Medication.find_by_id(params[:id])
    end

    def update
        @medication = Medication.find_by_id(params[:id])
        if @medication.update(medication_params)
            redirect_to medication_path(@medication)
        else
            render :edit
        end
    end

    def destroy
        @medication = Medication.find_by_id(params[:id])
        @pet.destroy
        redirect_to medications_path
    end

    private

    def medication_params
        params.require(:medication).permit(:name, :dosage, :units, :frequency, :times_per_day, :start_date, :category_id, category_attributes: [:name])
    end
end
