Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D161103
	for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 01:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51331C4339C
	for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 01:49:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nYxfMu0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1678585760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m28671DtSvMZSay0Sf/f7djYwOu1rgOjKaltAmvlzQw=;
	b=nYxfMu0zJ0nZgDOiPbJVLOC+yveAZkKI3aZQ2y0bF4yjW2C/NiHVS6t6RhKsDPJN7bcKDD
	5pQDnNbmsiW8kHG5HL4ZHWX4q+q6EUjT89P4qWJShzsdCN4ww1Z6moDL6qQrcxeFGVMKQi
	LASV9tlF+/fXC78oFgzV1PwbE8jMkxc=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 71d5b9a7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Sun, 12 Mar 2023 01:49:19 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id u32so1948432ybi.6
        for <regressions@lists.linux.dev>; Sat, 11 Mar 2023 17:49:18 -0800 (PST)
X-Gm-Message-State: AO0yUKUnEZ51QcS5UiCOvcuiab8Q0v23Y+bPdfwiw6Pp41irhdibwbe2
	D/E5pBXEkvYKLP6g4oFUEyXf3WZG7Baw4apZcuA=
X-Google-Smtp-Source: AK7set99T0ABWq7i2uJH1UClARGOA0vXeSrOU+23b42AvBvR0fidQnqBT/Auc/RrhIDA2u4+Bek3tITsGCRbnJSs6Fk=
X-Received: by 2002:a25:9702:0:b0:a36:3875:56be with SMTP id
 d2-20020a259702000000b00a36387556bemr18518887ybo.10.1678585758213; Sat, 11
 Mar 2023 17:49:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:7110:bc9:b0:1ee:5602:53a7 with HTTP; Sat, 11 Mar 2023
 17:49:17 -0800 (PST)
In-Reply-To: <ZA0t/8Tz1Lbz25BZ@kernel.org>
References: <20230228024439.27156-1-mario.limonciello@amd.com>
 <Y/1wuXbaPcG9olkt@kernel.org> <5e535bf9-c662-c133-7837-308d67dfac94@leemhuis.info>
 <85df6dda-c1c9-f08e-9e64-2007d44f6683@leemhuis.info> <ZA0sScO47IMKPhtG@kernel.org>
 <ZA0t/8Tz1Lbz25BZ@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Mar 2023 02:49:17 +0100
X-Gmail-Original-Message-ID: <CAHmME9pudxP07Jx77yUecDLqm2xku3cPJFtk=bY6ACmfL1j5xw@mail.gmail.com>
Message-ID: <CAHmME9pudxP07Jx77yUecDLqm2xku3cPJFtk=bY6ACmfL1j5xw@mail.gmail.com>
Subject: Re: [PATCH v3] tpm: disable hwrng for fTPM on some AMD designs
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	Herbert Xu <herbert@gondor.apana.org.au>, stable@vger.kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, reach622@mailcuk.com, 
	Bell <1138267643@qq.com>, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

On 3/12/23, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Sun, Mar 12, 2023 at 03:35:08AM +0200, Jarkko Sakkinen wrote:
>> On Fri, Mar 10, 2023 at 06:43:47PM +0100, Thorsten Leemhuis wrote:
>> > [adding Linux to the list of recipients]
>> >
>> > On 08.03.23 10:42, Linux regression tracking (Thorsten Leemhuis) wrote:
>> > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>> > > for once, to make this easily accessible to everyone.
>> > >
>> > > Jarkko, thx for reviewing and picking below fix up. Are you planning
>> > > to
>> > > send this to Linus anytime soon, now that the patch was a few days in
>> > > next? It would be good to get this 6.1 regression finally fixed, it
>> > > already took way longer then the time frame
>> > > Documentation/process/handling-regressions.rst outlines for a case
>> > > like
>> > > this. But well, that's how it is sometimes...
>> >
>> > Linus, would you consider picking this fix up directly from here or
>> > from
>> > linux-next (8699d5244e37)? It's been in the latter for 9 days now
>> > afaics. And the issue seems to bug more than just one or two users, so
>> > it IMHO would be good to get this finally resolved.
>> >
>> > Jarkko didn't reply to my inquiry, guess something else keeps him busy.
>>
>> That's a bit arrogant. You emailed only 4 days ago.
>>
>> I'm open to do PR for rc3 with the fix, if it cannot wait to v6.4 pr.
>
> If this is about slow response with kernel bugzilla: it is not *enforced*
> part of the process. If it was, I would use it. Since it isn't, I don't
> really want to add any extra weight to my workflow.
>
> It's not only extra time but also it is not documented how exactly and in
> detail you would use it. For email we have all that documented. And when
> you don't have guidelines, then it is too flakky to use properly.

No interest in wading into a process argument. But if you're able to
send this for rc3, please please do so. Users keep getting hit by
this, some email me directly, and I keep replying saying the fix
should be released any day now. So let's make that happen.
