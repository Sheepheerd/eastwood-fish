function fish_right_prompt
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l normal (set_color normal)

    if test -s ~/.rvm/scripts/rvm
        echo -n "$yellow"rvm":"$red(command ~/.rvm/bin/rvm-prompt)"$normal"
    else if type -q rbenv
        echo -n "$yellow"rbenv":"$red(rbenv version | string replace -r ' \(set.*$' '')"$normal"
    end
end
