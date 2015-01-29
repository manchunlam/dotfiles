# Setting up Server with `dotfiles`

## Table of Contents

1. [Create Symlinks](#i-create-symlinkes)
2. [`vim`](#ii-vim)
    1. [Plugin](#a-plugin)
    2. [Plugin Specific Instructions](#b-plugin-specific-instructions)

## I. Create Symlinks

```sh
cd dotfiles
./setup.sh
```

## II. `vim`

### A. Plugin

1. Initialize Plugin after First-Time Cloning Repo

    ```sh
    cd dotfiles
    git submodule init
    git submodule update
    ```

2. Install New Plugin

    1. Link to the new plugin

        ```sh
        cd dotfiles
        git submodule add http://github.com/tpope/vim-fugitive.git .vim/bundle/fugitive
        git add .
        git commit -m "Install Fugitive.vim bundle as a submodule."
        ```

    2.  Switch to the `dotfiles` directory, and fetch submodules:

        ```sh
        cd dotfiles
        git submodule init
        git submodule update
        ```

3. Upgrade Existing Plugins

    ```sh
    cd dotfiles
    git submodule foreach git pull origin master
    git add .vim/bundle
    git commit
    git push origin master
    ```

### B. Plugin Specific Instructions

1. `Command-T`

    `vim` **must** be compiled with ruby support

    ```sh
    vim --version | grep 'ruby'
    ```

    If you see a "+" next to "ruby", you are good. Otherwise, you have to
    recompile `vim` with ruby support.

    1. Check global version of ruby

        ```sh
        rbenv global
        # or
        # `ruby --version`
        ```

    2. Go to `command-t`, check the ruby version in that directory

        ```sh
        cd dotfiles/.vim/bundle/Command-T/ruby/command-t
        rbenv version
        # or
        # `ruby --version`
        ```

    3. If the global and local versions are not the same, make the local version
        the same as that of global

        ```
        cd ~/dotfiles/.vim/bundle/Command-T/ruby/command-t
        rbenv local <globalVersion>
        ruby extconf.rb
        sudo make install
        make distclean
        ```
