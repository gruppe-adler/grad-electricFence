# GRAD Electric Fence (WIP)
Library for electrifying fences in Arma 3.

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)
* [ACE3](https://github.com/acemod/ACE3)

# Installation
Append the following lines of code to the `description.ext`:

```sqf
class CfgFunctions {
    #include "node_modules\grad-electricFence\cfgFunctions.hpp"
};
```

If you want to use a different path instead of `node_modules`, prepend your mission's `description.ext` with

```
#define MODULES_DIRECTORY <YOUR PATH>
```

## Manually
1. Create a folder in your mission root folder and name it `node_modules`. Inside that folder, create another folder and name it `grad-passport`.
2. Download the [latest version](https://github.com/gruppe-adler/grad-passport/releases) of this module, then put it into the folder you just created.

## Via `npm`
_for details about what npm is and how to use it, look it up on [npmjs.com](https://www.npmjs.com/)_

1. Install package `grad-electricFence` : `npm install --save grad-electricFence`

# Usage

# Implementation
