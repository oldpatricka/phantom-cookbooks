set_unless[:virtualenv][:python] = "python"
set_unless[:virtualenv][:virtualenv] = "virtualenv"
set_unless[:opentsdbproxy][:git_repo] = "https://github.com/nimbusproject/opentsdbproxy.git"
set_unless[:opentsdbproxy][:git_branch] = "master"
set_unless[:opentsdbproxy][:extras] = "django_authz"
set_unless[:opentsdbproxy][:port] = 5252
set_unless[:opentsdbproxy][:opentsdb_host] = "localhost"
set_unless[:opentsdbproxy][:opentsdb_port] = 4242
set_unless[:opentsdbproxy][:supervisorctl_path] = "supervisorctl"
set_unless[:opentsdbproxy][:supervisord_path] = "supervisord"