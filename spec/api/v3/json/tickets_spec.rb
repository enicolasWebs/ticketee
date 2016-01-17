require 'rails_helper'
require_relative '../../../../app/controllers/api/v3/json/tickets'
require 'pp'

RSpec.describe Api::V3::JSON::Tickets, type: :api do
    let(:project) { FactoryGirl.create(:project) }
    let(:user) { FactoryGirl.create(:user) }
    # let(:token) { user.authentication_token }

    before do
        FactoryGirl.create(:ticket, project: project)
        # user.permissions.create!(thing: project, action: "view")
    end

    let(:url) { "/api/v3/json/projects/#{project.id}/tickets" }

    context "successful requests" do

        it "can get a list of tickets" do
            pp url
            pp project.tickets.to_json
            get url
            expect(last_response.body).to eql(project.tickets.to_json)
        end
    end
end
