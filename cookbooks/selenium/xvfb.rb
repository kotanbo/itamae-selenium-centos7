package "xorg-x11-server-Xvfb"

case node[:platform_version].to_i
when 7
  remote_file "/usr/lib/systemd/system/Xvfb.service" do
    owner "root"
    group "root"
    mode  "644"
  end
  remote_file "/etc/sysconfig/Xvfb" do
    owner "root"
    group "root"
    mode  "644"
  end
when 6
  remote_file "/etc/init.d/Xvfb" do
    owner "root"
    group "root"
    mode  "755"
  end
  execute "add Xvfb service" do
    user "root"
    command "chkconfig --add Xvfb"
    not_if "test -n \"$(chkconfig --list | grep 'Xvfb')\""
  end
end

service "Xvfb" do
  action [:enable, :start]
end
