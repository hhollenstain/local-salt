core-packages:
  pkg.installed:
    - pkgs:
      - chromium-browser
      - docker-engine
      - dstat
      - fonts-powerline
      - git
      - google-chrome-stable
      - iotop
      - lsof
      - mtr
      - numix-icon-theme
      - numix-icon-theme-circle
      - numix-gtk-theme
      - powerline
      - rsync
      - screen
      - telnet
      - terminator
      - traceroute
      - unity-tweak-tool
      - vim
      - wget
      - zsh
    - skip_verify: True
    - require:
      - pkgrepo: docker-package-repository
      - pkgrepo: google-chrome-package-repository
      - pkgrepo: numix-ppa

docker-package-repository:
  pkgrepo.managed:
    - name: deb https://apt.dockerproject.org/repo {{ grains["os"]|lower }}-{{ grains["oscodename"] }} main
    - humanname: {{ grains["os"] }} {{ grains["oscodename"]|capitalize }} Docker Package Repository
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: hkp://p80.pool.sks-keyservers.net:80
    - file: /etc/apt/sources.list.d/docker.list

google-chrome-package-repository:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
    - humanname: google-chrome
    - file: /etc/apt/sources.list.d/google-chrome.list

numix-ppa:
  pkgrepo.managed:
    - ppa: numix/ppa

#oh-my-zsh:
#  cmd.run:
#    - name: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#    - shell: /bin/bash
#    - timeout: 300
#    - unless: test -e /home/{{pillar['user']}}/.oh-my-zsh
#    - require:
#      - pkg: core-packages
