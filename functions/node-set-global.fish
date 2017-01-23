function node-set-global -a input_version
  set -l _version (node-version-match "$input_version")
  set -l filename "node-$_version-$_node_current_platform/bin"
  set -l target  "$FISH_NODE_ROOT/default/bin"

  if test -e "$FISH_NODE_ROOT/versions/$filename"
    rm -rf $target
    ln -s "$FISH_NODE_ROOT/versions/$filename" $target

    __echo-success "node.global = $_version"
  else
    __echo-failure  "node.current = $_version; not installed"
  end
end
