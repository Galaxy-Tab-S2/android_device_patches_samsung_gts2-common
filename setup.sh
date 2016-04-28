#!/bin/bash

LOCAL_PATH=$(dirname $(readlink -f $0))
TOP=$LOCAL_PATH/../../../..

PTCH_DIR=${LOCAL_PATH}/patched

if [ ! -d ${LOCAL_PATH}/patched ]; then
	mkdir ${PTCH_DIR}
fi

mkdir -p ${PTCH_DIR}/$1


cp ${TOP}/$1/$2 ${PTCH_DIR}/$1/