case node[:platform_version].to_i
when 7
  remote_file "/etc/yum.repos.d/google.chrome.repo" do
    owner "root"
    group "root"
    mode  "644"
  end

  %w{google-chrome-stable ipa-pgothic-fonts.noarch}.each do |pkg|
    package pkg
  end

  execute "install chromedriver" do
    user "root"
    command <<-EOS
      wget http://chromedriver.storage.googleapis.com/#{node[:selenium][:chrome][:driver_version]}/chromedriver_linux64.zip
      unzip chromedriver_linux64.zip
      mv chromedriver /usr/local/bin
      rm chromedriver_linux64.zip
    EOS
    not_if "test -e /usr/local/bin/chromedriver"
  end
end