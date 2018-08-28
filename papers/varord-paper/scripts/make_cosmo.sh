#!/bin/bash
COSMO_DIR=~/projects/cosmo/

make -C $COSMO_DIR clean
make -C $COSMO_DIR k=32 -j8
mv $COSMO_DIR/cosmo-build $COSMO_DIR/cosmo-build32
make -C $COSMO_DIR k=64 -j8
mv $COSMO_DIR/cosmo-build $COSMO_DIR/cosmo-build64
