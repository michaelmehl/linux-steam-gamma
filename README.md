# Linux Steam Gamma

## Description

A solution to address steam applications or games on linux where gamma sliders do not work correctly. 

[Crytek application gamma slider doesn't work.](https://docs.cryengine.com/display/CRYAUTOGEN/CONSOLEPREFIXR#AnchorRGAMMA)

## Table of Contents

- [Requirements](#requirements)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Requirements

- X11

Like any good steward of a system, take and test a backup prior to running this script.

I may modify this to work with a wayland equivalent of xrandr.

## Features

    1: Checks if xrandr is installed.
    2: Checks which distribution and installs xrandr.
        https://www.x.org/releases/X11R7.5/doc/man/man1/xrandr.1.html
    3: Checks which version of Steam is installed.
    4: Checks active output via xrandr and asks user what gamma preferences they want.
    5: Creates two scripts, gamma_open.sh and gamma_close.sh with included xrandr commands derived from active 
        output in steam path.
    6: Generates a launch option for the user to copy paste for the application.
    
## Installation

```bash

# Download the shell script or clone this repository
# Make it executable using your download path.

#Example:
sudo chmod +x ~/Downloads/linux_steam_gamma.sh

#Change the --gamma switch to your preference on lines #48 and #59

# Execute it
~/Downloads/linux_steam_gamma.sh

# If needed, change --gamma again on the appropriate line.
# Execute as necessary to adjust.

```

## Usage
Adjust it.

Execute it. You may need to adjust which active output is set in the script if you have multiple montiors.

Copy the provided output to app/game -> properties -> general -> launch options.

If you already have modifications, take care to not overwrite, but append.

## Contributing

1. Fork the repository.
2. Create a new branch.
3. Make your changes and commit.
4. Push to the branch.
5. Submit a pull request.

This project is licensed under the [MIT License](LICENSE).