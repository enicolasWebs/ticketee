require "rails_helper"
require "color/css"

RSpec.feature "Editing state" do
    let!(:state)  { FactoryGirl.create(:state, name: "Test State", color: "black", background: "yellow") }

    before do
        login_as(FactoryGirl.create(:user, :admin))
    end

    scenario "with valid attributes" do
        Capybara.current_driver = :selenium
        visit "/"
        click_link "Admin"
        click_link "States"

        find("#state-" + state.name.parameterize).click_link "Edit State"
        fill_in "Color", with: "blue"
        click_button "Update State"
    
        expect(page).to have_content "State has been updated."

        actualColor = page.find(".state-" + state.name.parameterize).native.css_value('color')
        expectedColor =  Selenium::WebDriver::Support::Color.from_string(Color::CSS[:blue].html).rgba
        
        expect(actualColor).to eq(expectedColor)
        
        #puts Selenium::WebDriver::Support::Color.instance_attributes
    end

    scenario "with invalid attributes" do
        visit "/"
        click_link "Admin"
        click_link "States"

        find("#state-" + state.name.parameterize).click_link "Edit State"
        fill_in "Name", with: ""
        click_button "Update State"

        expect(page).to have_content("State has not been updated.")
    end
end
