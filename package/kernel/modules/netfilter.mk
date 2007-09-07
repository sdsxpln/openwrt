# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

NFMENU:=Netfilter Extensions
include $(INCLUDE_DIR)/netfilter.mk

define KernelPackage/ipt-conntrack
  SUBMENU:=$(NFMENU)
  TITLE:=Modules for connection tracking
  KCONFIG:=$(KCONFIG_IPT_CONNTRACK)
  FILES:=$(foreach mod,$(IPT_CONNTRACK-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_CONNTRACK-m)))
endef

define KernelPackage/ipt-conntrack/description
 Netfilter (IPv4) kernel modules for connection tracking
 Includes: 
 - ipt_conntrack 
 - ipt_helper 
 - ipt_connmark/CONNMARK
endef

$(eval $(call KernelPackage,ipt-conntrack))


define KernelPackage/ipt-filter
  SUBMENU:=$(NFMENU)
  TITLE:=Modules for packet content inspection
  KCONFIG:=$(KCONFIG_IPT_FILTER)
  FILES:=$(foreach mod,$(IPT_FILTER-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_FILTER-m)))
endef

define KernelPackage/ipt-filter/description
 Netfilter (IPv4) kernel modules for packet content inspection 
 Includes: 
 - ipt_ipp2p 
 - ipt_layer7
endef

$(eval $(call KernelPackage,ipt-filter))


define KernelPackage/ipt-ipopt
  SUBMENU:=$(NFMENU)
  TITLE:=Modules for matching/changing IP packet options
  KCONFIG:=$(KCONFIG_IPT_IPOPT)
  FILES:=$(foreach mod,$(IPT_IPOPT-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_IPOPT-m)))
endef

define KernelPackage/ipt-ipopt/description
 Netfilter (IPv4) modules for matching/changing IP packet options 
 Includes: 
 - ipt_CLASSIFY 
 - ipt_dscp/DSCP 
 - ipt_ecn/ECN 
 - ipt_length 
 - ipt_mac 
 - ipt_tos/TOS 
 - ipt_tcpmms 
 - ipt_ttl/TTL 
 - ipt_unclean
endef

$(eval $(call KernelPackage,ipt-ipopt))


define KernelPackage/ipt-ipsec
  SUBMENU:=$(NFMENU)
  TITLE:=Modules for matching IPSec packets
  KCONFIG:=$(KCONFIG_IPT_IPSEC)
  FILES:=$(foreach mod,$(IPT_IPSEC-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_IPSEC-m)))
endef

define KernelPackage/ipt-ipsec/description
 Netfilter (IPv4) modules for matching IPSec packets 
 Includes: 
 - ipt_ah 
 - ipt_esp
endef

$(eval $(call KernelPackage,ipt-ipsec))


define KernelPackage/ipt-nat
  SUBMENU:=$(NFMENU)
  TITLE:=Modules for extra NAT targets
  KCONFIG:=$(KCONFIG_IPT_NAT)
  FILES:=$(foreach mod,$(IPT_NAT-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_NAT-m)))
endef

define KernelPackage/ipt-nat/description
 Netfilter (IPv4) modules for extra NAT targets 
 Includes: 
 - ipt_REDIRECT 
 - ipt_NETMAP
endef

$(eval $(call KernelPackage,ipt-nat))


define KernelPackage/ipt-nathelper
  SUBMENU:=$(NFMENU)
  TITLE:=Default Conntrack and NAT helpers
  KCONFIG:=$(KCONFIG_IPT_NAT_DEFAULT)
  FILES:=$(foreach mod,$(IPT_NAT_DEFAULT-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_NAT_DEFAULT-m)))
endef

define KernelPackage/ipt-nathelper/description
 Default Netfilter (IPv4) Conntrack and NAT helpers 
 Includes: 
 - ip_conntrack_ftp 
 - ip_nat_ftp 
 - ip_conntrack_irc 
 - ip_nat_irc 
 - ip_conntrack_tftp
endef

$(eval $(call KernelPackage,ipt-nathelper))


define KernelPackage/ipt-nathelper-extra
  SUBMENU:=$(NFMENU)
  TITLE:=Extra Conntrack and NAT helpers
  KCONFIG:=$(KCONFIG_IPT_NAT_EXTRA)
  FILES:=$(foreach mod,$(IPT_NAT_EXTRA-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_NAT_EXTRA-m)))
endef

define KernelPackage/ipt-nathelper-extra/description
 Extra Netfilter (IPv4) Conntrack and NAT helpers 
 Includes: 
 - ip_conntrack_amanda 
 - ip_conntrack_proto_gre 
 - ip_nat_proto_gre 
 - ip_conntrack_pptp 
 - ip_nat_pptp 
 - ip_conntrack_sip 
 - ip_nat_sip 
 - ip_nat_snmp_basic
endef

$(eval $(call KernelPackage,ipt-nathelper-extra))


define KernelPackage/ipt-imq
  SUBMENU:=$(NFMENU)
  TITLE:=Intermediate Queueing support
  KCONFIG:=CONFIG_IP_NF_TARGET_IMQ
  FILES:=$(LINUX_DIR)/net/ipv4/netfilter/*IMQ*.$(LINUX_KMOD_SUFFIX) $(LINUX_DIR)/drivers/net/imq.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(patsubst %.ko,%,$(wildcard $(LINUX_DIR)/net/ipv4/netfilter/*IMQ*.$(LINUX_KMOD_SUFFIX) $(LINUX_DIR)/drivers/net/imq.$(LINUX_KMOD_SUFFIX)))))
endef

define KernelPackage/ipt-imq/description
 Kernel support for Intermediate Queueing devices
endef

$(eval $(call KernelPackage,ipt-imq))


define KernelPackage/ipt-queue
  SUBMENU:=$(NFMENU)
  TITLE:=Module for user-space packet queueing
  KCONFIG:=$(KCONFIG_IPT_QUEUE)
  FILES:=$(foreach mod,$(IPT_QUEUE-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_QUEUE-m)))
endef

define KernelPackage/ipt-queue/description
 Netfilter (IPv4) module for user-space packet queueing 
 Includes: 
 - ipt_QUEUE
endef

$(eval $(call KernelPackage,ipt-queue))


define KernelPackage/ipt-ulog
  SUBMENU:=$(NFMENU)
  TITLE:=Module for user-space packet logging
  KCONFIG:=$(KCONFIG_IPT_ULOG)
  FILES:=$(foreach mod,$(IPT_ULOG-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_ULOG-m)))
endef

define KernelPackage/ipt-ulog/description
 Netfilter (IPv4) module for user-space packet logging 
 Includes: 
 - ipt_ULOG
endef

$(eval $(call KernelPackage,ipt-ulog))


define KernelPackage/ipt-iprange
  SUBMENU:=$(NFMENU)
  TITLE:=Module for matching ip ranges
  FILES:=$(LINUX_DIR)/net/ipv4/netfilter/ipt_iprange.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_IPRANGE-m)))
endef

define KernelPackage/ipt-iprange/description
 Netfilter (IPv4) module for matching ip ranges 
 Includes: 
 - ipt_IPRANGE
endef

$(eval $(call KernelPackage,ipt-iprange))


define KernelPackage/ipt-ipset
  SUBMENU:=$(NFMENU)
  TITLE:=IPSET Modules
  KCONFIG:=$(KCONFIG_IPT_IPSET)
  FILES:=$(foreach mod,$(IPT_IPSET-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_IPSET-m)))
endef

define KernelPackage/ipt-ipset/description
 Netfilter kernel modules for ipset
endef

$(eval $(call KernelPackage,ipt-ipset))


define KernelPackage/ipt-extra
  SUBMENU:=$(NFMENU)
  TITLE:=Extra modules
  KCONFIG:=$(KCONFIG_IPT_EXTRA)
  FILES:=$(foreach mod,$(IPT_EXTRA-m),$(LINUX_DIR)/net/$(mod).$(LINUX_KMOD_SUFFIX))
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_EXTRA-m)))
endef

define KernelPackage/ipt-extra/description
 Other Netfilter (IPv4) kernel modules
 Includes: 
 - ipt_limit 
 - ipt_owner 
 - ipt_physdev 
 - ipt_pkttype 
 - ipt_recent 
 - iptable_raw 
 - xt_NOTRACK 
endef

$(eval $(call KernelPackage,ipt-extra))


define KernelPackage/ip6tables
  SUBMENU:=$(NFMENU)
  TITLE:=IPv6 modules
  KCONFIG:=CONFIG_IP6_NF_IPTABLES
  FILES:=$(LINUX_DIR)/net/ipv6/netfilter/ip*.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(patsubst %.ko,%,$(wildcard $(LINUX_DIR)/net/ipv6/netfilter/ip6_*.$(LINUX_KMOD_SUFFIX)) $(wildcard $(LINUX_DIR)/net/ipv6/netfilter/ip6table_*.$(LINUX_KMOD_SUFFIX)) $(wildcard $(LINUX_DIR)/net/ipv6/netfilter/ip6t_*.$(LINUX_KMOD_SUFFIX)))))
endef

define KernelPackage/ip6tables/description
 Netfilter IPv6 firewalling support
endef

$(eval $(call KernelPackage,ip6tables))


define KernelPackage/arptables
  SUBMENU:=$(NFMENU)
  TITLE:=ARP firewalling modules
  FILES:=$(LINUX_DIR)/net/ipv4/netfilter/arp*.$(LINUX_KMOD_SUFFIX)
  KCONFIG:=CONFIG_IP_NF_ARPTABLES
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(patsubst %.ko,%,$(wildcard $(LINUX_DIR)/net/ipv4/netfilter/arp*.$(LINUX_KMOD_SUFFIX)))))
endef

define KernelPackage/arptables/description
 Kernel modules for ARP firewalling
endef

$(eval $(call KernelPackage,arptables))


define KernelPackage/ebtables
  SUBMENU:=$(NFMENU)
  TITLE:=Bridge firewalling modules
  DEPENDS:=@LINUX_2_6
  FILES:=$(LINUX_DIR)/net/bridge/netfilter/*.$(LINUX_KMOD_SUFFIX)
  KCONFIG:=CONFIG_BRIDGE_NF_EBTABLES
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(patsubst %.ko,%,ebtables.ko $(wildcard $(LINUX_DIR)/net/bridge/netfilter/ebtable_*.$(LINUX_KMOD_SUFFIX)) $(wildcard $(LINUX_DIR)/net/bridge/netfilter/ebt_*.$(LINUX_KMOD_SUFFIX)))))
endef

define KernelPackage/ebtables/description
 Kernel modules for Ethernet Bridge firewalling
endef

$(eval $(call KernelPackage,ebtables))
