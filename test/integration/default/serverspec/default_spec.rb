require 'spec_helper'

describe 'Apache Service' do
  %w(8080).each do |port|
    describe port(port) do
      it { should be_listening }
    end
  end

  describe service('apache2') do
    it { should be_running }
    it { should be_enabled }
  end
end

describe 'Apache Virtual Hosts' do
  apache_dir = '/etc/apache2'

  %w(deflate expires headers rewrite).each do |mod|
    describe file("#{apache_dir}/mods-enabled/#{mod}.load") do
      it { should be_linked_to("../mods-available/#{mod}.load") }
    end
  end

  describe file("#{apache_dir}/ports.conf") do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode '644' }
    its(:content) { should match(/Listen \*:8080\nNameVirtualHost \*:8080/) }
  end

  describe file("#{apache_dir}/conf.d/h5bp.conf") do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode '644' }
  end

  %w(console web).each do |app|
    docroot = "/var/www/#{app}.evertrue.com"

    describe file(docroot) do
      it { should be_directory }
      it { should be_owned_by 'deploy' }
      it { should be_grouped_into 'www-data' }
      it { should be_mode '2775' }
    end

    describe file("#{apache_dir}/sites-enabled/#{app}.conf") do
      it { should be_linked_to("../sites-available/#{app}.conf") }
    end

    describe file("#{apache_dir}/sites-available/#{app}.conf") do
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode '644' }
      its(:content) { should include "ServerName local-#{app}.evertrue.com" }
      its(:content) { should include "DocumentRoot #{docroot}" }
    end
  end
end

describe 'Supporting functionality for Console/Web' do
  describe package('git') do
    it { should be_installed }
  end

  %w(node npm bower grunt).each do |bin|
    describe command("which #{bin}") do
      its(:stdout) { should include bin }
    end
  end
end
