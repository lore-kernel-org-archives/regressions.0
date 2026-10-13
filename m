Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537C6284B4F
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876517; cv=pass; b=r35f93acPHO5bMBwIEBJVHpC0Ie+MTte860CpJzGPTiLNpi/d8M5IA3HF8PxAFg6Uj9lM4JhMweIvMuGOSBrPE0xiHDXS7Jdzn1EGP3mbq0unkaHvWl3MHUryAWEAY4iB5J68hstSpjQXaHeA1koVN0vjUetPzYA43prcUowHMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876517; c=relaxed/simple;
	bh=VDBmbDNAv1h36mVjKLxWMPIBZ3FcUkHtn28nSPBhjxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRe7WaPMozE3hljjL9sPxatfHa3BpOfnP2lCLDp0UZYG/fvPk5qpfD2CRBcTbAyLzd/TeH7rW7Bp3KtHvF+7M5Hn3RcsAZ/s0v8rxXsaOlVsbkRHHX1w2Js90wln+v+uAMvlmsLzIK8Ar8c5cC/qDjlrQFN3UQearsHgFtB4UX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=iAlyMZh8; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="iAlyMZh8"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso3154898e87.1
        for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 00:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791876511; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGkfl7tUctDG5p6r43vMP7tlgSF5kjNfQQ3+HLGPirSNi0UD0xXlqL7VEnqgsYEHD7
         SlOyOiaUCrIAC3R84688FobOrVnxTI3sGqbn3+Qwh+HFgIxuOX+wjBf+tYutuqDBgDPP
         rpH6EgosujOSAEaGY4Q3xPgQyIVqhhZYrv4TIgtGefYBQSOS/lMPeFIBXlE1dDpiV86X
         O4mGmvtit51/wXEmLPGkQV31DAhbwbW3YTYcJYO6V0nSoonkI0eZAXhB6ReI359zz7c5
         LbXaeu7OKyZJkhEDrJ7hdQAK1u0GkjPhRWrr437hsjD78TvIJPkD0JUjV57GiGVld+gd
         DdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dYUiTz8cJsC4eMm5UNiPPT6RbOVFDPm0rzI9f7/DL0A=;
        fh=v7PBFZqSqkURig3iJ+LR/pRFy5SkHyUDSVuldnuYLoY=;
        b=OiSTfwZX5kQ+/ja8yGkaVYLEipo7i42Wsq1Zmhlw6KMU3vwDUgQJ2MN5daHVqbysgx
         Y7S2a6juUOgbKMd0eTLoKjPWJ/jmxzrsNnRKQMFvbP6Vwt7mYtgYciPNdAyYGOq0ksHS
         ve5Wobw42DNg/oYDMg25XaUzbv/144eHeUg95EqolGQOWeCmBzdByAApVhxvkL8l2IGn
         lOjkFj8jW3jr9D+jCzC1N4oeTnB+TRxOPAIcrFEPwY3DOKlWjXcHZYQ6GSImnWJTPMEa
         AvJanc27I+41CPhnJ/SnIp1SLEd9YavADeltDHko5+8zim+cFaoMMjjQvTiL2Id6239+
         87+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791876511; x=1792481311; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYUiTz8cJsC4eMm5UNiPPT6RbOVFDPm0rzI9f7/DL0A=;
        b=iAlyMZh8dOVdQrtN98FRj9DftnCDu4N2t13oKE3jRe95RFPtAn5OyiTBF0fbwq1iWv
         sqpQHZz7ZmOo4Pw4L2rSgTfWMj/KTx4qQZZVfMa8B31MlCjYn2fTUEV7hYdKFJ/K/xAM
         Do5G0Ogs0pc/xO5MG43GdbJsZFBxVYtVaZr2XfGp6Dn8jgJYCRWDDSB2SxkfbSDpB44X
         ctU6dmIvgTC97uRWEmlIRZIsYNPfM68ZQ/Q1xvFoE7StNgknMsdwDGzH4J4Fb+E5iexO
         JSTMTU75lO5nXan0K4/Yvq3Tuo9yjCbZkVuXpEMNughx8OYrdzgcA3esJ/Rfn3dPOurd
         ptRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876511; x=1792481311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dYUiTz8cJsC4eMm5UNiPPT6RbOVFDPm0rzI9f7/DL0A=;
        b=Qw3zlfLeSwBI/we04I4YkFih19QxobRGSTH+2+mEcRkGuTHrGYaBiI149nbzgRGodV
         SWl2c5J1woZZ3nbuRL1gKxSHipNOwTE8ErveOMcX0yi3jqbiaNy8y0zOpyBXszVjKw4/
         trF7NCVlFhloKwgOzaXHJ1OuXvG+xZCp75F2zZZW4K2urZ+Bhc/C7937fR0bLf75ozeU
         71/5tfB/2zl0tntO44QlnmKgEbez9rOszwsO39fnOzT119Z9HOLvwsE5py5w6cvoSG3H
         VYvQqOoVsHY9nBSqXhxbr9IDYb7hS3nMswby82LQTnk6q8lDFGrZYxm3ju4d63thPb/B
         LOtA==
X-Forwarded-Encrypted: i=1; AKwUvByObju+uyaFTQI4xwKCcAxh+ODLnpGVxE7M2DCb3+HSLIDfr5CahJDjF4A97fSewYS7yYkx1ME8WpIOhA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJdWaZijkdZBWLiClOF4CCwDYhLOlL0vTGTD5/KNevkRW42fWVc
	JqawlxoNDSSti4GRLjUmzy43vOnSRs2Gm9i4PnmpwSSE5eEtKJ9hkU0nKAsC3OdUgRhKUtg+tHZ
	qXa0g7duB+k/BxMHFcVKxMQlz6x/f2+CFlivll6FjGzyy0L66Oc6dsQnSnH5S
X-Gm-Gg: AYBFou3YDGxdBUg20/3GogyBIPwpwc22kX5H4HiQCvef+47AGmCpMuVDp9L8E05d8f8
	uzryYLGTChh4sc3x6e4BZEFTJjVNMaDG/nWs+4Fd8O1w+mI0eqHFn21hoQtoIdtnDn3hiGxvEAq
	Jg4kugygSSRzq0fBsALxkXdBkSpxlfxH1t4VlEzxvRo39TRoU0jSLWr7lnxVviQ1bGQN8X+vx4F
	G0Eyod4mQlV7DhBLyjS2UTYVRbDujLhGAmL/0DsVduofUxSoMfODa8f6J9f1h6ku3gqL9LttQqg
	1oT6/hK3a6rReQskIWF1rkqvfv/W5R8RBwlWYMH//kjjGkvYxoLH+BvTRG9ocsRUvHiXTHOPRjj
	asdqUO4UzhaNINFrQQNJPDg==
X-Received: by 2002:a05:6512:a83:b0:5bb:27df:414c with SMTP id
 2adb3069b0e04-5bcde8d4e11mr4380160e87.45.1791876511001; Tue, 13 Oct 2026
 00:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <a6b71984-cd0b-4e81-a240-ec05abc6327a@leemhuis.info> <179186742507.11414.3709235533520575164@freya>
In-Reply-To: <179186742507.11414.3709235533520575164@freya>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Tue, 13 Oct 2026 09:28:19 +0200
X-Gm-Features: AclHuK9-3hXsyGzmHqElNPfneC09KIvVaOcvv-I6B6U6I2gxHhOmuQTkYu2Jgv4
Message-ID: <CAFERDQ1ygWAUbGCpzC6wFzfgAjMFmB-LpYmQp380N6D=2GLfFA@mail.gmail.com>
Subject: Re: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in
 monolithic kernels since 6.19 (VCHIQ destaging?)
To: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, 
	uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jai, Thorsten,

> Hmm, no answer, so it seems nobody really cares. A bisection might help.
> Or at least validating your suspicion, hence: why can't you check the
> parent of aa125180c6738 and aa125180c6738 itself? Or at least the range
> with that commit in it? And is latest 7.3-rc still broken?
>
> Ciao, Thorsten

Thanks Thorsten for the follow up!
I didn't bisect because my image builder tool was not meant for kernel
development: it could only download stable release tarballs signed by Greg.

But now I've found a way around it and I've just bisected the issue! I've
bisected through the 6523 revisions between 6.18 and 6.19-rc1.

(The bisection was made on a Raspberry Pi 1B rev2 this time.)

> aa125180c673881f88b528600b57865dc158b3a7 is the first 'bad' commit
I confirm the issue was introduced by following commit:

> commit aa125180c673881f88b528600b57865dc158b3a7
> Author: Jai Luthra <jai.luthra@ideasonboard.com>
> Date:   Wed Oct 29 16:00:10 2025 +0530
>
>     platform/raspberrypi: Destage VCHIQ interface
>
>     Destage the VCHIQ interface driver to drivers/platform/raspberrypi.
>
>     There is still the remaining TODO item of improving the documentation,
>     which can be handled post destaging.
>
>     Secondly, multimedia drivers like codec and ISP that rely on this
>     interface need to be upstreamed. And lastly, the drivers that facilitate
>     the shared memory between VideoCore and Linux, like the vc-sm-cma driver
>     and vc_mem char driver also need to be upstreamed.
>
>     Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>     Link: https://patch.msgid.link/20251029-vchiq-destage-v3-6-da8d6c83c2c5@ideasonboard.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

#regzbot introduced: aa125180c673881f88b528600b57865dc158b3a7

> Sorry, this got lost in my inbox last month. It's likely my series that
> destaged VCHIQ broke the ordering as Martin suspects. I always tested with
> modules enabled so didn't encounter this issue.
>
> I'll look into how we can ensure the VCHIQ bus gets registered before
> peripheral drivers (like audio here) when CONFIG_MODULES=n. If someone
> already knows what to do, pointers are appreciated :-)

Thanks Jai!
I'm willing to make the patch, but I'm not familiar with initialization order
in the kernel boot sequence.
Would also love if someone has pointers on good ways to influence order of boot
sequence.

Martin
