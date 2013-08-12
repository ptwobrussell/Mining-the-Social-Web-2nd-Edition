name             "mtsw2e"
maintainer       "marsam"
maintainer_email "rodasmario2@gmail.com"
license          "MIT"
description      "Installs/Configures mtsw2e"
version          "0.2.0"

depends "apt", "~> 2.0.0"         # ref: 6ae0c74
depends "runit", "<= 1.0.4"       # ref: bf23c97
depends "python", "~> 1.3.6"      # ref: ff36893

supports "ubuntu"
