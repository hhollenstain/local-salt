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
  pkgrepo.managed:
    - ppa: lah7/polychromatic

chroma-razerdriver-ppa:
  pkgrepo.managed:
    - ppa: terrz/razerutils
