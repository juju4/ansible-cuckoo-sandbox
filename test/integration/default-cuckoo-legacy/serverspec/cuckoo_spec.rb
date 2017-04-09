require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe package('tcpdump') do
  it { should be_installed }
end

describe file('/var/_cuckoo/cuckoo/cuckoo.py') do
  it { should be_executable }
end

describe command('/var/_cuckoo/cuckoo/cuckoo.py -v') do
  its(:stderr) { should match /You are running Cuckoo Sandbox/ }
  its(:exit_status) { should eq 0 }
  let(:sudo_options) { '-u _cuckoo -H' }
end

describe command('/var/_cuckoo/cuckoo/cuckoo.py -t') do
  its(:stdout) { should match /Cuckoo Sandbox/ }
  its(:stdout) { should_not match /CuckooStartupError/ }
  its(:stdout) { should_not match /Permission denied/ }
  its(:exit_status) { should eq 0 }
  let(:sudo_options) { '-u _cuckoo -H' }
end

