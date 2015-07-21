require "rails_helper"

RSpec.feature "hidden links" do
    let(:user)  { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:user, :admin) }
    let(:project) { FactoryGirl.create(:project, name: "Sublime Text 3") }

    context "anonymous users" do
        scenario "cannot see the New Project link" do
            visit "/"
            expect(page).not_to have_link "New Project"
        end

        scenario "cannot see the Delete Project link" do
            visit project_path(project)
            expect(page).not_to have_link "Delete Project"
        end
    end

    context "non-admin users" do
        before { login_as(user) }
        scenario "cannot see the New Project link" do
            visit "/"
            expect(page).not_to have_link "Delete Project"
        end

        scenario "cannot see the Delete Project link" do
            visit project_path(project)
            expect(page).not_to have_link "Delete Project"
        end
    end

    context "admin users" do
        before { login_as(admin) }
        scenario "can see the New Project link" do
            visit "/"
            expect(page).to have_link "New Project"
        end

        scenario "cannot see the Delete Project link" do
            visit project_path(project)
            expect(page).to have_link "Delete Project"
        end
    end
end
