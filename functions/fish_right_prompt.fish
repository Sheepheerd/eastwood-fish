function fish_right_prompt
    if test -s ~/.rvm/scripts/rvm
        set_color yellow
        echo -n "rvm:"
        set_color red
        echo -n (command ~/.rvm/bin/rvm-prompt)
    else if type -q rbenv
        set_color yellow
        echo -n "rbenv:"
        set_color red
        echo -n (rbenv version | sed -e 's/ (set.*$//')
    end
    set_color normal
end
