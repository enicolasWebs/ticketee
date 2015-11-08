require "rails_helper"

RSpec.feature "Deleting states" do
    let!(:state)  { FactoryGirl.create(:state, name: "Test State", color: "black", background: "yellow") }

    before do
        login_as(FactoryGirl.create(:user, :admin))
    end

    scenario "deleting successfully" do
        visit "/"
        click_link "Admin"
        click_link "States"
        find("#state-" + state.name.parameterize).click_link "Delete State"

        expect(page).to have_content("State has been deleted.")
        within("#states") do
            expect(page).not_to have_content(state.name)
        end
    end
end
