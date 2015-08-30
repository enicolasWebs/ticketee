require "rails_helper"

RSpec.feature "Viewing tickets" do
    before do
        sublime = FactoryGirl.create(:project, name: "Sublime Text 3", description: "test")
        
        user = FactoryGirl.create(:user)

        FactoryGirl.create(:ticket,
            project: sublime,
            author: user,
            title: "Make it shiny!",
            description: "Gradients! Starbursts! Oh my!")
            
        ie = FactoryGirl.create(:project, name: "Internet Explorer", description: "test")

        FactoryGirl.create(:ticket,
            project: ie,
            author: user,
            title: "Standards compliance",
            description: "Isn't a joke.")

        assign_role!(user, :viewer, sublime)
        assign_role!(user, :viewer, ie)

        login_as(user)
        visit "/"
    end

    scenario "for a given project" do
        click_link "Sublime Text 3"

        expect(page).to have_content("Make it shiny!")
        expect(page).to_not have_content("Standards compliance")

        click_link "Make it shiny!"
        within("#ticket h2") do
            expect(page).to have_content("Make it shiny!")
        end

        expect(page).to have_content("Gradients! Starbursts! Oh my!")
    end
end
