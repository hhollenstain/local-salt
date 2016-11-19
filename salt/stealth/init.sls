stealth-packages:
  pkg.installed:
    - pkgs:
      - polychromatic
      - python3-razer
      - razer-kernel-modules-dkms
      - razer-daemon
      - razer-doc
    - require:
      - pkgrepo: razerdriver-ppa
      - pkgrepo: polychromatic-ppa

polychromatic-ppa:
  pkgrepo.absent:
    - ppa: lah7/polychromatic

razerdriver-ppa:
  pkgrepo.abset:
    - ppa: terrz/razerutils
