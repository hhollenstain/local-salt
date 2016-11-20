include:
  - .chroma
  - core

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
    - unless: test -e /etc/libinput-gestures.conf
    - require:
      - git: libinput-gestures

libinput-gestures:
  git.latest:
    - name: https://github.com/bulletmark/libinput-gestures.git
    - target: /home/{{pillar['stealth']['user']}}/stealth/tools/libinput-gestures
    - require:
      - file: /home/{{pillar['stealth']['user']}}/stealth/tools

/home/{{pillar['stealth']['user']}}/stealth/tools:
  file.directory:
    - user: {{pillar['stealth']['user']}}
    - group: {{pillar['stealth']['group']}}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
