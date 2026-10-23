Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776682;
	b=3p3vuvog8hVN4ciQc+DZLU2YhrEcX9SGwOIwNStjOElvh7W1AA3QBHDAd8Poq9TU7hXy
	 ZmAlkczN4SJ1AQ4HTadTP2R7O7VcAsamPqnbn80yntNN7feR1jqEot5Nmv1zImFiz6qlj
	 NkGIGbGCaoLeBZ0p15YJ9aVpvyxciVqvOY+isxvfJK+iPuU/K6PRMkdFMTMMZoz5xh5yL
	 5Ktw2dz46nPqgvmzm8phmEMD0LEBP1BrM3mjZ0UGF6UHNACOxgmkqPNnKB35ZNTY3pf6K
	 +sOXxGzhOPkEdN1wJXZD30PTr1eHOd8+d7mmXMitgfU+ddfItxXiWBTEvBfYBKyLL3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lASGxSwfD9Fa0qiAalFQi3F0/w5+yAO/kKxmaqmHFhs=;
	b=vtCQ2qPCmwVUbLdIj5KWVBPvBdQW4tCxKeqt4JOOEu9FtbmEgJzJxtN8Hlj2ly3F1UbM
	 AW/mjV4aJTW1Bt/DXibwLPMI8JjJanro7WJeWKFDupfCESrpRuZf4Z3m5Y2c15XatcC5Y
	 dRppHKfMSu303UPFbk/g6gd23CKdBU4hoTRE+4PMsydbMOTZT2bqg8FbHL24SitBmLej6
	 Egwubeob6p+PUBNCp9X7gRHQ/aIrMxeItjmuTQDLDWgd889ZL5D88SS/jgoTJ/m5lBz+N
	 8zuOZBLSmz7RN3MV2RLi4rs58yKMBv0h6Bq+7z1pF06j+kzrJRvqubPrzpa4kLCRTeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U1wDLRHn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79B606A31D
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 17:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C79B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U1wDLRHn
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso8088191fa.1
        for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 10:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776680; cv=none;
        d=google.com; s=arc-20260327;
        b=RxnXIvtRwK1HieORRDrlb/ITu1J0CeEdFuYaraZjKPFoHR/Dk78j/Y5zREL7CRjrcL
         WE0CaISgLG1kkhQa/qCMVCBNYLY8DJ7sl5A1YmuyulP1xDx5xuMa07u+wtN7DeGtFPTM
         slnK1cSyaQZzfAC5tjVOCJZYSdnPIWxFTwF5K7jx5RkQDMr5inPaRYK0IoVKMaMcS2gU
         1/kLYSv8wp0flDLFvOgZsd2kw3x6dV+B+wVNGA0uRSRkBt27HqDu1gkf5ULO5PVwkeH0
         72Qy+E8CengwPJwdlBWs1AwhKXGCaRpr2aBdAKRfVo3yaiUPdnbGfRRrwGs4c4x5U6iQ
         Da6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lASGxSwfD9Fa0qiAalFQi3F0/w5+yAO/kKxmaqmHFhs=;
        fh=bQ0C/COrjGyf9lcCLSMy7AyRl3ckSAtTolrqJBU0zI4=;
        b=KyI7IRy6syEvaR+Kc1E2bT7HAZlYNHTgpaHXQ8hD4dPZhRhELWAUcc6d5H0Vqxneep
         RMuSHwGgxOu02QcKKb6JBFLZu6N6M9UIwYl4t0OEAjSgsV1D3XEb8/7H+zP6lIrwywuO
         9Bte01TPRu16YKLOfjSC12uEthY3a4mCYTtkL8HzBfZ1T03nS7qfKqW+lUQ+2Vep5zV2
         uYRkm1NoCpKZDeD9s4jFojKD4S2KmzHAgQHBUqn+UGRTOBCmMQGmaZzINKSAoSvhEAIH
         gtMTyZmvOEw7JoTucD2hJI1f1v6w7P+VDAwPRgWe+FimroS+zThGzYqiRVMBhKlkkR+1
         lT6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776680; x=1793381480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lASGxSwfD9Fa0qiAalFQi3F0/w5+yAO/kKxmaqmHFhs=;
        b=U1wDLRHnxqrUhh8yLVf/NFSXY96NCgR5DmY9z7kb4/1o4S+asJITy4bbW8PCHasjxp
         XS3xYLULI3jqSJ989S4aj8Ewd225odePSMJ7hQFMhtxKrbptKcItJJyJhpYij8Iw4OE8
         OlncXLjGUA7DRIovCQHdRWxW8qNmfF15I9xedb5IVpmcqlVjd+Hmiu9nFTNymdsyw8IH
         h4Ru/2byWgJ7PpaMRXQV/BedgDPNYQvRXtLL3lF7jY/q3eU1eB2r2wM6PY/evAUwSiQ9
         egQW+S/oQZRL3RmhL0ye1MXFd5uHmzd6f1N9vuiOe6VFHygCBOAVmDXLE3+bCDYp2zqp
         sxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776680; x=1793381480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lASGxSwfD9Fa0qiAalFQi3F0/w5+yAO/kKxmaqmHFhs=;
        b=C3ITMhyHQTVa6uyLD+RUPI1k+vwjgjVwuLwMcMzmiePxPmxolbyqWUNHtZDnyIgX0Z
         gIH6PYehVfhq13GNDNKiKlDuLhms3FFVy4T2WvsMpTgb4gtqz1IJd9fNckK0eOOpwtNj
         QpDzn0uRZWs2uIuUQXzJc5FBkVvBNpt6vIDeN7aU161Wwu++8o0zXfow5oi90ruB6EcV
         pjwFLa6TjDOG7ZQcI6eI5xCSEPjGe3ttAF1PKT3b/h5QOzZuL2um3yycWvMGSiSd1yQ5
         ISFb7XBtOa18kiu6pYaMOSYAVGhgLxpMprfAxvMNZZWTRfRLd03zsXvybo6TPJUudz0i
         1mCQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6zzHZL9RFT76MSuHTrTciHCPu92A0cIiQeDf/Yp+QZEjORoqRIQNmSjnKe9sAqVwJlTRiB1bFD6VyTg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJn20xhGH7qHEpnsK3cDqDi1K+BuIPMYmr33nG5IPlNTM82gkQw
	SAcdHJefcboDHJEEcM/wzwNAf8/PMsruERqh+ajMfVu0u1cViv2zEagj5bmhtCT3JkujJovckLX
	Q9yCZBZhGScLU/XDfTOqproVdwMxJNs8=
X-Gm-Gg: AYBFou2lDDCfUBauXGhqtDw837zUg9NoSjjNhjbEoPfwTUhxcTOlyCdeUxKdjSMNEa0
	yucD7glt5GqnIfpju9KEnkAInY6wa3GbUx34bcAg+NNL1UWbZaCKWVN28+djFd0FEyhLyXAO+OF
	TTs1c8wa3tOSRaq0lvd2qVVlVNYyU+5iBaJG6tmndIpIg1gHMu/1DUgYi3uVBh3FRXMeuXpAsLf
	ViUq6dTLrsGjCnFgWCc03GVDjt62SJLlCq0NMztJGWVdw1WVf/opJjmt+ZDjw3qE5kjh7BtfX4P
	RVCOfO6HZAhIjAPlNhttQOddmBaJ6ob71Fr5JwgkXuHmyOsDXNwnuBTTETjHQErF1cfJeW5+oTB
	VE7tqNDc1zE1mL3HSGxUYS+DCIOzeFu48eTwAkryFh5uSWjA8yLGh788pQwitKmUnDEk9NCj+GN
	rwTcWYj1mLiNFR+reB
X-Received: by 2002:a05:651c:2115:b0:3aa:f617:5c85 with SMTP id
 38308e7fff4ca-3ac6fce2c3emr78031fa.12.1792776679341; Fri, 23 Oct 2026
 10:31:19 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAAzpgGdksHZjx4jc20zqnAG_PQ2e1ggANQjt2eiycUiWc+vPHg@mail.gmail.com>
 <5e616c87d6855725d0ac726a1de5e88a57dbd312.camel@intel.com>
In-Reply-To: <5e616c87d6855725d0ac726a1de5e88a57dbd312.camel@intel.com>
From: =?UTF-8?B?TG/Dr2MgS0FTU0VM?= <loic.kassel@gmail.com>
Date: Fri, 23 Oct 2026 19:31:07 +0200
X-Gm-Features: AclHuK_5bc_UrTWXpjCHmJv2wY8wQ3iUBulq0P4jSsVVI-7BQsOkwgU8Alb6VW8
Message-ID: <CAAzpgGcdX-hboTJ9xgrx1A3N5eN4OGcPSWR2hKCxyZbJqrCBMA@mail.gmail.com>
Subject: Re: [REGRESSION] mac80211_hwsim: beacons stop after host suspend
 (beacon_timer is CLOCK_MONOTONIC, expiry computed in boottime)
To: "Berg, Benjamin" <benjamin.berg@intel.com>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Thu, 2026-10-23, Berg, Benjamin wrote:
> Do you want to submit a patch?

Done, thanks for the suggestion, this makes it my first submitted patch :
https://lore.kernel.org/linux-wireless/20261023-hwsim-beacon-clock-v1-1-9b3=
f3ffc099b@gmail.com/

I tested it on v7.2.11 by building the patched module out of tree.
Details are in the commit message.

Thanks,
Lo=C3=AFc Kassel


Le ven. 23 oct. 2026 =C3=A0 10:51, Berg, Benjamin <benjamin.berg@intel.com>=
 a =C3=A9crit :
>
> Hi,
>
> On Sun, 2026-10-18 at 01:12 +0200, Lo=C3=AFc KASSEL wrote:
> > [SNIP]
> > but since commit 933f5bec98a1 ("wifi: mac80211_hwsim: register beacon
> > timer by calculating TBTT") the callback re-arms it with an absolute
> > expiry derived from the TSF:
> >
> >   hrtimer_set_expires(&link_data->beacon_timer,
> >                       mac80211_hwsim_tsf_to_boottime(data, tbtt));
> >
> > and the simulated TSF is based on boottime since 1926f4e06dce ("wifi:
> > mac80211_hwsim: rename and switch simulation time to boottime"). So an
> > absolute boottime value is used as a CLOCK_MONOTONIC expiry.
> > [SNIP]
> > Possible fix (untested): set the timer up on CLOCK_BOOTTIME, like the
> > NAN timers in the same driver already are:
> >
> >   -      CLOCK_MONOTONIC, HRTIMER_MODE_ABS_SOFT);
> >   +      CLOCK_BOOTTIME, HRTIMER_MODE_ABS_SOFT);
> >
> > (in mac80211_hwsim_new_radio(), for link_data[i].beacon_timer)
>
> Sure, that looks correct. The TBTT (target beacon transmit time) is
> calculated based on the TSF, which in turn is based on BOOTTIME. So
> obviously, the timer should be registered using CLOCK_BOOTIME.
>
> Do you want to submit a patch? No need for a long explanation here, one
> just needs to point out that TSF is based on the boottime and the timer
> needs to be consistent with that.
>
> > Reproducer (wmediumd not required as far as I can tell, the timer
> > path does not depend on it):
> >
> >   1. modprobe mac80211_hwsim radios=3D2
> >   2. start hostapd (any open or WPA2 config) on the first radio,
> >      scan from the second one: the AP is found
> >   3. suspend the host for a while, e.g. "rtcwake -m mem -s 60"
> >   4. scan again from the second radio: the AP is no longer found;
> >      "iw dev <sta> station dump" on an associated station shows
> >      beacon loss increasing
> >
> > #regzbot introduced: 933f5bec98a1
> >
> > I found this while building a containerlab-based Wi-Fi lab (hwsim
> > radios moved into container netns, wmediumd on the host).
>
> It seems to me that such a setup should not really be suspended. In the
> usual way that the hostap hwsim test suite is run, the issue is
> completely avoided by using a time-controlled environment that runs
> within User Mode Linux.
>
> Benjamin
>
> >
> > Full disclosure: I am not a kernel developer and not very technical.
> > The symptoms above are real and were observed on my machine, but the
> > debugging, the code analysis and this email were done with the help of
> > an AI assistant (Claude). The analysis may therefore contain mistakes.
> > I am happy to test a patch or run any commands you send me.
> >
> > Thanks,
> > Lo=C3=AFc Kassel
> ________________________________________
> Intel Deutschland GmbH
>
> Registered Address: Dornacher Strasse 1, 85622 Feldkirchen, Germany
>
> Tel: +49 (89) 99143-0
>
> www.intel.de
>
> Managing Directors: Candice Moore, Jeffrey Schneiderman, Ramachandran Sit=
araman
>
> Chairperson of the Supervisory Board: Sonja Pierer
>
> Registered Seat: Munich Commercial Register B: Amtsgericht Munich HRB 186=
928
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.



--=20
Loic KASSEL
07.67.99.08.10
