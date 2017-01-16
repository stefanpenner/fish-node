function node-uninstall -a _version
  set -l filename node-$_version-$_node_current_platform.tar.gz
  set -l tarball $FISH_NODE_ROOT/tarballs/$filename
  set -l target $FISH_NODE_ROOT/versions/node-$_version-$_node_current_platform/
  set -l checksum "$FISH_NODE_ROOT/checksums/$_version-SHASUMS256.txt"

  rm -rf $tarball $target $checksum
end
