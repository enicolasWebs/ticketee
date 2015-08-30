require "rails_helper"

RSpec.feature "Editing Projects" do
    let(:user) { FactoryGirl.create(:user) }

    before do
        sublime = FactoryGirl.create(:project, name: "Sublime Text 3")

        login_as(user)
        assign_role!(user, :viewer, sublime)

        visit "/"
        
        click_link "Sublime Text 3"
        click_link "Edit Project"
    end
        
    scenario "Updating a project" do
        fill_in "Name", with: "Sublime Text 3 beta"
        click_button "Update Project"

        expect(page).to have_content("Project has been updated.")
    end

    scenario "Updating a project with invalid name attribute" do
        fill_in "Name", with: ""
        click_button "Update Project"

        expect(page).to have_content("Project has not been updated.")
    end

    scenario "Updating a project with invalid description attribute" do
        fill_in "Description", with: ""
        click_button "Update Project"

        expect(page).to have_content("Project has not been updated.")
    end
end
