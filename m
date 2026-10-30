Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347550;
	b=AuepeLWKlw8IKb2YzHjWLv4ERFaT72JKUfGg9TXIJwXhs8PU3/tOvzOY0GKxMHJ/vZ0B
	 XSSuSZk0OtkJwDxj9OGMowTV2ufRuZhmFrPpAJlxB5qClb2OLmbUDPXH7HPgQKe/w3ITe
	 idJHmwv6yoBLhGUeXrUuxkrv4MEE39oq3IYmWurpXjm1tOP7azbtxryVB/kEF2R081dAs
	 W/IMRLzntgKxdzOyzpgKs/hg1lHX0YuH/GJZDDC5igbWtNCVl9gYencAfBlej738YaODu
	 jm4Quxx8vBaI9HGMGrB4vrEJOmW4JL7kX3LjjyRIGj5wsv4T4QiPMQnp3kmYHh9lWLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=YXpcFroDuHIUv3bN8S40qZQCj28YoUWs9C90vlOAQY8=;
	b=bO8emBOWsTvDyO7Lvn3FDGtHKpseeGqdZ9Q+yrQFIATiS3eWrqXqnaRwYg34RalMdTkc
	 O3S4AeOm2ZRHgIQ1HiOEFItIU6QbcEv9yD+YJm3fAraLIXGNHOnOx8w6jMuVaKO4Ncm7a
	 o42+BbMrzFF9yU4iqTp3C7yz8yesQ1GL3374oUEoKIfxamTDJJBO0bKyo6CRPMudicZaU
	 F2K+n5YFf2qz5O/B1b6kJb1r/Hno0BwUbhjjQIXUkMZxXJeaD4TXuUrlfjtGh6AslWCfs
	 NYiVzC9nX6c91a8546u5dHYtUko2Ehggv/CblpeQcjnM61LH0WDHBes+yZmEmP9H9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=et+unMkD;
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE06606A31C
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 08:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=et+unMkD
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jGDDb41Fbz4HMf;
	Fri, 30 Oct 2026 09:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793347535;
	bh=Se3koPSs6DQ6zGD5W/2cWVvCOjVr+vPRxHFjz++onwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=et+unMkD2ILC3wHKKcw3fKmLwZORczDC2OPhDj7xdvlNyRRuIInGnByqPtaaNOtPz
	 3K4Z+XF2ePKZySS1enbIwbCn/YHEf58/r6KnLzPIVBxMJrKnc/aJEEL/aOoZzBoSE+
	 MFbgMCaztNNdlLVKEC0mY2b7JuIoiKC6VrVnbDdFeDThwX7tbvY2zKJa7S14iBrwI8
	 3HWMi7YazrejVEBBrD2woaYkIyMaKPlPkk5xf20+iDlE5pA84xzo07jjBnfs1cTeE1
	 2ZXvDpHJW4QCoOUQyjwZCGqDveewjB9BoM6zQrT6cLucj3B5NEA0G0Pgr8fPN8r57L
	 YNZfxwG4FK7Tw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jGDDZ4Yqxz4Fxh;
	Fri, 30 Oct 2026 09:05:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jGDDV5Q83z8tgB;
	Fri, 30 Oct 2026 09:05:30 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E5E1A5F9FB;
	Fri, 30 Oct 2026 09:04:47 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3918d7f2-2c8e-4c91-8de3-ae412acc75a0@leemhuis.info>
Date: Fri, 30 Oct 2026 09:04:47 +0100
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
Subject: Re: [PATCH v1] drm/i915/display: Allow port sync on PTL
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179334748825.921469.2962837773718248811@mxe9fb.netcup.net>
X-NC-CID: CgXu/PzoZISETFZi9IR28TCiGLRx2uzTN+sBY0hwJUg+vuZt4Hw=

On 10/12/26 06:04, Mitul Golani wrote:
> Some dual-SST tiled displays exhibit visual corruption on PTL, with
> one tile's image vertically shifted or wrapped by a random amount
> that changes on every hotplug.
> 
> PTL supports port sync, so allow it to be used to avoid these
> display issues.

Is this fix for a recent regression still in the "to review" list of
anyone, or did it fell through the cracks? Or was this solved meanwhile
and I just missed it?

Ciao, Thorsten

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8991
> Fixes: 05cffc074938 ("drm/i915/display: Implement Wa_16024710867")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a46ab5d3d70f..a0aff087fafa 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4629,7 +4629,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
>  	 * From, xe3lpd onwards we have defeatured this with reference to
>  	 * Wa_16024710867
>  	 */
> -	if (!IS_DISPLAY_VER(display, 9, 20))
> +	if (!IS_DISPLAY_VER(display, 9, 30))
>  		return 0;
>  
>  	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))

