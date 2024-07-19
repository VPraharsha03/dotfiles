load(io.popen('oh-my-posh init cmd --config %POSH_THEMES_PATH%/gruvbox-rainbow.json'):read("*a"))()
os.execute('fastfetch --logo %USERPROFILE%/.config/fastfetch/ascii.txt')
os.execute('doskey /macrofile=%LOCALAPPDATA%/clink/aliases')
