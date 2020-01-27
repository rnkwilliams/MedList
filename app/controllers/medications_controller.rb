class MedicationsController < ApplicationController
    before_action :set_medication, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

    def index
        @medications = Medication.where(:user_id => current_user.id)
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
            @medication = build_category
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @medication.update(medication_params)
            redirect_to medication_path(@medication)
        else
            render :edit
        end
    end

    def destroy
        @medication.destroy
        redirect_to medications_path
    end

    private

    def medication_params
        params.require(:medication).permit(:name, :dosage, :units, :frequency, :times_per_day, :start_date, :category_id, category_attributes: [:name])
    end

    def set_medication
        @medication = Medication.find_by_id(params[:id])
        redirect_to medications_path if !@medication
    end
end
