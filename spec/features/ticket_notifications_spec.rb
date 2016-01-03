require "rails_helper"

RSpec.feature "Users can receive notifications about ticket updates" do
    let(:alice) { FactoryGirl.create(:user, email: "alice@example.com") }
    let(:bob) { FactoryGirl.create(:user, email: "bob@example.com") }
    let(:project) { FactoryGirl.create(:project) }
    let(:ticket) do
        FactoryGirl.create(:ticket, project: project, author: alice)
    end

    before do
        assign_role!(alice, :manager, project)
        assign_role!(bob, :manager, project)

        login_as(bob)
        visit project_ticket_path(project, ticket)
    end

    scenario "ticket authors automatically receive notifications" do
        fill_in "Text", with: "Is it out yet?"
        click_button "Create Comment"

        email = find_email!(alice.email)
        expected_subject = "[ticketee] #{project.name} - #{ticket.title}"
        expect(email.subject).to eq(expected_subject)

        click_first_link_in_email(email)
        expect(page).to have_heading(ticket.title)
    end
end