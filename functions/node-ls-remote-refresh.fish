function node-ls-remote-refresh
  rm $FISH_NODE_ROOT/cache/versions.json
  node-ls-remote
end
