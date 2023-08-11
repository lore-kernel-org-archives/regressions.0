Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A196B8468
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 19:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F650C433C7;
	Fri, 11 Aug 2023 19:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691782113;
	bh=Qwn9nJJxT7GtLecLQ803wJtLDl1iwvMz887QXkdDfdg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=sd44wt2K7mPeq4mn3lD58KgWAP+5hvdkTjRvak8PcOc5ivRx2Gq3LlHidWFR0YA3u
	 2Ql+yquNQureKaE7fVWETtW/urr5YDljGTGiTz06oqbOgs93NfR58t8b+Y+UnJhSv8
	 BEns2FIPTrpAckUoIusDCsxDaKW6niaoXyOJqOJo1TTuqsNmdiI58iUWVzgF7vdzFO
	 GkZh/1OjlNBECJPS9f5GrO3dQdIgTfRhFDH3D2oY3QUvpptYrLNh3cGdbRaI5RLoiG
	 Acrb3FLExtTn8TdgUoSGdIF1/QNKdrOFuUBBRZPoSqRkd9J/U6wl4gpyyfqTqR13Jx
	 tb6XAX6ZSOebA==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Aug 2023 22:28:27 +0300
Message-Id: <CUPYPEYOKJ61.1WFKD20WQXVAA@suppilovahvero>
Cc: "Thorsten Leemhuis" <regressions@leemhuis.info>, "Lino Sanfilippo"
 <LinoSanfilippo@gmx.de>, "Linux kernel regressions list"
 <regressions@lists.linux.dev>, "Peter Huewe" <peterhuewe@gmx.de>,
 "Christian Hesse" <mail@eworm.de>, <stable@vger.kernel.org>,
 <roubro1991@gmail.com>, "Grundik" <ggrundik@gmail.com>, "Christian Hesse"
 <list@eworm.de>, <linux-integrity@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230710133836.4367-1-mail@eworm.de>
 <20230710142916.18162-1-mail@eworm.de>
 <20230710231315.4ef54679@leda.eworm.net>
 <bd0587e16d55ef38277ab1f6169909ae7cde3542.camel@kernel.org>
 <bb5580e93d244400c3330d7091bf64868aa2053f.camel@gmail.com>
 <0f272843a33a1706dbcbb2d84b02e3951ee60cbb.camel@kernel.org>
 <fdd5fd9ece045ebd1888672a75f157e64ade98fb.camel@gmail.com>
 <a588d1d3-12e0-b078-b6cc-b0a63c54ab37@leemhuis.info>
 <CUPW0XP1RFXI.162GZ78E46TBJ@suppilovahvero>
 <CAHk-=whRVp4h8uWOX1YO+Y99+44u4s=XxMK4v00B6F1mOfqPLg@mail.gmail.com>
In-Reply-To: <CAHk-=whRVp4h8uWOX1YO+Y99+44u4s=XxMK4v00B6F1mOfqPLg@mail.gmail.com>

On Fri Aug 11, 2023 at 9:55 PM EEST, Linus Torvalds wrote:
> On Fri, 11 Aug 2023 at 10:22, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > I was planning to send a PR to Linus with a quirk for MSI GS66 Stealth
> > 11UG, and apparently this bug report would add two additional MSI
> > entries. This is becoming quickly a maintenance hell.
>
> Honestly, what would be the immediate effects of just not enabling the
> TPM irq by default at all, and making it an explicit opt-in?
>
> When a common solution is to just disable the TPM in the BIOS
> entirely, and the end result is a working system, I really get the
> teeling that this is all pain for very very little gain.
>
> Would anybody even notice if we just disabled it by default and added
> a "if you really want it, use 'tpm=3Dirq' kernel command line"?
>
> Hmm?
>
>              Linus

It would be in line with what I proposed in [1] (option A), and also
what Grundik said in this thread.

Right now IRQs should be only enabled by a command-line option, and what
"allow list" would mean in practice should really be something that
would be advertised e.g. Device Tree or ACPI, not really part of the
solution implemented right now.

I'll send a patch ASAP, which makes this feature opt-in.

[1] https://lore.kernel.org/linux-integrity/CUPW0XP1RFXI.162GZ78E46TBJ@supp=
ilovahvero/

BR, Jarkko
