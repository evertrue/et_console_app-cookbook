require 'spec_helper'

describe 'et_console_app::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['apache']['root_group'] = 'root'
      node.set['et_console_app']['deploy_to'] = '/var/www/console.evertrue.com'
      node.set['apache']['group'] = 'www-data'
      node.set['apache']['dir'] = '/etc/apache2'
    end.converge(described_recipe)
  end

  it 'includes apt::default' do
    expect(chef_run).to include_recipe 'apt::default'
  end

  it 'creates /etc/apache2/conf.d/h5bp.conf' do
    expect(chef_run).to create_cookbook_file_if_missing('/etc/apache2/conf.d/h5bp.conf').with(
      user: 'root',
      # group: node['apache']['root_group'],
      mode: '0644'
    )
  end

  it 'includes apache2::default' do
    expect(chef_run).to include_recipe 'apache2::default'
  end

  %w(/var/www/console.evertrue.com /var/www/web.evertrue.com).each do |path|
    it "creates directory #{path}" do
      expect(chef_run).to create_directory(path).with(
        user: 'deploy',
        group: node['apache']['group'],
        mode: '2775'
      )
    end
  end
end
