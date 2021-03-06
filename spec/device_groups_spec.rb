require 'spec_helper'
require 'json'
describe TestdroidAPI::DeviceGroup do
  before :all do
    VCR.use_cassette('dg_oauth2_auth_device_groups') do
      @user = client.authorize
    end
  end
  
  it 'get device groups' do 

    VCR.use_cassette('dg_all_device_groups') do
      
      device_groups = @user.device_groups
      device_groups.total.should eq(1) 
      
    end
  end
   it 'get device group using id' do 
    
     VCR.use_cassette('dg_device_group_4165') do
      device_group_4165 = @user.device_groups.get(4165)
      device_group_4165.id.should eq(4165) 
      device_group_4165.display_name.should eq("testi grouppen")
      
     end
   end
end
