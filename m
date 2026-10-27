Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094742;
	b=cjd3pbRzOQRaLCBFbsrCEgZJ6HFVQXHj0SVkgQwU5I+n4MgKSn/M/lVF8KTPtGYhvcAb
	 olpPcdrsYm19fbvmlznHzqoIqBLCqFR9Oi2iHX7vULKPJayVC8sdlIV9xVWYSKRAXNkYN
	 MSXDzeL6JdkyPBV2RBWBsJS8hpCAKQR3yrFQPoxzdvMlXWs/Xhwub7Wlxq3yQJLmLP4HN
	 Jq04+WjO/SrLmgw2MvGcecmSYdMSgMLMP65S05uVbBS+wfnhC+deE/SUp78yWcHDqHi0P
	 cGPKVi/T3wCLhzmaOQTMiM04XRL0cMIEttIcb1PtbMmwDlHVxG+sabduRqEeHDa8h+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=gU765r76gD1EGRDftTMSglU53FpTtOU0yEoP0lYj/T8=;
	b=x1Zw3D8TYIXezkZg9eb4TfQmIkQwH+eiJ4IBacOnIQ2pNdy9HEW5nXBYHekIfiD28CzC
	 zyS8UiyQt5MDre6oBdpSf//fukaL1tI75V0HWTAgh6amb3ZNijl4Nw3oX8DQLU3tNkEMi
	 Ab6uU0qJA+BXXJCYGyDPczFVMeJHn/kz2TxbOAJVvODBJek40gsz+ke0cBdCNcq5nYDPm
	 WFGLxw0mPpfRkiCt43gTUzVflGO7WMepj9+01TPJ2N3e/0cOozAT26U0XZwBqj1gkaEo+
	 IG7vMtM2EJb8+DEg/4R73P2osJSt9QoyxGqMeoMqOBRbLJmvYYHtVpEUItxqB1mFFKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SBiXBa5z;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F6606A31D
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 09:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7F6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=SBiXBa5z
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jDQl14Nbgz65v9;
	Tue, 27 Oct 2026 10:52:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793094733;
	bh=ZlwZtPeJK9YxrP9jD703Sz0Db+v1HcjsJo8q4VDmALk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SBiXBa5zKLXz063nNhDdNyvv7O47A3C6jISxoFWg/IMLAz268UyGLAegGAbLQGKEI
	 j/V4UXYEL2CIEceFv/t5j8LwMLQkTmzpINx6ZY2ktgUWVohb92rNbC1omIyIjv5PA7
	 MDvpESYnw1v0BEi3dHldIF2Nx+8uwMxaAOb3Bsm8FcmKzN11D2nOnqRjd6Fput7afs
	 4fvUgo41EFXusJtz0EG/YgODSXn0q4vsEYXQdFt4yhASXwTqo6Jb+qpYuzcXrpBGWJ
	 D2SoA8ScBEVIcABbxEjDDmfKpaAX4LRAGSYNIPhZ3QwCkbqaqrMMuNuCqfdbecO2mq
	 1dghAPDGQz1UA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jDQl13fRdz4xLY;
	Tue, 27 Oct 2026 10:52:13 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jDQl068RVz8sgW;
	Tue, 27 Oct 2026 10:52:12 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 110D15FA4F;
	Tue, 27 Oct 2026 10:52:02 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4e7a9bc8-4981-4dc4-bc2b-92579a694177@leemhuis.info>
Date: Tue, 27 Oct 2026 10:52:01 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] usb: xhci: clear stale bandwidth data after
 hibernation
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org, Harald Judt <h.judt@gmx.at>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179309472247.1118883.12082346900975870547@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 110D15FA4F
X-NC-CID: hAXmz8Jh0ZAqkPUxytxGoXIFl8n6qXIX3M6vzSXbks9byQqK/a0=

On 10/6/26 17:24, Niklas Neronin wrote:
> Controllers using software managed bandwidth accounting maintain
> periodic endpoint bandwidth information in struct 'xhci_interval_bw_table'.
> 
> Each root hub port owns a bandwidth table and a list of TT bandwidth
> domains, where each TT has its own bandwidth table. Virtual devices
> reference the bandwidth table of their current bandwidth domain through
> 'bw_table' or 'tt_info'.

What happened to this? This from what I see fixes a regression from the
7.1 cycle, so it would be good to finally resolve this for 7.4-rc1. But
I see that Michal's review comment wasn't answered -- is that what we
are waiting for. And I wonder if it was unwise to bundle this regression
fix with other changed -- and if it should be resubmitted separately.

> Historically, resume from S4 re-allocated the entire xHCI driver state,
> which implicitly cleared all bandwidth accounting data. After the
> hibernation resume path was optimized to preserve parts of the driver
> state, virtual devices and TT bandwidth information were freed and
> recreated, but the root hub bandwidth tables were left intact.
> 
> As a result, stale bandwidth accounting data could remain in the root
> hub bandwidth tables across hibernation resume, leading to incorrect
> bandwidth calculations after devices were rediscovered.
> 
> Fix this by resetting all software bandwidth accounting state in
> xhci_rh_bw_cleanup() so that resume starts with a clean bandwidth state.
> This includes 'xhci->num_active_eps', which must remain consistent with
> the cleared bandwidth tables.

BTW in case this needs to be resubmitted:
> Fixes: <2a70e5dc0301> ("usb: xhci: optimize resuming from S4 (suspend-to-disk)")

Drop the "<" and the ">" please.

Ciao, Thorsten

> Reported-by: Harald Judt <h.judt@gmx.at>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222071
> Suggested-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
> Tested-by: Harald Judt <h.judt@gmx.at>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c | 16 +++++++++++++++-
>  drivers/usb/host/xhci.c     |  1 +
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index af8d4b74c4ba..75577f441cdd 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1903,24 +1903,38 @@ EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
>  void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
>  {
>  	struct xhci_root_port_bw_info *rh_bw;
> +	struct xhci_interval_bw_table *bw_table;
> +	struct xhci_interval_bw *interval_bw;
>  	struct xhci_tt_bw_info *tt_info, *tt_next;
>  	struct list_head *eps, *ep, *ep_next;
>  
>  	for (int i = 0; i < xhci->max_ports; i++) {
>  		rh_bw = &xhci->rh_bw[i];
>  
> +		rh_bw->num_active_tts = 0;
>  		/* Clear and free all TT bandwidth entries */
>  		list_for_each_entry_safe(tt_info, tt_next, &rh_bw->tts, tt_list) {
>  			list_del(&tt_info->tt_list);
>  			kfree(tt_info);
>  		}
>  
> +		bw_table = &rh_bw->bw_table;
> +		bw_table->interval0_esit_payload = 0;
> +		bw_table->bw_used = 0;
> +		bw_table->ss_bw_in = 0;
> +		bw_table->ss_bw_out = 0;
> +
>  		/* Clear per-interval endpoint lists */
>  		for (int j = 0; j < XHCI_MAX_INTERVAL; j++) {
> -			eps = &rh_bw->bw_table.interval_bw[j].endpoints;
> +			interval_bw = &bw_table->interval_bw[j];
> +			eps = &interval_bw->endpoints;
>  
> +			interval_bw->num_packets = 0;
>  			list_for_each_safe(ep, ep_next, eps)
>  				list_del_init(ep);
> +			interval_bw->overhead[LS_OVERHEAD_TYPE] = 0;
> +			interval_bw->overhead[FS_OVERHEAD_TYPE] = 0;
> +			interval_bw->overhead[HS_OVERHEAD_TYPE] = 0;
>  		}
>  	}
>  }
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c28..4708fabba84a 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1185,6 +1185,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		for (int i = xhci->max_slots; i > 0; i--)
>  			xhci_free_virt_devices_depth_first(xhci, i);
>  
> +		xhci->num_active_eps = 0;
>  		xhci_rh_bw_cleanup(xhci);
>  
>  		xhci->cmd_ring_reserved_trbs = 0;

