Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D22596
	for <regressions@lists.linux.dev>; Wed,  4 May 2022 16:45:20 +0000 (UTC)
Date: Wed, 04 May 2022 16:38:01 +0000
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ETrz8E2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail2; t=1651682287;
	bh=yOoxg2N5zJ4F1OoSCgUaKhglPU6NB2rB8SsmeAPDDmM=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=ETrz8E2Ecixoq5zO+zb61vwH1Uhl9f9E5C9NnUQ+f99bjDPcqwqs6debkIxamKJFk
	 RbFOcIRODUPl2+fQ0kb14L0r+A0iIUuf5XWvG4n+iDhR/ny9mBHV7OT7zfa3dXYL3C
	 JdTuNEFRietq10Rqtj8Fc8Xrk3DYzqlAZGlPVyhBtetZtpNFTi01B5s+XMd+YbeSpZ
	 yJNHjjm7FxqAvuuPFwSy/a0zcCp44BDD1xQrTRjdQwA5N8DkYQRwybNnQMscwa3K/x
	 yNQFZvydKAb370R8MjRG9DB9T9QE1b+ML4NeUpV27p67zI9+/XlmvOXi2qEU6xfQMF
	 VfzR4JQ1FhjoQ==
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
From: Jordan Leppert <jordanleppert@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "labre@posteo.de" <labre@posteo.de>, "davem@davemloft.net" <davem@davemloft.net>
Reply-To: Jordan Leppert <jordanleppert@protonmail.com>
Subject: Re: Crash on resume after suspend (5.17.5 and 5.15.36)
Message-ID: <m2x6JjQLsOKoQvBopqci-aIwjaD4NAjGwR2ifWQ1UiGU4nnC9HzU0TpntBf8hWSIbItvCxm8fDgDnrDQbmGAg1-FRsfUO_rFzF1PAd_Amrw=@protonmail.com>
In-Reply-To: <9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com>
References: <refZ3y2HAXztrRkMMmFbBaF7Dz1CctWgjchSdBtcSNlpk-TL0fqLepVVHfw9qXtIQF9uFzBvFdjQiiX9Jv2zW9oaWej952s1IYwu61d1REo=@protonmail.com> <9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com>
Feedback-ID: 43610911:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some info I missed out, and some I've discovered:

1. This causes my system to completely freeze such that I need to reboot to=
 recover

2. There are no system logs from the crash, in fact absolutely no logs from=
 the resume at all, the last logs were of the computer going into suspend

3. I've found that I can prevent this crash by unloading the atlantic modul=
e before suspending (modprobe -r atlantic)

4. Also, if I take the v5.17.5 tag of the kernel and revert the commit ment=
ioned in my first email, this also prevents the crash

Regards,
Jordan



------- Original Message -------
On Wednesday, May 4th, 2022 at 16:07, Jordan Leppert <jordanleppert@protonm=
ail.com> wrote:


>
>
> Hi,
>
> A changed was added to both version 5.17.5 and 5.15.36 which causes my co=
mputer to freeze when resuming after a suspend. This happens every time I s=
uspend and then resume.
>
> I've bisected the change to commit: cbe6c3a8f8f4315b96e46e1a1c70393c06d95=
a4c (net: atlantic: invert deep par in pm functions, preventing null derefs=
)
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-5.17.y&id=3Dcbe6c3a8f8f4315b96e46e1a1c70393c06d95a4c
>
> My computer details that might be relevant:
> OS: Arch Linux
> CPU: AMD 5950X
> GPU: AMD 6800XT
>
> As expected I have an Aquantia ethernet controller listed in lspci:
>
> 05:00.0 Ethernet controller: Aquantia Corp. AQC107 NBase-T/IEEE 802.3bz E=
thernet Controller [AQtion] (rev 02)
>
> Please let me know if there is any more info I can give that will help.
>
> Regards,
> Jordan
