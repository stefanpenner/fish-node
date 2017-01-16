set -g FISH_NODE_ROOT $HOME/.config/node
set -g FISH_NODE_REMOTE "https://nodejs.org/download/release"

function _get_node_current_platform
  set -l os (uname -s)
  set -l arch (uname -m)
  set -l x (echo $os | tr '[A-Z]' '[a-z]')
  set -l y (echo $arch | sed s/86_//)

  echo "$x-$y"
end

set -g _node_current_platform (_get_node_current_platform)

function __echo-success -a message
  set_color green;
  printf "  ✓ ";
  set_color normal;
  echo "$message";
end

function __echo-failure -a message
  set_color red;
  printf "  ✗ ";
  set_color normal;
  echo "$message"
end

function node-setup
  mkdir -p $FISH_NODE_ROOT/{versions,default,tarballs,checksums,cache}
end

node-setup
# clean_node_version v6.7.0
# node-isntall v6.7.0
# node-isntall v4.7.0
# node-ls
# node-ls-remote

if test -f $HOME/.config/node/default/bind
  set -gx PATH $HOME/.config/node/default/bin $PATH
end

# enable global yarn bins
set -gx PATH $HOME/.yarn-config/global/node_modules/.bin $PATH
