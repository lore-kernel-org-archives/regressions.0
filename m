Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431658;
	b=AW6HFzlY2oqET1bEekRvfKn1PaSB2DbG5SBxhrbIuEVGowwH6tP6OSDTyuCy+AbOrxrs
	 aP7DDqD63l3jPwV10EfGefahoZOyYzGX0f1yCgTVkYCB46BXcaVTOsCHYpQe7/NgoLy5G
	 XqKggH3JK8zwGzthHVP6KVls/Ye/FXstSQKaSD00+mL0qh4Rs0ZLr2nUeCc89910GjvYT
	 MXV9esyuAxVqwlwnfk8hyrmg3Xm4NJopGdAWwvlo4tq9rqENUi95FDplF3zrxVkJyz8DS
	 Cqauq2ntkcbHVIl543yTA85fvMFNRWUvKiMapFOuKnEyncgLTidv8xqv9aar2YoUj7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=PRbNFj6uC49q81x4liIcV+Y8PHwVuImpvNjavvauADo=;
	b=k47vhMbFQFdBs2xDV/rgcBLHB40Lez0WPWBhH8oLCnyGj5pfBXHvAeuQHmmVGMuooz5Q
	 eFBrV1gqqQ7k6YVL0tC3KzlGuI1U9g9yKjmeGi5MhkIRr8uZZHWCueAck7OxNUqAiWnTf
	 ZRvAvbrRRg5KafG19f4cDo2J4eFZnRR4wjpA+yfigeYYO/xIivNLGUOShDqapS+agERHm
	 zpzWCMm4ugaT+82fbJt4te+Ru9yHnUTZYG5Zi0IXonFjlSE3HEbYKjpC9C64GKp/PLJsf
	 owEbSMSxuKD/BHvFYBoJc1RLN3v7KGE3TbG9L4G1xxpWDqMoyAEcIFJVnOxmVi0xZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=dSPa8vZL;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C2606A31A
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 11:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=dSPa8vZL
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jY2zk3RPcz6Lt7;
	Mon, 23 Nov 2026 12:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795431650;
	bh=78xWy2HIE+Iru6tO28E4xyJ6Psh1If63NW9ZeTScmpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dSPa8vZLhnNc7Imu8KpDGV2PwAHxcgCqoziPsQ1TVRfg9hcpKPVS8B7C4d8+DMltO
	 57+pbId4lW8J8ePkjRyjQLd9k7++E2mWepeJ3s4dzdBbG23UqpLykF0WfXmpD0ZD8J
	 ptNb76MRmogdkJKweaxTPLl+z9EEUdSxQNK6ePaCeoom209UK5G0uH379s17Y/sySL
	 Sy1bKSK8j4QxNOvW09klD5sLeVok34o/WrVPbc36vhQKxNKRpuNRLrO6WXQfhiezSM
	 YJwDCSdp+oZ4Auw6FU+AQ/jdcvNd4EHSwejvmw5R9iKPOZoVEWLPL18VrL3cWI00UI
	 a4zqvsT7r9OlQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jY2zk2dFlz4xfD;
	Mon, 23 Nov 2026 12:00:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jY2zh25VJz8vKV;
	Mon, 23 Nov 2026 12:00:48 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 06CC25FD31;
	Mon, 23 Nov 2026 12:00:34 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0212b0be-857c-475c-98a3-165df9de34c7@leemhuis.info>
Date: Mon, 23 Nov 2026 12:00:34 +0100
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
Subject: Re: [PATCH] drm/msm/dp: skip the link teardown after a failed enable
To: Burke Cates <burke.cates@gmail.com>, robin.clark@oss.qualcomm.com,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20261104072048.3486286-1-burke.cates@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261104072048.3486286-1-burke.cates@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179543163576.1430496.2010400359322779870@mxe9fb.netcup.net>
X-NC-CID: EyCB0RlSoK0xX/w+A8jKs5dfDCgvxUYQl4CIJiwwMoShIsBC9Ko=

On 11/4/26 08:20, Burke Cates wrote:
> Commit 1bda647ce61b ("drm/msm/dp: move link-level teardown from
> display_disable to display_unprepare") moved msm_dp_ctrl_off_link() and
> the PHY exit into msm_dp_display_unprepare(). Unlike
> msm_dp_display_disable(), that function does not check power_on.

Was this regression ever resolved through the proposed or another
patch[1]? Looks like it feel through the cracks, but it's easy to miss
something from the outside.

Ciao, Thorsten



> When link training fails, msm_dp_ctrl_on_link() has already turned the
> link clocks and the PHY off, and .atomic_enable() returns with power_on
> still false. The next disable now runs msm_dp_ctrl_off_link() anyway,
> which writes REG_DP_MAINLINK_CTRL and pulses DP_SW_RESET with the link
> clocks off. On an ASUS Zenbook A16 (Glymur, eDP) the SoC then resets.
> 
> Skip the link teardown when power_on is false, as before that commit,
> but still drop the runtime PM reference.
> 
> Tested on the A16 by forcing link training to fail and then blanking
> the display: the SoC reset 2/2 times without this patch and 0/3 with
> it.
> 
> Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
> Signed-off-by: Burke Cates <burke.cates@gmail.com>
> ---
> 
> Notes:
>     Test base: v7.4-rc1 with out-of-tree Glymur platform, board and eDP
>     PHY patches; drivers/gpu/drm/msm/dp as in v7.4-rc1 plus a local
>     knob that fails every training attempt. The reset is silent (no
>     pstore), so which of the two accesses triggers it is not known.
>     
>     As before 1bda647ce61b, a failure after successful training still
>     leaves the link up. Xilin Wu's hdr10 v2 09/20 handles these paths
>     more generally; this is the minimal fix for -rc. Happy to test his
>     approach instead.
>     https://lore.kernel.org/all/20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com/
>     
>     The bug was found and this patch drafted with an AI coding
>     assistant (Claude Code, Claude Opus 5.5); I reviewed it and ran the
>     tests.
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9299ce616fdb..76784cc45228 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1528,6 +1528,14 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>  {
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
> +	/*
> +	 * Failed link training leaves the link clocks off. Avoid accessing
> +	 * link registers after a failed enable, but still release the
> +	 * runtime-PM reference below.
> +	 */
> +	if (!msm_dp_display->power_on)
> +		goto out;
> +
>  	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0)
>  		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> @@ -1542,6 +1550,7 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>  
>  	msm_dp_display->power_on = false;
>  
> +out:
>  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

