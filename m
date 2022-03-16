Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86CD3B23
	for <regressions@lists.linux.dev>; Wed, 16 Mar 2022 17:50:25 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 15-20020a17090a098f00b001bef0376d5cso3155352pjo.5
        for <regressions@lists.linux.dev>; Wed, 16 Mar 2022 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xhoEzT3FlgwmaLIUhwD7E5Tjj9F3HD6xs6kiQuTOyxI=;
        b=VdaWQ97wKhDRAr32HE6STpT7x+Kmn+zgb7z1Kd1cOR+dUBiIl4NsUEyLw5riU0/X3H
         o5vAbrUvgLf0LeaPd55/gtq1fGZIvpE5lKRqLAo/oY8yep4tJA39pQbuS8XDj1eVuPsK
         fC/GH7osPv9CXxDqLz8IbxFMVzkkh816m8clyi+F1j8T6sTPX9ZmooGyvVK/TIANpxjl
         WZLUzQaHZsCDy32PXCqzFCMU0mZRzDnUr+E1VUHiLrJJoWBnCoqHlCbir8SNUBOlVoPH
         gEU8Ubav4vum/1vWDWaswkPfKw6tRkSdeKyH3pBKpnvKAlCMzob1CnQXsFYsXfTu1nXH
         8IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xhoEzT3FlgwmaLIUhwD7E5Tjj9F3HD6xs6kiQuTOyxI=;
        b=mutitMzR8Ds0sLsI+0baLb+v5W7PvzY9pglPaKBA+ybi1xQ0OkdMsOITpquxRlGRMI
         6z4CAF+3QI79CCkMHVCfaudpmYg/OnMcc5jGenZj8+IwwdJ139T/dsIuUP06tlGVrF50
         dDsDeMHVIszS+j7pc9OZTkye8GBJwBzk+Ta0+XnCqV0013kFch9XxN14otZhtRehi9SA
         Rbd7qel0u8wuDV/G+3f0ZzXs4YiNlX890+uQRxRohLPMHE7qM0GTLEo2lNlRZ1QfruUq
         EIhqw5CKEGTdlR2y88unn8WJ8SAVdzMwyYwOi8zdGaqHjqvfgtiIQg9sVjHPr0OQ48KP
         QpTA==
X-Gm-Message-State: AOAM5334ycSBPQggWa19L+IBeRtTEJpYIETfpZp6Obh7S1/606CbX5dK
	HtQkgAKvUGuPZE1WNK7isFNPb8leL9hRLfuVwnc=
X-Google-Smtp-Source: ABdhPJyGyueFKDTCggNOCf4JrRL0Ele7BjHEaC5N4esbX2kSMluKBbc/+V9CSX1WfU7i4DxdwPwEIjE2Rbaun/s03jY=
X-Received: by 2002:a17:902:ea0b:b0:153:c2c9:71b4 with SMTP id
 s11-20020a170902ea0b00b00153c2c971b4mr1118774plg.110.1647453025144; Wed, 16
 Mar 2022 10:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO_iuKEL8tHnovpGiQGUxg7JUpZFxHpxhOHbqAMgbt5R4Eftgg@mail.gmail.com>
 <2d1c129b-d473-39e3-69b7-6f36dc1682a6@leemhuis.info> <9312eb18-840f-9a1f-bcb0-8e3a43e45239@leemhuis.info>
 <236d45a6-8b88-c02e-a61d-ce1773fdb0ef@lwfinger.net> <02ef7552-67f5-dbcf-ece6-87b5b49e1bb5@leemhuis.info>
 <CAO_iuKHQ2DdLvSegcoezCzRVHqNFg+HM8qk1fr1n=s9cMz8QFA@mail.gmail.com>
 <877d96xlbk.fsf@tynnyri.adurom.net> <023e90a9-01bf-4334-a69a-259705ffa55f@leemhuis.info>
In-Reply-To: <023e90a9-01bf-4334-a69a-259705ffa55f@leemhuis.info>
From: Nico Sneck <snecknico@gmail.com>
Date: Wed, 16 Mar 2022 19:50:13 +0200
Message-ID: <CAO_iuKG0gE=5fEKMF2A+iWUhsxtnPOQtTQTkBRo2vH5CmKu7iA@mail.gmail.com>
Subject: Re: rtw_8822ce wifi regression after kernel update from 5.15 to 5.16
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Kalle Valo <kvalo@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Yan-Hsuan Chuang <tony0620emma@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Wed, Mar 16, 2022 at 12:14 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
> FWIW, in the initial report Nico mentioned he tried to bisect the issue
> and there mentioned a few git commit id's which are from mainline, so it
> seems he tried mainline. But maybe there is some DKMS or akmod package
> that is interfering.

Indeed, I've reproduced this issue on mainline kernels, and also bisected
using the mainline kernel.
No DKMS or anything like that.

> Nico, it would help a lot if you could clarify the situation and maybe
> try another shot at a bisection.

Yeah, sorry for being slow to respond. These days I tend to run my personal
computer just on the weekends, thus this is a bit slow. Also, this issue is
hard to reproduce, usually it happens within a couple minutes after booting,
but I've actually now been running a vanilla 5.17-rc7 (commit: ea4424be1688)
for a day, and the issue just popped up.

So I can confirm, this issue is still present as of ea4424be1688
(soon-to-be 5.18).

This is how it appears when pinging my routers gateway address:
> 64 bytes from 192.168.10.1: icmp_seq=20846 ttl=64 time=29780 ms
> 64 bytes from 192.168.10.1: icmp_seq=20847 ttl=64 time=28771 ms
> 64 bytes from 192.168.10.1: icmp_seq=20848 ttl=64 time=27768 ms
> 64 bytes from 192.168.10.1: icmp_seq=20849 ttl=64 time=26763 ms
> 64 bytes from 192.168.10.1: icmp_seq=20850 ttl=64 time=25757 ms
> 64 bytes from 192.168.10.1: icmp_seq=20851 ttl=64 time=24752 ms
> 64 bytes from 192.168.10.1: icmp_seq=20852 ttl=64 time=23747 ms
> 64 bytes from 192.168.10.1: icmp_seq=20853 ttl=64 time=22742 ms
> 64 bytes from 192.168.10.1: icmp_seq=20854 ttl=64 time=21737 ms
> 64 bytes from 192.168.10.1: icmp_seq=20855 ttl=64 time=20734 ms
> 64 bytes from 192.168.10.1: icmp_seq=20874 ttl=64 time=1298 ms
> 64 bytes from 192.168.10.1: icmp_seq=20875 ttl=64 time=455 ms
> 64 bytes from 192.168.10.1: icmp_seq=20876 ttl=64 time=3128 ms
[...]
> From 192.168.10.107 icmp_seq=20925 Destination Host Unreachable
> From 192.168.10.107 icmp_seq=20926 Destination Host Unreachable
[...]
> ping: sendmsg: No buffer space available
> ping: sendmsg: No buffer space available
> ping: sendmsg: No buffer space available

At the same time dmesg is flooded with "timed out to flush queue"
and "failed to get tx report from firmware".

And just to reiterate; this does not happen on 5.15. Only 5.16 and up.

I'll kick off another round of bisecting now. Will probably take me at
least a week to follow up though. A lot depends on how fast this
issue pops up with each round of bisecting.
