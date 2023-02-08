Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745D77F
	for <regressions@lists.linux.dev>; Wed,  8 Feb 2023 02:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FABC433EF
	for <regressions@lists.linux.dev>; Wed,  8 Feb 2023 02:31:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kGmAAbpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1675823512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7hemVHJkzyEdMXCbMpFmzxQSbtTaU4nVB65VwzkWZIs=;
	b=kGmAAbpp5PmWKMjaTFU9m+YZpyBTlfTyFhkfQO7EJVU9A8xm5Ct+yr6rZKBjpjbhXsM3k9
	eMOOYrvWttcfYzOPPKTN2UKp0pEjMg0sZIDdOndCRV0rYIP/tWMgcQQ2STYt3fZjj7SuCk
	h9LqvpdW7pnn5tD5c222DtbWRYuy0LM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c625e57 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Wed, 8 Feb 2023 02:31:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id p9so1792023ejj.1
        for <regressions@lists.linux.dev>; Tue, 07 Feb 2023 18:31:51 -0800 (PST)
X-Gm-Message-State: AO0yUKUAH5yZzGFdYfeyprPxp0I0femeApwCaIfA2D9zawd5u3eYML1u
	PEC7AL20seG3tZ2dux6GNLRE2/QsIh2T4cP2IWk=
X-Google-Smtp-Source: AK7set8FqOcnj5YNRuRXgSkVmgG8iHzRDZ6CtsFJRJsR0dtMC7G7yD+8RwNIFtOT95Klvbkepy0hidZ4mGEMi6roTIE=
X-Received: by 2002:a17:906:e24c:b0:89c:7298:2de4 with SMTP id
 gq12-20020a170906e24c00b0089c72982de4mr1176679ejb.91.1675823510908; Tue, 07
 Feb 2023 18:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3a196414-68d8-29c9-24cc-2b8cb4c9d358@leemhuis.info>
 <8a7775912f31394944b43db12adc78efd84b1fad.camel@HansenPartnership.com>
 <Y+MFNvr2deX7+Mxa@kernel.org> <Y+MFUZ7WD0rX2rU9@kernel.org>
In-Reply-To: <Y+MFUZ7WD0rX2rU9@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Feb 2023 23:31:37 -0300
X-Gmail-Original-Message-ID: <CAHmME9pwT52maXyQMNutv6svgDxAaz3L4MDeq_KVDutOAe8uPw@mail.gmail.com>
Message-ID: <CAHmME9pwT52maXyQMNutv6svgDxAaz3L4MDeq_KVDutOAe8uPw@mail.gmail.com>
Subject: Re: [regression] Bug 216989 - since 6.1 systems with AMD Ryzen
 stutter when fTPM is enabled
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, reach622@mailcuk.com, 1138267643@qq.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 11:13 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, Feb 08, 2023 at 04:13:16AM +0200, Jarkko Sakkinen wrote:
> > On Thu, Feb 02, 2023 at 07:57:37AM -0500, James Bottomley wrote:
> > > On Thu, 2023-02-02 at 11:28 +0100, Linux kernel regression tracking
> > > (Thorsten Leemhuis) wrote:
> > > [...]
> > > > So it's a firmware problem, but apparently one that Linux only
> > > > triggers since 6.1.
> > > >
> > > > Jason, could the hwrng changes have anything to do with this?
> > > >
> > > > A bisection really would be helpful, but I guess that is not easy as
> > > > the problem apparently only shows up after some time...
> > >
> > > the problem description says the fTPM causes system stutter when it
> > > writes to NVRAM.  Since an fTPM is a proprietary implementation, we
> > > don't know what it does.  The ms TPM implementation definitely doesn't
> > > trigger NV writes on rng requests, but it is plausible this fTPM does
> > > ... particularly if they have a time based input to the DRNG.  Even if
> > > this speculation is true, there's not much we can do about it, since
> > > it's a firmware bug and AMD should have delivered the BIOS update that
> > > fixes it.
> > >
> > > The way to test this would be to set the config option
> > >
> > > CONFIG_HW_RANDOM_TPM=n
> > >
> > > and see if the stutter goes away.  I suppose if someone could quantify
> > > the bad bioses, we could warn, but that's about it.
> > >
> > > James
> > >
> >
> > And e.g. I do not have a Ryzen CPU so pretty hard to answer such question.
>
> ... about hwrng

Well, the options here are basically:

a) Do nothing, and just expect people to update their BIOSes, since an
update is available.
b) Do nothing, and expect people with broken BIOSes to `echo blacklist
tpm >> /etc/modprobesomethingsomething`.
c) Figure out how to identify the buggy BIOS and disable the TPM's rng
with a quirk in this case.
d) Figure out how to dynamically detect TPM rng latency, and warn about it.
e) Figure out how to dynamically detect TPM rng latency, and disable it.

I think given that a firmware update *is* available, (a) is fine. And
the generic workaround remains (b). But if you want to be really nice,
(c) would be fine too. Somebody with the affected hardware would
probably have to send in some DMI logs or whatever else. (d) and (e)
sound possible in theory but I dunno really... seems finicky.

Jason
