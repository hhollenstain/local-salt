include:
  - core

work-packages:
  pkg.installed:
    - pkgs:
      - slack-desktop
      - nautilus-dropbox
      - python-pip
    - skip_verify: True
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
    - user: {{pillar['user']}}
    - require:
      - pkg: work-packages
