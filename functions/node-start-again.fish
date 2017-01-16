function node-start-again
  rm -rf $FISH_NODE_ROOT/{versions,default,tarballs,checksums,cache}
  node-setup
end
