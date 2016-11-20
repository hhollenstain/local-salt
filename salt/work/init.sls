include:
  - core

work-packages:
  pkg.installed:
    - pkgs:
      - slack-desktop
    - require:
      - pkgrepo: slack-package-repository

slack-package-repository:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main
    - humanname: slack
    - file: /etc/apt/sources.list.d/slack.list
