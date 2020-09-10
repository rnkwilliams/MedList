class SymptomsController < ApplicationController
    def new
        @symptom = Symptom.new
    end

    def create
        @symptom = Symptom.new(symptom_params)
        if @symptom.save
            redirect_to symptom_path(@symptom)
        else
            render :new
        end
    end


    private

    def symptom_params
        params.require(:symptom).permit(:name)
    end
end
