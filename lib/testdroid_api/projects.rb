
module TestdroidAPI
		class Projects < CloudListResource
		end
		
		class Project < CloudResource
		
			def	initialize(uri, client, params= {})
				super uri, client,"project", params
				@uri, @client = uri, client
				sub_items :runs, :files
			end
			def run(name=nil)
				run_parameters = name.nil? ? {:params => {}} : {:params =>  {'name' => name} }

				resp = @client.post("#{@uri}/runs", run_parameters)
				Run.new(nil, nil, resp)
				
			end
			def uploadAPK(filename)
				if !File.exist?(filename) 
					@client.logger.error( "Invalid filename")
					return
				end
				@client.upload("/projects/#{id}/apks/application",id, filename) 
			end
		end
end
