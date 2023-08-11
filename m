Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA431172E
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 17:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF924C433C7;
	Fri, 11 Aug 2023 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691775997;
	bh=XN8nt7rCjPkt81XRG6RpHmQBTg+fdjpZT4wKVdUETxY=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Thpsz4WcFC/dToQwvNin+TcR6pHVkdz3vEH5keFi8J2R+nnI6HuoOe7jxwrfI3IOY
	 sbjZekcSVe10HtLEirEuKBehS/TmbF3Af+XfBoEai0BSAEf0D/Q/55ojSjnWQISc5n
	 6izRXa7GzWDP3vSwfM412XJ2cpbgYPsMEs4jFsGlUYKstf8vUsy8htJxaafBRZDPTP
	 +DApiKNEJD3i4wtQVsgCA7lu5tQfpNL5dw+JJazZLwxioM6aFzrivdwmGdL08lhP63
	 BvWKc6wxlEolsY3MM88j71UTW1GtqY7suidCfPAfs7NHWtGoT/m9ZgLQqM2r53IEW5
	 NNci/KDEbmwbg==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Aug 2023 20:46:32 +0300
Message-Id: <CUPWJDNTPO9V.1AVEKAAT1GQAO@suppilovahvero>
To: "Grundik" <ggrundik@gmail.com>, "Thorsten Leemhuis"
 <regressions@leemhuis.info>, "Lino Sanfilippo" <LinoSanfilippo@gmx.de>
Cc: "Linux kernel regressions list" <regressions@lists.linux.dev>, "Peter
 Huewe" <peterhuewe@gmx.de>, "Christian Hesse" <mail@eworm.de>,
 <stable@vger.kernel.org>, <roubro1991@gmail.com>, "Linus Torvalds"
 <torvalds@linux-foundation.org>, "Christian Hesse" <list@eworm.de>,
 <linux-integrity@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230710133836.4367-1-mail@eworm.de>
 <20230710142916.18162-1-mail@eworm.de>
 <20230710231315.4ef54679@leda.eworm.net>
 <bd0587e16d55ef38277ab1f6169909ae7cde3542.camel@kernel.org>
 <bb5580e93d244400c3330d7091bf64868aa2053f.camel@gmail.com>
 <0f272843a33a1706dbcbb2d84b02e3951ee60cbb.camel@kernel.org>
 <fdd5fd9ece045ebd1888672a75f157e64ade98fb.camel@gmail.com>
 <a588d1d3-12e0-b078-b6cc-b0a63c54ab37@leemhuis.info>
 <fed7ec9d048c26e9526ccd909132c51e8e3e78cc.camel@gmail.com>
In-Reply-To: <fed7ec9d048c26e9526ccd909132c51e8e3e78cc.camel@gmail.com>

On Fri Aug 11, 2023 at 1:44 PM EEST, Grundik wrote:
> On Fri, 2023-08-11 at 10:18 +0200, Thorsten Leemhuis wrote:
> > Jarkko & Lino, did you see this msg Grundik posted that about a week
> > ago? It looks like there is still something wrong there that need
> > attention. Or am I missing something?
> >=20
> > FWIW, two more users reported that they still see similar problems
> > with
> > recent 6.4.y kernels that contain the "tpm,tpm_tis: Disable
> > interrupts
> > after 1000 unhandled IRQs" patch. Both also with MSI laptops:
> >=20
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217631#c18
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217631#c20
> >=20
> > No reply either afaics.
>
> As I said before: it does not looks like blacklisting is a good
> solution at all.
>
> If there are general fix, then blacklisting only makes testing of that
> fix more difficult. If general fix works, why blacklist? If it does not
> work and its impossible to figure out why =E2=80=94 maybe there should be
> kernel boot option to select between polling/irq instead of/in addition
> to hard-coded blacklist.
>
> Unfortunately, its very hard to test this fixes on my side: since TPM
> is not a module, but compiled into kernel itself, it requires
> recompiling a whole kernel, which is quite a task for a laptop. But I
> will try my best, if needed.

I agree with this.

Can you check my response to Thorsten and share your opinions?

BR, Jarkko
