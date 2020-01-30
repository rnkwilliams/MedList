module ConditionsHelper
    def header_display(condition)
        if params[:medication_id]
            content_tag(:h1, "Add a Condition for #{@condition.medication.name} - #{@condition.medication.category.name}")
        else 
            content_tag(:h1, "Create a Condition")
        end
    end
end
