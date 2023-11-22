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
- Flatpack Steam

This solution has only been tested on POP!_OS and Fedora. 

Like any good steward of a system, take and test a backup prior to running this script.

I may modify this to work with a wayland equivalent of xrandr.

## Features

    1: Checks which distribution and installs xrandr.
    2: Checks current user and the active output via xrandr.
    3: Creates two scripts, open and close.sh with included xrandr commands derived from active 
    output in flatpack steam path.
    4: Generates a launch option for the user to copy paste for the application.
    
## Installation

```bash

# Download the shell script or clone this repository
# Make it executable using your download path.

#Example:
sudo chmod +x ~/Downloads/linux_steam_gamma.sh

#Change the --gamma switch to your preference on lines #48 and #59

# Execute it
sudo ~/Downloads/linux_steam_gamma.sh

# If needed, change --gamma again on the appropriate line.
# Execute as necessary to adjust.

```

## Usage
Adjust it.

Execute it.

Copy the provided output to app/game -> properties -> general -> launch options.

If you already have modifications, take care to not overwrite, but append.

## Contributing

1. Fork the repository.
2. Create a new branch.
3. Make your changes and commit.
4. Push to the branch.
5. Submit a pull request.

This project is licensed under the [MIT License](LICENSE).