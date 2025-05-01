# name: Eastwood (Taken from Integral)
function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _upstream_count
  echo (command git rev-list --count --left-right origin/(_git_branch_name)...HEAD 2> /dev/null)
end

function _git_up_info
  if [ (_upstream_count) ]
    set -l count (_upstream_count)


    if test -z "$count"
        echo ''

    else if string match -rq '^0.0$' -- $count
        echo ''
    else if string match -rq '^0..$' -- $count
        echo '+'
    else if string match -rq '^..0$' -- $count
            echo '-'
    end

  end
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l blue (set_color blue)
  set -l normal (set_color normal)
  set -l green (set_color green)
  set -l red (set_color red)

  set -l cwd $blue"["(prompt_pwd)"]\$"

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set -l git_vs_upstream (_git_up_info)

    if [ (_is_git_dirty) ]
      set git_info $red'('$git_branch"$git_vs_upstream"')'
    else if [ (_git_up_info) ]
      set git_info $green'('$git_branch"$git_vs_upstream"')'
    else
      set git_info $green'('$git_branch')'
    end
  end

  echo -n -s "$git_info"$cwd'' $normal' '
end

function fish_right_prompt
  set -l dark_gray (set_color 222)
  set -l green (set_color green)

  echo -n -s $green

end
