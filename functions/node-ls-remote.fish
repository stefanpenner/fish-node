function node-ls-remote -a _version
  if test (get_file_age $FISH_NODE_ROOT/cache/versions.json) -gt 86400
    rm -rf $FISH_NODE_ROOT/cache/versions.json
  end

  if not test -e $FISH_NODE_ROOT/cache/versions.json
    curl https://nodejs.org/download/release/index.json 2> /dev/null > $FISH_NODE_ROOT/cache/versions.json
  end

  cat $FISH_NODE_ROOT/cache/versions.json | jq -r '.[].version' | grep "$_version"
end
