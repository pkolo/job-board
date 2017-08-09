require "rails_helper"

RSpec.describe "JobsController", type: :request do
  # Initialize data
  let(:jobs) { FactoryGirl.create_list(:job, 5) }
  let(:first_job) { jobs.first }

  describe 'GET /jobs' do
    # make HTTP get request before each example
    before { get '/api/jobs' }
    let(:parsed_response) { JSON.parse(response.body) }

    it "returns a success response code" do
      expect(response).to have_http_status(200)
    end

    it "returns json" do
      expect(response.content_type).to eq("application/json")
    end

    it "contains meta" do
      expect(parsed_response["status"]).not_to be nil
      expect(parsed_response["code"]).not_to be nil
      expect(parsed_response["messages"]).not_to be nil
      expect(parsed_response["result"]).not_to be nil
    end

    it "returns properly formatted jobs as result" do
      parsed_response["results"].each do |result|
        expect(result["id"]).not_to be nil
        expect(result["title"]).not_to be nil
        expect(result["details"]).not_to be nil
        expect(result["date_posted"]).not_to be nil
        expect(result["category"]).not_to be nil
        expect(result["city"]).not_to be nil
      end
    end

    it "first result matches first job in database" do
      expect(parsed_response["result"].first).to eq
        {
          "id": "#{first_job.id}",
          "title": "#{first_job.title}",
          "details": "#{first_job.details}",
          "date_posted": "#{DateTime.current.strftime("%m/%d/%Y")}",
          "category": "#{first_job.category}",
          "city": "Brooklyn, NY"
        }
    end

  end

  describe 'POST /jobs' do

  end

  describe 'GET /jobs/:id' do

  end

  describe 'PUT /jobs/:id' do

  end

  describe 'DELETE /jobs/:id' do

  end
end
