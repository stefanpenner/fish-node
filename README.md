# fish-node

Learning some fish, wanted something like nvm/fnm.

## install

```sh
fisher stefanpenner/fish-node
```

## Example

```
node-get v7 # download the node version which first matches v7
node-set-global v7 # set the node version which first matches v7 as the default

node-get v4 # download v4
node-set v7 # set the current session to use v4
```

## functions

* `node-get`: download a given node version
* `node-set`: set the local node version
* `node-delete`: delete a local node version
* `node-set-global`: set the global node version
* `node-ls`: shows available local node versions
* `node-ls-remote`: shows all available node versions (cached)
* `node-ls-remote-refresh`: evicts the local cache of available remote node versions
