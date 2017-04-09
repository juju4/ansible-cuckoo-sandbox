require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe package('virtualbox-5.1'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_installed }
end
describe package('VirtualBox-5.1'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe file('/usr/bin/virtualbox') do
  it { should be_executable }
end

describe command('vboxmanage -v') do
  its(:stdout) { should match /5.1/ }
  its(:exit_status) { should eq 0 }
  let(:sudo_options) { '-u _cuckoo -H' }
end

