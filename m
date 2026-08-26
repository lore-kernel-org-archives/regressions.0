Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072F5456291
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760216; cv=pass; b=WqXWJx943D6Zs7lfK4wDaRZWqdBhYRyxKHN/hUFtuKsJIF15B13hV7zJkkkE//Axm6FynOcEGder8Dd+F+p0xp0VtSLOySOrEMHS4xJLN6lv+YRfACXjW1QLRrgdhtnWWpGJXwx+OA4AFS/gikkzuo8ImjXoqGcL+voNSCGrWKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760216; c=relaxed/simple;
	bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0uUKNEcYLva7PiNmC46up/GfU6YIBWfA7FU/eGzNJq3cNLRiMYFPE0oUlqfJGgNeL3tToC688fC/CylMIX0GTvxgJQJ746aFrn2Lmwa/i5vvYlBSrFNcdY/rs9HKOf3JzjvCZPS02OQTjG1a1Qbh5yvQP2kkSy0pTUTDrHfVhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSShRAhW; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSShRAhW"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so9049841fa.0
        for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 09:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760199; cv=none;
        d=google.com; s=arc-20260327;
        b=iOBHo+2EZ2+BPpweSTk0ra1RNqZiCEsiVVcd/LtiidKNZu29PDRSvbARc0KGxvD1i2
         yXMlcEVazaT5h73zsL3JyVr/Dz9UeeTNQNssIZIUGOQqWO0Yv3h9r8wQtY0n3/fPGbYA
         SfEGXLaWcMjgVQUzZCTvPt6CCGJjNq8D4jfoqsdcJeA9TpKjCdGfZMVzfPoVpsGY2VFQ
         +MWW3dMkCgbIxWrkQZjxr24S2gYS08r4Ixv9DviHxuIekpPLufTXGHyLEbdMCz1FjdEs
         n4dgFMt7aqEb1eWgcDZPItWV36120E2Ve9Sy5jX2s+rrOjtGRBsQS4sq5EDU1gRmv9B9
         XPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        fh=UNGwQ0jRYMaF1J5q24IEv0c9E8QlLtlNOcCSFvjE9h8=;
        b=R/Gd3eeStoflSleDTERtB1WOeMZhbbk9wXT1k5aJj2j55FAdJ3djFYYkk1Vj2ZqUlV
         6+Erf5EQYZSAoZ/wLsYKlQJWNCgkRYu416hLlEs89aeTHYGLzHqrou4HgDPG82lUvIDU
         OqJA2Be94dL+x79LY+zhhkMontoHv0l4JS41q7M5+08lUC5eGIcO8vL8cm9U2Y0Fnjvx
         pNbkh6HSGOyeNiYN6orAo2zGbWOCPG61c1w08jPDUugV1b3YhnXAlnHhLssM0ejuB1Xh
         PaKVrgJYRrf6OGmejW7A8O4liTj5PLzFqG8NSi0my1zPDPPlBoljxUkWaee4kJjamS7y
         Qd3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760199; x=1788364999; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        b=bSShRAhWrqSMvwyKUfzg5VvzOqrN4+91qw4nXTKpe7YWPcPV1XUrIUsnRebZ/NSOfm
         hWn2G6vj/9VqvmZOfxK6DM0NJCkW+qvliPP5d/d719E94juM3E1ZiaOW2YT7lIbj3euP
         XO5TAX2qS1zbqeJklGzz45CkVrA9ciZ/Blg04X3ugepTwx1dyOaXox71+D9nv0sR39is
         eEYsazua51Uu5K1DNqo1p5mXudWMwMxzf8HGlJoJIqdAwA01+1b5LPIG37ZcZvu3BQfv
         2VzfiDjJ/YOk3EHC1p7wfDMqOY4klc5RYY3v4uxuo1FGH+18qg7052SMBchPO5b/Scc9
         aiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760199; x=1788364999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        b=etfiO4nD4Akxjlik660dXUmM92kBgvx/oUK6xugmyQyiR7YdaP85IWWp+9F2puftmc
         YSThLJyFvOE73EfRoP8eGrGxdhTogQXHNyc+fE/BGpOLwpBPTinxvec9mbC8pD+BEAq2
         ShfYfwl6aL2pTryYaYsjVjXwxsDro5f37SX1fDsWltihkKUlVFcQWFr9NXPZDelqXPYA
         8j8NyVYMQeZL0QfvdLWkZkQPjGRcm1ChK9L5+DRQwGmYw6t3jcNFTpFvRjczF5lX1ccg
         X5NBTtR/z9UixX6sWqtwrRF7RCsrglXXcW6f8aNAmX78+vwYB7voZHHiHYLKZvUs4Bns
         i1yQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3G+hzGuZU5E2DNbZe+f01yflA5kxCkFTaQSDDCAFJvO+TY+eCGjllhzibH3fEL2OiJmp5A6/lDTNCnA==@lists.linux.dev
X-Gm-Message-State: AFuF++loI5GXjirLDcktz4+BJH+9dRasTBEDQkJ8/HPYyM/G2q6vlg0T
	dDawf/1G0dP22xsSBZ7zdKXvBUhsOkttTJpzAQ+udWGHoWNX3/uef7TCZEIEB6zka/hCmXRMmTC
	fPEheNJHTWTR5gp6eAxxtROvlG6CHmjw=
X-Gm-Gg: AR+sD12d6YqH8PEZDkKeMHfQ3pj8KLfunYG8WuT+9aIh2M4JvmByO16RyZcJ1VK4SWd
	MtjB2ZWAb5yyRAhnC3DkgjB9P/1REy/tYvDTYXGuVdd4exnibJvGqFNkzY3jkCX3np21QE6H14R
	zzTHKqD3pRqgzwBYOinl48ZaUrhJVhVFwn8O84IWGek5W1CJXdE0QdRAMBUy4MAHWuZhKOdzlAX
	jhgb5vlaWZkmOz+u/u82cwNqF75S0mDr76K/bo8jB8O7TINg+dfZ1103qz/UF1FWTUg9aEXi8Cc
	0B9awz64sKPdo+uy1bAPiaqGjaPabiSqSpMW/WJWLittzh8rd5FsrjseHxR75DUocMpFRoAvJxn
	Q
X-Received: by 2002:a05:651c:a10d:20b0:3a1:476:74b3 with SMTP id
 38308e7fff4ca-3a1fd6605afmr15291371fa.9.1787760198919; Wed, 26 Aug 2026
 09:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info> <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com> <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch> <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
 <ao7aLXk9q_v_jEyX@eggarch> <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
In-Reply-To: <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Wed, 26 Aug 2026 18:03:06 +0200
X-Gm-Features: AcwNN1VMj1i9qHLHYCgFf_wI4NJMgmrhr4t1IuAyWuVvRr1oKaUch4AAYMJyJrg
Message-ID: <CAPyJwA8CNeUnh2kzYktF8OR2T2QnVNN9EUnrUci7_419bF4QDw@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Mathieu, would it be possible to test different values for
> USB_SS_PORT_U0_WAKE_TIME in hub.c? Especially 120ms is interesting.

I reverted to the stock version of hub.c, and changed the
USB_SS_PORT_U0_WAKE_TIME to 120.
-> No crash for 1 hour, but I will test this deeper this evening.

Where I am a bit puzzled is that Mario Limoncello from AMD just confirmed
that this was a platform issue, only affecting StormPeak, for which AMD alr=
eady
has a fix.... Or maybe there are more than one issue here?

On Wed, Aug 26, 2026 at 3:40=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 8/26/26 15:35, Lovekesh Solanki wrote:
> > On Tue, Aug 25, 2026 at 11:43:22PM +0200, Mathieu Fluhr wrote:
> >> The patch you sent makes the issue go away. I am now running the exact=
 same
> >> scenario for 2 hours, without any crash.
> > That's good, thanks for confirming.
> >
> >> However, I am not sure if this can qualify for a proper fix, since I
> >> do not have any
> >> external hub connected to my motherboard: All my USB devices are direc=
tly
> >> plugged into root hubs (and at the moment, there is only a keyboard an=
d a
> >> mouse).
> > Yeah that's the point it only skips the 200ms hold for root hubs. The
> > external hubs still get their fair hold since a parent exists for them.
> > So external hubs are completely unaffected by this patch.
> >
> > On 'proper fix', I think it is, even if we keep this bug seperate for a
> > moment, it makes sense to not give root hubs hold they don't need.
> >
> > I'd love to hear more thoughts on the patch.
> >
>
> Roothub needs some time to settle as well, but 200ms might be excessive.
>
> xHC can triggers wake (PME) when a connected USB3 device starts signallin=
g wake,
> but port registers changes are not always visible to driver before link t=
raining
> between roothub and device is successful.
>
> My educated guess is that 120ms should always be enough for the roothub.
> This is also the lecagy msleep() still apparently left in xhci resume
> to detect port changes in xhci runtime resume if there are USB3 devices.
> That msleep was supposed to be removed now that we got the hub changes.
>
> This 120ms can probably be further tuned for roothub in some cases,
> especially if resume is due to userspace action instead of xHC wake signa=
l (PME).
>
> Mathieu, would it be possible to test different values for
> USB_SS_PORT_U0_WAKE_TIME in hub.c? Especially 120ms is interesting.
>
> See when system no longer crashes
>
> Thanks
> Mathias
>
