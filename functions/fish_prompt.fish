function fish_prompt
    set_color green
    set git_branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
    if test -n "$git_branch"
        set dirty (test -n (git status --porcelain ^/dev/null) && echo '*' || echo '')
        echo -n "[$git_branch$dirty]"
    end

    set_color cyan
    echo -n "[(prompt_pwd)] "
    set_color normal
    echo -n (set_color --bold)"$ "(set_color normal)
end
