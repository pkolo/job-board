require "rails_helper"

# Lots of repition in these tests-- look for ways to DRY.

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
        expect(result["location"]).not_to be nil
      end
    end

    it "first result matches first job in database" do
      expect(parsed_response["result"].first).to eq({
          "id" => first_job.id,
          "title" => "#{first_job.title}",
          "details" => "#{first_job.details}",
          "date_posted" => "#{first_job.date_posted}",
          "category" => {"name" => "#{first_job.category.name}", "id" => first_job.category.id},
          "location" => {"city" => "#{first_job.location.city}", "state" => "#{first_job.location.state}", "id" => first_job.location.id}
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
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "returns JSON object created from new database entry" do
        expect(parsed_response["result"]).to eq({
            "id" => jobs.length + 1,
            "title" => "#{last_job.title}",
            "details" => "#{last_job.details}",
            "date_posted" => "#{last_job.date_posted}",
            "category" => {"name" => "#{last_job.category.name}", "id" => last_job.category.id},
            "location" => {"city" => "#{last_job.location.city}", "state" => "#{last_job.location.state}", "id" => last_job.location.id}
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
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "contains error messages" do
        expect(parsed_response["messages"]).to include("Title can't be blank")
      end
    end

  end

  describe 'GET /jobs/:id' do
    describe 'success' do
      let(:random_job) { jobs.sample }
      before { get "/api/jobs/#{random_job.id}"}
      let(:parsed_response) { JSON.parse(response.body) }

      it "returns json" do
        expect(response.content_type).to eq("application/json")
      end

      it "returns a success response code" do
        expect(response).to have_http_status(200)
      end

      it "contains meta" do
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "returns JSON object created from new database entry" do
        expect(parsed_response["result"]).to eq({
            "id" => random_job.id,
            "title" => "#{random_job.title}",
            "details" => "#{random_job.details}",
            "date_posted" => "#{random_job.date_posted}",
            "category" => {"name" => "#{random_job.category.name}", "id" => random_job.category.id},
            "location" => {"city" => "#{random_job.location.city}", "state" => "#{random_job.location.state}", "id" => random_job.location.id}
          })
      end
    end

    describe 'non-existent id' do
      before { get "/api/jobs/#{jobs.length + 100}"}
      let(:parsed_response) { JSON.parse(response.body) }

      it "returns json" do
        expect(response.content_type).to eq("application/json")
      end

      it "returns a not found response code" do
        expect(response).to have_http_status(404)
      end

      it "contains meta" do
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "contains error messages" do
        expect(parsed_response["messages"]).to include("Record not found.")
      end
    end
  end

  describe 'PUT /jobs/:id' do
    describe 'success' do
      let(:random_job) { jobs.sample }
      let(:update_attributes) { {job:{title: Faker::Lorem.sentence, details: Faker::Lorem.paragraph}} }
      before { put "/api/jobs/#{random_job.id}", params: update_attributes }
      let(:parsed_response) { JSON.parse(response.body) }

      it "returns json" do
        expect(response.content_type).to eq("application/json")
      end

      it "returns a success response code" do
        expect(response).to have_http_status(200)
      end

      it "contains meta" do
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "returns JSON object with updated attributes" do
        expect(parsed_response["result"]).to eq({
            "id" => random_job.id,
            "title" => "#{update_attributes[:job][:title]}",
            "details" => "#{update_attributes[:job][:details]}",
            "date_posted" => "#{random_job.date_posted}",
            "category" => {"name" => "#{random_job.category.name}", "id" => random_job.category.id},
            "location" => {"city" => "#{random_job.location.city}", "state" => "#{random_job.location.state}", "id" => random_job.location.id}
          })
      end
    end

    describe "with invalid params" do
      let(:random_job) { jobs.sample }
      let(:invalid_attributes) { {job:{title: nil}} }
      before { put "/api/jobs/#{random_job.id}", params: invalid_attributes }
      let(:parsed_response) { JSON.parse(response.body) }

      it "returns json" do
        expect(response.content_type).to eq("application/json")
      end

      it "returns an unprocessable entity response code" do
        expect(response).to have_http_status(422)
      end

      it "contains meta" do
        expect(parsed_response["code"]).not_to be nil
        expect(parsed_response["messages"]).not_to be nil
        expect(parsed_response["result"]).not_to be nil
      end

      it "contains error messages" do
        expect(parsed_response["messages"]).to include("Title can't be blank")
      end
    end
  end

  describe 'DELETE /jobs/:id' do
    let(:random_job) { jobs.sample }
    before { delete "/api/jobs/#{random_job.id}"}
    let(:parsed_response) { JSON.parse(response.body) }

    it "returns json" do
      expect(response.content_type).to eq("application/json")
    end

    it "returns a success response code" do
      expect(response).to have_http_status(200)
    end

    it "contains meta" do
      expect(parsed_response["code"]).not_to be nil
      expect(parsed_response["messages"]).not_to be nil
      expect(parsed_response["result"]).not_to be nil
    end

    it "returns success message" do
      expect(parsed_response["messages"]).to include("Job successfully deleted.")
    end
  end
end
