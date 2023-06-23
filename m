Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0ED111A8
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 20:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CABAC433C0
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 20:31:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cFOs10E7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1687552271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7RQGlAB89sk9l3x3cWa6v6OFgBLxqb3tUGFhtwpznI=;
	b=cFOs10E7uZWLVyW6H88E56JaA3dOAMBLQMGR6NQdJwZyjNizqwU3ZfyHQRYRT9uAqGXSHH
	p2bYUzAz2fmLGo5qUpLCtHQdUBUaAfagNQMHrz6qvy5eyXMdRXztJKuCtYW79ctjJfMecv
	a19dteOWy5Dt0q/e6WH/RRu9LVSnNtY=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 16ee00ef (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Fri, 23 Jun 2023 20:31:11 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-440cdef2c27so1596306137.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 13:31:10 -0700 (PDT)
X-Gm-Message-State: AC+VfDxNTgjLnFD1UVVR2GY8bvWepYluXuiHhiCPZNGrmBHN8v9KngQ4
	QqE19oHu27ywAuWJIirwnuc/Cry9uYjqRHyxPIA=
X-Google-Smtp-Source: ACHHUZ5LO3adpOPYHon4zqAOppyav/4fvfwfswqpT0SOQ/rHvf9wtJcG8Z8lqtsxNTbRdRLhJ3UmtHeGbmpZVZi0f2s=
X-Received: by 2002:a05:6102:4421:b0:440:d5e2:7c72 with SMTP id
 df33-20020a056102442100b00440d5e27c72mr3224744vsb.13.1687552269290; Fri, 23
 Jun 2023 13:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com>
 <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com> <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Jun 2023 22:30:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9oC6Kq5qeoSmY5CdDrbGnkcp9sy-9ESXdpRtM8x1_6Hwg@mail.gmail.com>
Message-ID: <CAHmME9oC6Kq5qeoSmY5CdDrbGnkcp9sy-9ESXdpRtM8x1_6Hwg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, regressions@leemhuis.info, 
	Andrew Lunn <andrew@lunn.ch>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus, Ard,

On Fri, Jun 23, 2023 at 7:30=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Maybe it would make more sense to write a new seed at kernel shutdown.
> Not only do y ou presumably have a ton more entropy at that point, but
> if things go sideways it's also less of a problem to have dead
> machine.

We always have to write when using so that we don't credit the same
seed twice, so it's gotta be used at a stage when SetVariable is
somewhat working.

> On Fri, 23 Jun 2023 at 06:55, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > Setting the variable from user space is ultimately a better choice, I
> > think.
>
> Doing it from the kernel might still be an option, but I think it was
> a huge mistake to do it *early*.
>
> Early boot is fragile to begin with when not everything is set up, and
> *much* harder to debug.
>
> So not only are problems more likely to happen in the first place,
> when they do happen they are a lot harder to figure out.

I think it's still worth doing in the kernel - or trying to do, at least.

I wonder why SetVariable is failing on this system, and whether
there's a way to workaround it. If we wind up needing to quirk around
it somewhat, then I suspect your suggestion of not doing this as early
in boot might be wise. Specifically, what if we do this after
workqueues are available and do it from one of them? That's still
early enough in boot that it makes the feature useful, but the
scheduler is alive at that point. Then in the worst case, we just get
a wq stall splat, which the user is able to report, and then can
figure out what to do from there.

Jason
