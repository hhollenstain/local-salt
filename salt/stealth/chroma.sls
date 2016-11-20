chroma-packages:
  pkg.installed:
    - pkgs:
      - polychromatic
      - python3-razer
      - razer-kernel-modules-dkms
      - razer-daemon
      - razer-doc
    - require:
      - pkgrepo: chroma-razerdriver-ppa
      - pkgrepo: chroma-polychromatic-ppa

chroma-polychromatic-ppa:
  pkgrepo.absent:
    - ppa: lah7/polychromatic

chroma-razerdriver-ppa:
  pkgrepo.absent:
    - ppa: terrz/razerutils
