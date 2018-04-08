function node-install -a input_version
  set -l _version (node-version-match $input_version)

  if test -s $_version
    __echo-failure "no such version: $input_version"
    return 1
  end

  echo " installing: node.version = $_version"

  set -l filename "node-$_version-$_node_current_platform.tar.gz"
  set -l tarball "$FISH_NODE_ROOT/tarballs/$filename"
  set -l target "$FISH_NODE_ROOT/versions/node-$_version-$_node_current_platform/"
  set -l shasumText "$FISH_NODE_ROOT/checksums/$_version-SHASUMS256.txt"

  if not test -e $tarball
    echo "$FISH_NODE_REMOTE/$_version/$filename"
    curl --fail --progress "$FISH_NODE_REMOTE/$_version/$filename" > "$tarball"
  end

  __echo-success "downloaded"

  if not test -e $shasumText
    echo "$FISH_NODE_REMOTE/$_version/SHASUMS256.txt"
    curl --fail "$FISH_NODE_REMOTE/$_version/SHASUMS256.txt" > "$shasumText"
  end

  fish -c "cd $FISH_NODE_ROOT/tarballs/; and cat $shasumText | grep $filename | shasum -c - > /dev/null"

  __echo-success "verified"

  if not test -e $target
    tar -C "$FISH_NODE_ROOT/versions"/ -zxf "$FISH_NODE_ROOT/tarballs/$filename"
  end

  __echo-success "installed"
end
