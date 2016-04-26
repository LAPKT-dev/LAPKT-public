LAPKT v2.0
===========

This directory contains the upcoming 2.0 version of the `LAPKT` framework.
The source here is possibly untested, and bound to backwards-compatibility-breaking modifications.
Use at your own risk!


Usage
------

Most likely you will need to configure your build system so that the `LAPKT` header files and library can be properly found.
You can do that by e.g. setting the following environment variables up in your  `~/.bashrc` configuration file:


```shell
export LAPKT_PATH="${HOME}/projects/code/lapkt"
export LAPKT2_PATH="${LAPKT_PATH}/aptk2"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LAPKT2_PATH}/lib

```

Once all this is set up, you can build the `lapkt2` library by doing

```shell
cd $LAPKT2_PATH && scons
```

(You can also run `scons debug=1` to build the debug version of the library,
or `scons edebug=1` to build an extremely-verbose debug version).
This will create appropiate library files under `$LAPKT2_PATH/lib`, which you can link against from your preferred buuld system.
By default, both shared and static libraries are generated.


An example project using the `lapkt2` library can be found [here](https://github.com/aig-upf/fs).
