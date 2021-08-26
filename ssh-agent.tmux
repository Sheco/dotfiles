# Add this to your .bashrc and run the function when you need 
# to update your SSH_AGENT environment variable

fixssh() {
    eval $(tmux show-env    \
        |sed -n 's/^\(SSH_[^=]*\)=\(.*\)/export \1="\2"/p')
}

