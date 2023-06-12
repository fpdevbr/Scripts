#!/bin/sh
tc qdisc del dev br-lan root
tc qdisc del dev pppoe-vivo root
tc qdisc add dev pppoe-vivo root handle 1: tbf rate 150mbit burst 512Kb limit 32Kb
tc qdisc add dev pppoe-vivo parent 1: fq_codel target 15ms interval 150ms memory_limit 8Mb quantum 1514 noecn
tc qdisc add dev br-lan root handle 1: tbf rate 330mbit burst 512Kb limit 32Kb
tc qdisc add dev br-lan parent 1: fq_codel target 15ms interval 150ms memory_limit 16Mb quantum 1514 noecn
