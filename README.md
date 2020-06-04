# flying_rocket

This is a small game where you have to maneuver a rocket from one location to another without crashing it.

# Running the game

The ready-to-be-run game is in the `game` directory. Just run it with löve.

# Development

Mandatory dependencies:

-   NodeJS (https://nodejs.org/en/)
-   Yarn (https://yarnpkg.com/)
-   love2d (https://love2d.org/)
-   LuaFileSystem (http://keplerproject.github.io/luafilesystem/index.html)

Recommended way of installing LFS is using hererocks (https://github.com/mpeterv/hererocks). Guide for Windows:

Python (https://www.python.org/) needs to be installed.

Open cmd, then type these commands:

```bash
python -m pip install hererocks
#go into the folder where you wanna have lua installed then proceed:
hererocks --luajit 2.1.0-beta3 -rlatest luajit
.\luajit\bin\activate.bat
luarocks install luafilesystem
```

Copy the file luajit/lib/lua/5.1/lfs.dll into the love2d directory, for default install this would be C:\Program Files\LOVE.
