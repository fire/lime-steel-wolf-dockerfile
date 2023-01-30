#!/bin/sh
# MIT License

# Copyright (c) 2018 Hiroshi Saito

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# https://github.com/hiroshi/foundationdb-docker

if [ ! -f /var/lib/foundationdb/fdb.cluster ]
then
    if [ "$1" = "" ]
    then
        echo "Generate a certificate."
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/foundationdb/key.pem -out /etc/foundationdb/cert.pem -subj "/C=CA/ST=Vancouver/L=British Columbia/O=Chibifire/CN=$FDB_CLUSTER_ADDRESS"
        echo "Configure new cluster."
        /usr/lib/foundationdb/make_public.py -t
        cp /etc/foundationdb/fdb.cluster /var/lib/foundationdb/fdb.cluster
        (sleep 1 && fdbcli --no-status --exec "configure new single ssd" &)
    else
        echo "Replace $FDB_CLUSTER_FILE with $1 to join."
        echo $1 > /var/lib/foundationdb/fdb.cluster
    fi
fi
exec /usr/lib/foundationdb/fdbmonitor