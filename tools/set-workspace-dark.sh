#!/bin/zsh

if ! defaults read -g AppleInterfaceStyle &> /dev/null; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
else
    echo "Dark Mode is already activated [✅]";
fi

if [ -d "$HOME/goinfre/.brew" ]; then
    echo "brew already installed [✅]";
else
    echo "Intstall Brew......";
    git clone --depth=1 https://github.com/Homebrew/brew ~/goinfre/.brew;
fi

export PATH="$HOME/goinfre/.brew/bin:$HOME/goinfre/.brew/sbin:$PATH"

