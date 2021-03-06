
module TestdroidAPI
		class CloudListResource
		
			def initialize(uri, client)
				@uri, @client = uri, client
				resource_name = self.class.name.split('::')[-1]
				@instance_class = TestdroidAPI.const_get resource_name.chop
				@list_key, @instance_id_key = resource_name.gsub!(/\b\w/) { $&.downcase } , 'id'
			end
			def get(resource_id)
				@instance_class.new( "#{@uri}/#{resource_id}", @client)
			end
			def total
        		
        		@client.get(@uri)['total']
      		end
			def list(params={}, full_uri=false)
				raise "Can't get a resource list without a REST Client" unless @client
				@uri = full_uri ? @uri.split(@client.instance_variable_get(:@cloud_url))[1] : @uri

				response = @client.get(@uri, params)
				
				if response['data'].is_a?(Array) 
					client = @client
					class_list = []
					list_class = self.class
					instance_uri = full_uri ? @uri.split('?')[0] : @uri
					response['data'].each do |val|
						
						class_list << @instance_class.new( "#{instance_uri}/#{val[@instance_id_key]}", @client, val)
					end
					class_list.instance_eval do
						eigenclass = class << self; self; end
						
						eigenclass.send :define_method, :offset, &lambda {response['offset']}
						eigenclass.send :define_method, :limit, &lambda {response['limit']}
						eigenclass.send :define_method, :total, &lambda {response['total']}
	          			eigenclass.send :define_method, :next_page, &lambda {
		            			if response['next']
		            				
			              			list_class.new(response['next'], client).list({}, true)
			            		else
			              			[]
		            			end
		          		}
	          			eigenclass.send :define_method, :previous_page, &lambda {
	            			if response['previous']
	            				
	              				list_class.new(response['previous'], client).list({}, true)
	            			else
	              				[]
	            			end
	          			}
	          		end
				end
				class_list
			end
	end
end
