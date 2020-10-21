class ApplicationController < ActionController::API


    def seed_db
        Project.destroy_all
        api_key = ENV["GG_API_KEY"]
        response = RestClient.get("https://api.globalgiving.org/api/public/projectservice/themes/gender/projects/active.json?api_key=#{api_key}")

        data = JSON.parse(response)
        project_data = data["projects"]["project"]
        
        project_data.each do |p|
            Project.create(
                organization: p['organization']['name'],
                url: p['organization']['url'],
                summary: p ['summary'],
                donation_options: p ['donationOptions']['donationOption']
            )
        end
    end
end
