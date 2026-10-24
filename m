Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792871993;
	b=HqQ9BHixT67RPtbXq+fFs3KtQFny3vLDpMVhVdFI7ZCNigeKFzCfqEAIf6ysbBFVW9N6
	 Bw5yOoxtVukuKYYr73lBWoFjGxIN1sxMuq/YeDTMcdkRUsOxw4FoZeFDdNqT+8ln1AKv0
	 7FrnLwJp+C9kDZkECsCCN4lLW+uPhzoJ0PYWFkLBvR2eDFqg+cVJhJKxDWjHwlqLdWHSs
	 JapnKMD1eK+k/NhTp9Gd0XySP8vvHd2mvYD1yn3btAYP/yprnF49x2RISIDKZfl9Qz810
	 A+eZauxyyqZbqiMu/G8zCyUis+Fw8/axhDa9LiC7iPPntn2mhQlNELQe09gthbH4YOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792871993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Y1aeuq5wlLtNW10aX5s7oc69ZfKy5Qflu3xHauiEe9A=;
	b=rQz0dkISs0Vy42ACawoCYZotNh0VvI3dfdHn4gssoNUfwmD58HvFkZnEwVKFmp6r9dWu
	 shG8UniblCZoY8jBA24tdU4J3YywSy+1peeCZpE/3COB1wcfohLQhvJAjr9hJV9OwZlkJ
	 QYFuDh/1w4VzNNg2r+kDgj5lcHoqaUG0BILABuakdS9XVeDWBoTNFHXwjhABBQgi4pzIH
	 r896l72ZCEQ7JkElaitmDtWxa68rm90ogvgnyMBRtB2tbAdFJpsetAFS/3Kliu43ctyA5
	 tbPnaR58bFxKlrSFAkvLLs6N6LkX9a/HM0B32WQcnw/IcURp9OTQdRa0hm70ETN0cAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="XPHF/uGF";
	arc=fail smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C482606A31B
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 19:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C482606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XPHF/uGF
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2acc1e170cso264716966b.1
        for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 12:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792871991; cv=none;
        d=google.com; s=arc-20260327;
        b=gx/6rYcoT/2HsFjEhNCUF2jWr4PiE28LdFRtuJjNyqiMzxmgF7vZDtLJmog0c2dQH0
         N3/qZCTFs/ueFiiv3VvEfqmNPbfY1rT0vMKsxUW1vcVvmfhr8JlYHJ4eZXq76f682A73
         9FO+7PIh4BDilI8524bZ8/0oR0cbXDG24A8fm40oI7mytBe93ximxu3ybr2rqCwZTzRK
         uIMo4R48NOFlhk34mzBA70VrbpTIjOQKbiuau8rSx77Y/gciT1j2auQ7118994pmr1Yz
         3mY4bVe17g3q0kUPgpR84EZLyOwK1ubIqQSEwes8wwzty1itOGyzmeI+6Jfq0JoBrwYw
         +Uvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Y1aeuq5wlLtNW10aX5s7oc69ZfKy5Qflu3xHauiEe9A=;
        fh=rRczhluyVfD+bIs7GQHU/xMcADwDnzsZmV2ZXPNwV/w=;
        b=swcnhs82fVplpGEcB1E8+6oDdXKq7ta6ttup7WAlCOQr3qmNsje/GiWGEN8jRCCvzK
         wh5kL2KADmvUxwmCWK5F6u4UhJml0WcpH3bx8TLFk5rlZ+oh9SeVCb2+jM0g1XtgeP78
         TzQMZCACU6reyIySvKjsl9nuJPfWFcCdRbxnk6UzxldKBjRAo9lQUd5bsZjhiOAhLedp
         ijWlyxWH3eIBdyqct2brU6cRMXP9QWGVnFsAXSboCmKwvgRcjr4bAN9WR46oEhwlu01x
         GRnUS2rgkB3Ch0gjsLcmu/FFX+GAEcnJPQp+L2gRBK1am58FybtCGS5KI+bRKM4np3fB
         V0qA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792871991; x=1793476791; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1aeuq5wlLtNW10aX5s7oc69ZfKy5Qflu3xHauiEe9A=;
        b=XPHF/uGFvJZHbvOri1t9OeQPmg+aerTAZEeTKlg1EeFce5AflSk6tD7/tvvSbjveui
         hsgdD3ztGucy6YuZN0JxO0zMQNCzo0IL61ZRxaqD1NOPtw15PW3n04NcB2V3/3Lvx3nL
         A7FT4yQB4vZH0jOwO2Zx3rFkhiBDg0MeLkEFtvuP/g3SSJdTZc9d0eh9Ciuf0TZox2r/
         S8gMOZlliYIknDWhh60RQqvf6ekfIqvmUmu8MBRc1tVsEP0fRQ0GiQsXjxx5Q8fxAdAb
         jQcvvZsnKjkYvDpfgx+EP1b6XqFu9X0QvEiIQtpQePLOkoel1dL0KdWDi8PE3JsYwiuU
         CHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792871991; x=1793476791;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y1aeuq5wlLtNW10aX5s7oc69ZfKy5Qflu3xHauiEe9A=;
        b=0Bgpc1ckFT5MnqoFKMP2N1BHSE1UAKC090pxIzcqjNXk++u3/+2MK0xXtQU7gxQxJB
         sAT2mvSD20SNVuMsKA5itX9B5gBP6ex++Dml3WpInxV8pVXIohzs8wAC4QL4F7fz5prl
         pphNUUs25SF56cl2EYb5xe5NnzCrRT02V6Odj7lO9nPlzsJER+Avl6v1IqZdlKje8Xxm
         QdgeuYRYK1Pr37QPBaPN+vxcp5zCaRc63nwSwvHKz7uEu+SY5n4j5SwwsS8citKi6A0B
         6YTME49nTZ65nFNWBa02Ag9JtUSfgcoSQW88jQczDs7VPzSbSZ8dnhKvTjz+Cbjlwwpf
         RQCw==
X-Forwarded-Encrypted: i=1; AKwUvBxWwkSd3FivNrHRgDG2KvllSLpy8h08yYkJGIhjsL78M7nYHw1DD8WNnqXZwyQ0oQtNjO1HXil/NSlX9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJCRnJZoyrTLk3CmvVNBa5zZtp44VraIzgE6FRogMsH5qEX2drZ
	EHAcYT55CFoJq42HzJTfmADjvBaiFPVrOzppObBou31qfGe5a1fFYbxrVtkXICDrzWcoMR4gn+u
	qXp6d7StjlRJA/O1mhLZFotWgIenVNPQ=
X-Gm-Gg: AYBFou01AjoMJ93VKa2GesnLkfB3sB5XK4YJhNyoUjhQ8cMLtYl3w9LrhuGbzKQ66Tj
	T2AgGxiuD5thENby9i+bY7lKXmdK/KjXeraF+8zykq1Cvjmqc2VtqffD1FyMPmoHDXzYeb8W77N
	b8GGWDq34R+xTT82/e8f5PR3MJ3nqpPZzoAeGtDyH5ZM5sQtBiCoU6j9K8DsS0Hh4dHKX2Hov6b
	DV+Qxufb5ZmVvuhnelrsWdAthRaFzfuq8Fm/v9DBHP0f1ZVUg1pHwHXaHsUCBCR3JZ59Sioe3BG
	GBmM6lcrc4T/gOLwGG+NGViIiUuQKVIu7F/B/sirf3oXfVZgXAScyLBjO9b9UiDssTJWKmdX7ff
	6+JIt5RHj+qFciUhqhP3Ad8QSDAFogrrGoAEV4yCC8TDmaq4wNVfg4R4iKttlcxh8mMC0
X-Received: by 2002:a17:907:7fa2:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c46bde53641mr320816366b.28.1792871991404; Sat, 24 Oct 2026
 12:59:51 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Jalen <jalen.lin@gmail.com>
Date: Sun, 25 Oct 2026 03:59:38 +0800
X-Gm-Features: AclHuK9KkBjBGWoRa_ld4FWISRsVfgthwdP-vuacjeJMzEpkEd5BKVmYyQ84xBs
Message-ID: <CAHqkChbVoGHrWtaFyGFaLQDiAunWw1qOpW-vKSgkKxWEfQ_tCg@mail.gmail.com>
Subject: [REGRESSION] netfilter: flowtable: HW offloaded flows are not removed
 from hardware on flowtable deletion since 13210fc63f35
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	=?UTF-8?Q?Paul=2DLouis_Charri=C3=A8re?= <plcharriere@gmail.com>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

Since 13210fc63f35 ("netfilter: nf_tables: imbalance in flowtable
binding"), deleting a flowtable with "flags offload" leaves its flows
in hardware. FLOW_BLOCK_UNBIND now runs at commit time, before
nf_flow_table_free(), so the FLOW_CLS_DESTROY calls made by the free
find no driver callback. The hardware keeps forwarding (and NATing)
those flows with no flowtable or ruleset left. Current master is
affected. Seen on mtk_eth_soc and mlx5.

This is the ordering that 5acab91458ce ("netfilter: nf_tables: unbind
callbacks from flowtable destroy path") fixed in 2020:

  Callback unbinding needs to be done after nf_flow_table_free(),
  otherwise entries are not removed from the hardware.

In current master the UNBIND is in nft_unregister_flowtable_ops(),
still called from the commit path. Stable trees with 13210fc63f35
(from the source, not runtime tested): v5.15.180, v6.1.125+,
v6.6.72+, v6.12.10+.

Results
-------

BPI-R3 (MT7986A, mtk_eth_soc PPE), vanilla kernels, each run from a
fresh boot. BND = grep -c BND /sys/kernel/debug/ppe*/entries

  A  4f619d518db9  parent of 13210fc63f35
  B  13210fc63f35
  C  5b0764a53235  master, 2026-10-23
  D  C + the patch mentioned below

  step                                  A     B     C     D
  1. no table                           0     0     0     0
  2. load the table below            1000  1000  1000  1000
  3. nft delete table inet t,
     40 s idle                          0     0     0     0
  4. same 1000 5-tuples again           0  1000  1000     0
  5. 1000 new 5-tuples                  0     0     0     0

A/B differ only in nf_tables_api.c and C/D only in
nf_flow_table_offload.c; each pair uses the same .config. In step 2
all four show 1000 [HW_OFFLOAD] conntrack entries. In step 4 B and C
have no flowtable and no [HW_OFFLOAD] entry, yet the PPE forwards the
old flows in hardware.

On-board ConnectX-7 of an NVIDIA DGX Spark (GB10, arm64; PSID
NVD0000000087, fw 28.45.4028; Ubuntu 6.17.0-1022-nvidia), not a
standalone card. mlx5 in switchdev, flowtable on two VF
representors, traffic VF to VF, 1000 UDP flows,
mlx5e_delete_flower() calls counted with kprobes:

                                   stock   patched
  deletes on "nft delete table"        0      4000
  old flows still forwarded          yes        no
  next 1000 flows offloaded          864      1000
  eswitch mode change to legacy     busy        ok

4000 = 1000 flows x 2 directions x 2 representors. With the flowtable
gone and ip_forward=0, the old 5-tuples still reach the other VF with
the masquerade source address. The 136 missing flows get -EEXIST from
leftover driver entries. "patched" is an out-of-tree nf_flow_table.ko
built from the same distro source; an unmodified rebuild gives the
same numbers as stock.

(On this setup mlx5 only hits FT rules once some tc rule exists on
chain 0, so the forwarding check used a dummy flower rule there. It
looks like esw_chains_create() creates the chain 0 root table, and
its miss rule, before mlx5_chains_set_end_ft() sets the FT chain. I
have not looked into it further.)

Reproduction
------------

  table inet t {
    flowtable ft {
      hook ingress priority filter
      devices = { lan0, lan1 }
      flags offload
    }
    chain ft_forward {
      type filter hook forward priority filter; policy accept;
      ip protocol { tcp, udp } flow add @ft
    }
    chain post {
      type nat hook postrouting priority srcnat; policy accept;
      oifname "lan1" masquerade
    }
  }

1000 UDP flows, 10.0.0.100+i:1024 -> 192.168.200.2:7, 64B, 200 kpps,
lan0 -> lan1 (MT7531 DSA ports). Scripts and raw logs on request.

Fix
---

The tested patch is from an OpenWrt fork, carried there as a MediaTek
target patch although the change is generic. It deletes the device's
hardware flows in nf_flow_table_offload_setup() before
FLOW_BLOCK_UNBIND, as nf_flow_table_indr_cleanup() does, and runs the
GC once more for flows whose offload work was still pending:

  https://github.com/plcharriere/openwrt/pull/1 (commit f36e21492a)

It applies to current master. I have not checked that it keeps the
BIND/UNBIND balance for all the cases 13210fc63f35 fixed.

Paul-Louis (Cc'd), would you be willing to send it to netfilter-devel
on its own? If the maintainers prefer a different fix, I can test it
on both setups.

The same symptom on Qualcomm PPE (IPQ9570, hardware table full after
about 10 firewall reloads):
https://github.com/perceival/openwrt-flint3/issues/115

This was investigated with help from an AI coding assistant (Claude
Opus 5.5 in Claude Code). It read the kernel and driver code, ran the
reproducers and kprobe counts on my hardware, and drafted this
report. I reviewed the analysis and the results and can answer
questions about them.

#regzbot introduced: 13210fc63f35

Thanks,
Jalen
