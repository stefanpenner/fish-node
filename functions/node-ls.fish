function node-ls -a _version
  for node in (ls "$FISH_NODE_ROOT/versions" | grep "$_version")
    echo $node | cut -d '-' -f 2
  end
end
