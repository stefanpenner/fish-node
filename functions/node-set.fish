function node-set -a input_version
  set -l _version (node-version-match "$input_version")
  set -l filename "node-$_version-$_node_current_platform/bin"
  set -l fullpath "$FISH_NODE_ROOT/versions/$filename"

  if test -n $LAST_NODE_SET
    set -l index (contains -i $LAST_NODE_SET $PATH)
    if test "$index" -gt 0
      set -ge PATH[$index]
    end
  end

  if test -e "$FISH_NODE_ROOT/versions/$filename"
    set -gx PATH $fullpath $PATH
    set -gx LAST_NODE_SET $fullpath
    __echo-success "node.current = $_version"
  else
    node-get $input_version
    if test -e "$FISH_NODE_ROOT/versions/$filename"
      set -gx PATH $fullpath $PATH
      set -gx LAST_NODE_SET $fullpath
      __echo-success "node.current = $_version"
    else
    __echo-failure  "node.current = $_version; not installed"
    end
  end
end
