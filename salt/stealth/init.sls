stealth-core-packages:
  pkg.installed:
    - pkgs:
      - libinput-tools
      - wmctrl
      - xdotool

install-libinput-gestures:
  cmd.run:
    - name: |
        cd ~/stealth/tools/libinput-gestures
        make install
    - shell: /bin/bash
    - timeout: 300
    - unless: test -x /etc/libinput-gestures.conf
    - require:
      - git.latest: libinput-gestures

libinput-gestures:
  git.latest:
    - name: https://github.com/bulletmark/libinput-gestures.git
    - target: ~/stealth/tools/libinput-gestures
    - require:
      - file.directory: ~/stealth/tools

~/stealth/tools:
  file.directory:
    - user: {{pillar['stealth']['user']}}
    - group: {{pillar['stealth']['group']}}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
