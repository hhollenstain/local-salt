# local-salt

## Install
Included in the local-salt repo is an simple install script that will install the
salt-minion and update configs.

Help output:
```bash
./install.sh -h
Options:
 -s -- install salt-minion and configs
 -c -- update saltconfigs
 -h -- display this usage information
```

Quick setup:
This will install the salt-minion and copy the salt-configs (states and pillar)
```bash
./install.sh -s
```
Config update:
If the sates/pillars get updated locally or in the repo just use the c flag
```bash
./install.sh -c
```
## States
There will be several top level states to work with currently are listed as such:

### Core
Core state will contain all the packages and configurations all my machines will
use.
```bash
sudo salt-call state.sls core
local:
----------
          ID: docker-package-repository
    Function: pkgrepo.managed
        Name: deb https://apt.dockerproject.org/repo ubuntu-xenial main
      Result: True
     Comment: Package repo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' already configured
     Started: 00:36:13.600366
    Duration: 53.886 ms
     Changes:   
----------
          ID: google-chrome-package-repository
    Function: pkgrepo.managed
        Name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
      Result: True
     Comment: Package repo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' already configured
     Started: 00:36:13.654360
    Duration: 44.585 ms
     Changes:   
----------
          ID: numix-ppa
    Function: pkgrepo.absent
      Result: True
     Comment: Package repo ppa:numix/ppa is absent
     Started: 00:36:13.699050
    Duration: 43.851 ms
     Changes:   
----------
          ID: core-packages
    Function: pkg.installed
      Result: True
     Comment: All specified packages are already installed
     Started: 00:36:13.743126
    Duration: 533.691 ms
     Changes:   
----------
          ID: oh-my-zsh
    Function: cmd.run
        Name: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      Result: True
     Comment: unless execution succeeded
     Started: 00:36:14.278019
    Duration: 5.242 ms
     Changes:   

Summary for local
------------
Succeeded: 5
Failed:    0
------------
Total states run:     5
Total run time: 681.255 ms
```

### stealth
The stealth state will be used only on my stealth laptop as it contains specifics
such as razer drivers for the chroma devices attached to it. It will also handle
more hardware specific support such as gesture control.

```bash
sudo salt-call state.sls stealth
local:
----------
          ID: chroma-razerdriver-ppa
    Function: pkgrepo.absent
      Result: True
     Comment: Package repo ppa:terrz/razerutils is absent
     Started: 00:36:56.076012
    Duration: 55.05 ms
     Changes:   
----------
          ID: chroma-polychromatic-ppa
    Function: pkgrepo.absent
      Result: True
     Comment: Package repo ppa:lah7/polychromatic is absent
     Started: 00:36:56.131172
    Duration: 49.795 ms
     Changes:   
----------
          ID: chroma-packages
    Function: pkg.installed
      Result: True
     Comment: All specified packages are already installed
     Started: 00:36:56.181193
    Duration: 557.674 ms
     Changes:   
----------
          ID: docker-package-repository
    Function: pkgrepo.managed
        Name: deb https://apt.dockerproject.org/repo ubuntu-xenial main
      Result: True
     Comment: Package repo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' already configured
     Started: 00:36:56.739751
    Duration: 48.824 ms
     Changes:   
----------
          ID: google-chrome-package-repository
    Function: pkgrepo.managed
        Name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
      Result: True
     Comment: Package repo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' already configured
     Started: 00:36:56.788689
    Duration: 45.331 ms
     Changes:   
----------
          ID: numix-ppa
    Function: pkgrepo.absent
      Result: True
     Comment: Package repo ppa:numix/ppa is absent
     Started: 00:36:56.834132
    Duration: 81.232 ms
     Changes:   
----------
          ID: core-packages
    Function: pkg.installed
      Result: True
     Comment: All specified packages are already installed
     Started: 00:36:56.915662
    Duration: 3.455 ms
     Changes:   
----------
          ID: oh-my-zsh
    Function: cmd.run
        Name: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      Result: True
     Comment: unless execution succeeded
     Started: 00:36:56.919866
    Duration: 5.284 ms
     Changes:   
----------
          ID: stealth-core-packages
    Function: pkg.installed
      Result: True
     Comment: All specified packages are already installed
     Started: 00:36:56.925343
    Duration: 3.779 ms
     Changes:   
----------
          ID: /home/hhollenstain/stealth/tools
    Function: file.directory
      Result: True
     Comment: Directory /home/hhollenstain/stealth/tools is in the correct state
     Started: 00:36:56.937616
    Duration: 13.423 ms
     Changes:   
----------
          ID: libinput-gestures
    Function: git.latest
        Name: https://github.com/bulletmark/libinput-gestures.git
      Result: True
     Comment: Repository /home/hhollenstain/stealth/tools/libinput-gestures is up-to-date, but with local changes. Set 'force_reset' to True to purge local changes.
     Started: 00:36:56.951228
    Duration: 519.435 ms
     Changes:   
----------
          ID: install-libinput-gestures
    Function: cmd.run
        Name: cd ~/stealth/tools/libinput-gestures
make install

      Result: True
     Comment: unless execution succeeded
     Started: 00:36:57.471201
    Duration: 8.079 ms
     Changes:   

Summary for local
-------------
Succeeded: 12
Failed:     0
-------------
Total states run:     12
Total run time:    1.391 s
```

### Work
The Work state will handle everything that is work related only such as slack,
dropbox, etc.

```bash
sudo salt-call state.sls work   
local:
----------
          ID: docker-package-repository
    Function: pkgrepo.managed
        Name: deb https://apt.dockerproject.org/repo ubuntu-xenial main
      Result: True
     Comment: Package repo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' already configured
     Started: 00:37:18.433732
    Duration: 55.819 ms
     Changes:   
----------
          ID: google-chrome-package-repository
    Function: pkgrepo.managed
        Name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
      Result: True
     Comment: Package repo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' already configured
     Started: 00:37:18.489708
    Duration: 47.83 ms
     Changes:   
----------
          ID: numix-ppa
    Function: pkgrepo.absent
      Result: True
     Comment: Package repo ppa:numix/ppa is absent
     Started: 00:37:18.537676
    Duration: 47.541 ms
     Changes:   
----------
          ID: core-packages
    Function: pkg.installed
      Result: True
     Comment: All specified packages are already installed
     Started: 00:37:18.585505
    Duration: 562.06 ms
     Changes:   
----------
          ID: oh-my-zsh
    Function: cmd.run
        Name: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      Result: True
     Comment: unless execution succeeded
     Started: 00:37:19.148817
    Duration: 6.932 ms
     Changes:   
----------
          ID: slack-package-repository
    Function: pkgrepo.managed
        Name: deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main
      Result: True
     Comment: Package repo 'deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main' already configured
     Started: 00:37:19.156316
    Duration: 50.911 ms
     Changes:   
----------
          ID: work-packages
    Function: pkg.installed
      Result: True
     Comment: All specified packages are already installed
     Started: 00:37:19.207391
    Duration: 3.891 ms
     Changes:   

Summary for local
------------
Succeeded: 7
Failed:    0
------------
Total states run:     7
Total run time: 774.984 ms
```
