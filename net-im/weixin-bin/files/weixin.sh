#!/usr/bin/env bash

bwrap --dev-bind / / \
    --bind /opt/weixin/license/etc/os-release /etc/os-release \
    --bind /opt/weixin/license/etc/lsb-release /etc/lsb-release \
    --bind /opt/weixin/license/usr/lib/license/ /usr/lib/license/ \
    --bind /opt/weixin/license/var/ /var/ \
    /opt/weixin/weixin $@
