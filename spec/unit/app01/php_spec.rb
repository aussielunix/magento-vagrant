require_relative '../spec_helper'

describe package('php5') do
  it { should be_installed }
end

describe package('php5-fpm') do
  it { should_not be_installed }
end

describe service('php-fpm') do
  it { should_not be_running   }
end

describe file('/etc/php5/apache2/php.ini') do
  it { should be_file }
  its(:content) { should match /memory_limit/ }
end
