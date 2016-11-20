include:
  - core

work-packages:
  pkg.installed:
    - pkgs:
      - slack-desktop
      - nautilus-dropbox
      - python-pip
    - require:
      - pkgrepo: slack-package-repository

slack-package-repository:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main
    - humanname: slack
    - file: /etc/apt/sources.list.d/slack.list

pip_install_awscli:
  pip.installed:
    - name: awscli
    - require:
      - pkg: work-packages
