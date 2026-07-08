Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97780416132
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512793; cv=none; b=SZtsc5OLiBwhwQxqGDlVj/FmSlsf6JCocJd5M80yvn/C1oPkiCpYGaEoVY5EKkEC1gUBOF+IiIm78ldRaGgc/WXmOgVO7GKxMt83ov5RXxKsNr6hbIzy4glCj4Ravr85S5PTjadiJ0EMyYtBa684z/zQa1v2tVWdD0s+kNoBNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512793; c=relaxed/simple;
	bh=nA0kt94Xaiw+DgO3FieSkVBdXzFHB91+S821MQuWFbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpdqybZJy5KmVajQCBAW8vFOGxqtVXmck5zTfe2Ocf3Jy43W0w2YLQFyS7EJ+SNvNvbAsoud1TRVppOPsUVAwYca1QarYPqrChNzDQdzXpq+ii3fiL6gBrdhAC/ZPsLNX70NWGdbbUF6igOqBWK+mEC7JE4lQziaaHqH8hXfE8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InrIoVGD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InrIoVGD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so4590955e9.0
        for <regressions@lists.linux.dev>; Wed, 08 Jul 2026 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512788; x=1784117588; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKW5gFGH/771IARNO8a+Mk4z1dF2QiKqn10sOpp4x8M=;
        b=InrIoVGDPsr9qK+/2wBX8t+h/VjWovPUprDLsoqoPYOHHW8orMlMVFpbnCT0kWW8RO
         BLJgpFzzM6EnoFC4P8yNs4kkk6/DiQFOdhv9G+shYVtw0OCwRSeZz9nX1Mpl27MYQAlc
         oHuRMJjonRrTW3YztpbOeTUhc7ldzZGF2g6+sdpXCYnJn2fPOLpu2ydW7p2em66LZwCU
         YT+JjBGjOzlh5+E2A4mTibv3+jlbI5pp+J26sSDh/wL+wu8e3wJ1zTlq1MG8m+pdCzg4
         2B/PGtrUxjoJckgZ6fAs3KnW7IaLKW+x+vqUwV+cb9lfTP+su0DSnlkTERoSa58BsSlW
         Em+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512788; x=1784117588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eKW5gFGH/771IARNO8a+Mk4z1dF2QiKqn10sOpp4x8M=;
        b=d+7iAKckkY4gnNtjua3TGj9V7k7zlixiOJRWB2Pc3iJopk744VApdYNfg2Raw5SyXI
         kafWbuZigwdxejBM3KYytryG/2A9tkwbeJRadba7Ot0X0y24eo3vvseET+Q8RQToA9Gj
         JdzF1aWkilDtB5tH+OvZpAU9BJ6V9V8W34XOZa5RytEQlCeOd3Gph7OrNOx+QMO3rYMO
         1lzK7H80plAVNkC2AXEiX+vAa3d8L/vUOKr3fNTVOtO4OIxzR/gGCKVC/2EM6gt8K7CU
         cKItchk1EODeoQuSiPcwiCtr/k8Df9x5O/Ct8dlG7PFugG7tY2K9h1JGFSVoqtgWXygh
         8tjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJyqLPRFwh4ChN3cQtCDOb/h+l+jP3hFJBrJ+rZ854ppWLxs3cFakqo7//SHHiW5WWB1IjeHlTvzlL6w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2EX6jU7tikpaF2UucQo93joZPAGi6aPnoLVLqXyO2WUmV8OZT
	uE2LZF96lsJwAj08JsMGBizrGQvvz5YKrQrx42y5a19g66VxhEf8be3k
X-Gm-Gg: AfdE7ckwBnjRimxw+2f1R4TIC+cU/uMvYCmdkHGvKqCqckdXonHN0TDNMFjmYPYjYs/
	fb+BCUrCJbBdatnB0EhQ8RIXuri7mvCf+BnBrehptGn/riJyAxWpTv2pjK096yhITQfmpexxFE8
	/8iLAx+DEfK63hGwLd3Lbyk8OEQmmdQ6d8OL8WR2n4oia+WWkN48c8y1L9ubqg+gepJsHG2t1e7
	0l6ubanZwxDem5usgqOnJ7Mz79ekalOE7geymSpLdCq5Lu71pHM+trwor20XgHw1miDXXtf4RWb
	RSZS0BGN0jcOCvvEtsD+6jcNLyaZ7Q1DMkUoL83B4JVtTuSD2StbiNgS5EW7vr1/ZomT71qYUoF
	1MgwCV08KvuQ8z81UvsW+V0jqn2FxBDLYOTWauF1GLADQ7phint25k6lh/OGcqIuPpgJ95WpnEa
	ezvTsP7Nm1
X-Received: by 2002:a05:600d:8498:20b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493e68b8094mr18294835e9.8.1783512787657;
        Wed, 08 Jul 2026 05:13:07 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:d412:a0e9:ab11:7221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a572c3sm64268235e9.1.2026.07.08.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:13:07 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:13:05 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Adam Thiede <me@adamthiede.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <ak4-0SkPaeU3N2lh@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com>
 <ajka2220depklK1_@owl5>
 <bac79214-050d-448b-be63-0586d45c807d@adamthiede.com>
 <f0d99b1a-e383-4d14-adb1-4ccab46efddb@leemhuis.info>
 <5baeb90d2c3736df67ad075ede4ac765bfeaed2d.camel@mediatek.com>
 <84233951-ee22-4980-9f17-2af1df51fdbf@leemhuis.info>
 <6fed12a6-0c94-477f-8a2e-466c33ea2e29@collabora.com>
 <dbc251f2-0c67-4970-a101-c19129055082@adamthiede.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbc251f2-0c67-4970-a101-c19129055082@adamthiede.com>

Hi Adam,

On Tue, Jul 07, 2026 at 08:25:41PM -0500, Adam Thiede wrote:
> On 7/7/26 05:38, AngeloGioacchino Del Regno wrote:
> > On 7/7/26 10:51, Thorsten Leemhuis wrote:
> > > On 7/7/26 04:20, CK Hu (胡俊光) wrote:
> > > > On Mon, 2026-07-06 at 12:16 +0200, Thorsten Leemhuis wrote:
> > > > > On 6/22/26 15:23, Adam Thiede wrote:
> > > > > > On 6/22/26 06:22, Gary Bisson wrote:
> > > > > > > On Thu, Jun 18, 2026 at 04:06:28PM -0500, Adam Thiede wrote:
> > > > > > > > On 1/20/26 05:36, Gary Bisson wrote:
> > > > > > > > > Some bridges, such as the TI SN65DSI83, require the HS clock to be
> > > > > > > > > running in order to lock its PLL during its
> > > > > > > > > own pre-enable function.
> > > > > > > > > 
> > > > > > > > > Without this change, the bridge gives the following error:
> > > > > > > > > sn65dsi83 14-002c: failed to lock PLL, ret=-110
> > > > > > > > > sn65dsi83 14-002c: Unexpected link status 0x01
> > > > > > > > > sn65dsi83 14-002c: reset the pipe
> > > > > > > > > [...]
> > > > > > > > 
> > > > > > > > This commit was part of 7.1 and caused a problem for me.
> > > > > > > > I'm running postmarketOS (basically Alpine Linux) on a Lenovo C330
> > > > > > > > chromebook with a Mediatek MT8173 processor.
> > > > > > > > The problem: when the display on my laptop
> > > > > > > > powers off (via suspend or
> > > > > > > > idle,
> > > > > > > > like xset dpms off) the picture does not come back when the display
> > > > > > > > powers
> > > > > > > > back on (from resume). The display backlight
> > > > > > > > comes on and brightness is
> > > > > > > > adjustable but there is no picture. The only fix is to reboot.
> > > > > > > > 
> > > > > > > > Reverting this commit and applying it as a patch on top of 7.1
> > > > > > > > addresses the
> > > > > > > > issue for me.
> > > > > > > > 
> > > > > > > > You can view the config I'm using here:
> > > > > > > > https://urldefense.com/v3/__https://gitlab.postmarketos.org/
> > > > > > > > postmarketOS/pmaports/-/__;!!CTRNKA9wMg0ARbw! jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAN9bmax5$
> > > > > > > > merge_requests/8819
> > > > > > > > 
> > > > > > > > Is there any sort of testing or other debugging
> > > > > > > > info I can provide to
> > > > > > > > help
> > > > > > > > address this issue?
> > > > > > > 
> > > > > > > Thanks for reporting the issue, could you share some
> > > > > > > logs? Is the driver
> > > > > > > saying anything during resume? Also, what type of
> > > > > > > panel is used on that
> > > > > > > chromebook?
> > > > > > 
> > > > > > The curious thing is that there are no real logs in dmesg or /var/log/
> > > > > > messages about this. This picture just fails to come
> > > > > > back. If there are
> > > > > > some kernel params I can set to get deeper logging, that
> > > > > > would help, but
> > > > > > I'm not aware of any.
> > > > > > 
> > > > > > I think the panel is a "BOE NV116WHM-T00" - I used this command to get
> > > > > > info: cat /sys/class/drm/card0-eDP-1/edid | edid-decode
> > > > > > 
> > > > > > Output:
> > > > > > https://urldefense.com/v3/__https://termbin.com/8nbd__;!!
> > > > > > CTRNKA9wMg0ARbw! jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAJooSyqL$
> > > > > 
> > > > > This looked stalled. If I'm mistaken here, please let me known; but if
> > > > > no solution is in sight, should we maybe just revert the change until a
> > > > > proper was found?
> > > > 
> > > > It's welcome anyone to provide a revert patch,
> > > > but I would still wait for the fixup patch until 7.2-rc4.
> > > > If no fixup patch exist, then apply the revert patch.
> > >  From my understanding of things the position in the devel cycle doesn't
> > > matter much in a case like this. To quote Linus statements from
> > > https://www.kernel.org/doc/html/latest/process/handling-
> > > regressions.html#on-how-quickly-regressions-should-be-fixed
> > > 
> > > """
> > >  From 2026-01-22:
> > > 
> > >   But a user complaining should basically result in an immediate fix -
> > >   possibly a "revert and rethink".
> > > 
> > > With a later clarification on 2026-01-28:
> > > 
> > >   It's also worth noting that "immediate" obviously doesn't mean "right
> > >   this *second* when the problem has been reported".
> > > 
> > >   But if it's a regression with a known commit that caused it, I think
> > >   the rule of thumb should generally be "within a week", preferably
> > >   before the next rc.
> > > """
> > > 
> > > Adam reported the problem about three weeks ago, so we are way past the
> > > "rule of thumb" timeframe Linus set.
> > > 
> > > Ciao, Thorsten
> > 
> > This is a kind of odd situation here. The fix from Adam is actually
> > correct, as in,
> > the SN65DSI83 bridge gets broken without...
> > 
> > ....but then, there's some more oddness going on: I tried to reproduce
> > this on my
> > MT8173 Elm device, but there I can resume the system just fine, and the
> > display is
> > up and running like normal?
> > 
> > I'm not sure what to advice here at this point - just adding some info.
> > 
> > Cheers,
> > Angelo
> Angelo, would you mind sharing your config, and the details of what you're
> running? It might be a configuration difference.

As a FYI here is the latest branch I tested that patch on:
https://github.com/gibsson/linux-next/commits/master-mtk/

As far as I remember suspend/resume was ok. It was tested with a
Tungsten510 SMARC SOM (MT8370) + sn65dsi83 + tm070jdhg30 display.
Both the bridge and the display are mainline, you can see that the main
change is in the defconfig where a bunch of options are changed to be
built-in (for NFS booting).

I'll try to repro against latest kernel this week and report back.

In your case, is the panel upstream as well?

Regards,
Gary
