# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class bigtop_toolchain::ant {

  include bigtop_toolchain::deps

  exec {'/bin/tar xvzf /usr/src/apache-ant-1.9.2-bin.tar.gz':
    cwd         => '/usr/local',
    refreshonly => true,
    subscribe   => Exec["/usr/bin/wget http://mirrors.ibiblio.org/apache//ant/binaries/apache-ant-1.9.2-bin.tar.gz"],
    require     => Exec["/usr/bin/wget http://mirrors.ibiblio.org/apache//ant/binaries/apache-ant-1.9.2-bin.tar.gz"],
  }

  file {'/usr/local/ant':
    ensure  => link,
    target  => '/usr/local/apache-ant-1.9.2',
    require => Exec['/bin/tar xvzf /usr/src/apache-ant-1.9.2-bin.tar.gz'],
  }
}
