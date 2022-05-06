#!/usr/bin/bash

EMACS=~/.emacs.d

echo 'set up: emacs config...'
mkdir -p ${EMACS}/lisp
ln -sf ${PWD}/emacs/init.el ${EMACS}/
ln -sf ${PWD}/emacs/early-init.el ${EMACS}/
ln -sf ${PWD}/emacs/lisp/ ${EMACS}/
echo 'set up: emacs config... done'
