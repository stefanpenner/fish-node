function node-set -a input_version
  set -l _version (node-version-match "$input_version")
  set -l filename "node-$_version-$_node_current_platform/bin"

  if test -e "$FISH_NODE_ROOT/versions/$filename"
    set -gx PATH "$FISH_NODE_ROOT/versions/$filename" $PATH
    __echo-success "node.current = $_version"
  else
    __echo-failure  "node.current = $_version; not installed"
  end
end
