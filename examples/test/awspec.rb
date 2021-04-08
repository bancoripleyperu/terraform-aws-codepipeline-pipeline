require 'awspec'
require 'aws-sdk'

service_name = 'titan-dev-test'

describe codebuild(service_name.to_s) do
    it { should exist }
end