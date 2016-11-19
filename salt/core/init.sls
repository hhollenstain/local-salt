core-packages:
  pkg.installed:
    - pkgs:
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
      - slack-desktop
      - screen
      - telnet
      - terminator
      - traceroute
      - unity-tweak-tool
      - vim
      - wget
    - require:
      - pkgrepo: docker-package-repository
      - pkgrepo: slack-package-repository
      - pkgrepo: google-chrome-package-repository
      - pkgrepo: numix-ppa

#core-docker-packages:
#  pkg.installed:
#    - pkgs:
#      - docker-engine
#    - require:
#      - pkgrepo: docker-package-repository

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

slack-package-repository:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main
    - humanname: slack
    - file: /etc/apt/sources.list.d/slack.list

numix-ppa:
  pkgrepo.absent:
    - ppa: numix/ppa
