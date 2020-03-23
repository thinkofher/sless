# name: benor
# author: Beniamin Dudek <beniamin.dudek@yahoo.com>

function fish_prompt --description 'Write out the prompt'
    set -g __fish_git_prompt_color red
    set -g __fish_git_prompt_color_prefix blue
    set -g __fish_git_prompt_color_suffix blue

    # Fish git prompt
    set -g __fish_git_prompt_showdirtystate 'yes'
    set -g __fish_git_prompt_showstashstate 'yes'
    set -g __fish_git_prompt_showuntrackedfiles 'yes'
    set -g __fish_git_prompt_showupstream 'yes'
    set -g __fish_git_prompt_color_branch red
    set -g __fish_git_prompt_color_upstream_ahead green
    set -g __fish_git_prompt_color_stagedstate green
    set -g __fish_git_prompt_color_upstream_behind red
    set -g __fish_git_prompt_color_dirtystate yellow

    # Status Chars
    # set -g __fish_git_prompt_char_dirtystate '⚡'
    # set -g __fish_git_prompt_char_stagedstate '→'
    # set -g __fish_git_prompt_char_untrackedfiles '☡'
    # set -g __fish_git_prompt_char_stashstate '↩'
    # set -g __fish_git_prompt_char_upstream_ahead '+'
    # set -g __fish_git_prompt_char_upstream_behind '-'


    echo -n '['
    set_color green; echo -n (whoami)'@'(hostname -s)
    set_color cyan; echo -n ' '(basename (prompt_pwd))
    set_color normal; echo -n (__fish_git_prompt)
    set_color normal; echo -n ']'
    set_color purple; echo '$ '
end
