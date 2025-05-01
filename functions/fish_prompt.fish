function fish_prompt
    set -l blue (set_color blue)
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l normal (set_color normal)

    set -l arrow "∫"
    set -l cwd $blue(prompt_pwd)

    set -l git_branch (_git_branch_name)
    set -l git_vs_upstream (_git_up_info)
    set -l dirty (_is_git_dirty)

    if test -n "$git_branch"
        if test -n "$dirty"
            set git_info $yellow'('$git_branch "±" "$git_vs_upstream"')' $normal
        else if test -n "$git_vs_upstream"
            set git_info $yellow'('$git_branch "$git_vs_upstream"')' $normal
        else
            set git_info $green'('$git_branch')' $normal
        end
    else
        set git_info ''
    end

    echo -n -s $cwd' ' "$git_info" $arrow ' '
end
