require "rails_helper"

RSpec.describe "JobsController", type: :request do
  # Initialize data
  let!(:jobs) { create_list(:job, 10) }
  let!(:first_job) { jobs.first }

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
      parsed_response["result"].each do |result|
        expect(result["id"]).not_to be nil
        expect(result["title"]).not_to be nil
        expect(result["details"]).not_to be nil
        expect(result["date_posted"]).not_to be nil
        expect(result["category"]).not_to be nil
        expect(result["city"]).not_to be nil
      end
    end

    it "first result matches first job in database" do
      expect(parsed_response["result"].first).to eq({
          "id" => first_job.id,
          "title" => "#{first_job.title}",
          "details" => "#{first_job.details}",
          "date_posted" => "#{first_job.nice_date}",
          "category" => "#{first_job.category.name}",
          "city" => "#{first_job.location.to_s}"
        })
    end

  end

  describe 'POST /jobs' do

    describe 'success' do
      let(:valid_attributes) { {job:{title: Faker::Lorem.sentence, details: Faker::Lorem.paragraph, category_name: "Repair", location_attributes: {city: "Brooklyn", state: "NY"}}} }
      before { post '/api/jobs', params: valid_attributes }
      let(:parsed_response) { JSON.parse(response.body) }
      let(:last_job) { Job.last }

      it "returns json" do
        expect(response.content_type).to eq("application/json")
      end

      it "returns a successfully created response code" do
        expect(response).to have_http_status(201)
      end

      it "contains meta" do
        expect(parsed_response["status"]).not_to be nil
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "returns JSON object created from new database entry" do
        expect(parsed_response["result"]).to eq({
            "id" => jobs.length + 1,
            "title" => "#{last_job.title}",
            "details" => "#{last_job.details}",
            "date_posted" => "#{last_job.nice_date}",
            "category" => "#{last_job.category.name}",
            "city" => "#{last_job.location.to_s}"
          })
      end
    end

    describe "with invalid params" do
      let(:invalid_attributes) { {job:{title: nil, details: nil, category_name: "Repair", location_attributes: {city: "Brooklyn", state: "NY"}}} }
      before { post '/api/jobs', params: invalid_attributes }
      let(:parsed_response) { JSON.parse(response.body) }

      it "returns json" do
        expect(response.content_type).to eq("application/json")
      end

      it "returns an unprocessable entity response code" do
        expect(response).to have_http_status(422)
      end

      it "contains meta" do
        expect(parsed_response["status"]).not_to be nil
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "contains error messages" do
        expect(parsed_response["messages"]).to include("can't be blank")
      end
    end

  end

  describe 'GET /jobs/:id' do

  end

  describe 'PUT /jobs/:id' do

  end

  describe 'DELETE /jobs/:id' do

  end
end
