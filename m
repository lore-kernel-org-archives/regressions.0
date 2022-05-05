Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC77368
	for <regressions@lists.linux.dev>; Thu,  5 May 2022 10:41:25 +0000 (UTC)
Date: Thu, 05 May 2022 10:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail2; t=1651747283;
	bh=HX4bsMCY4yqCwAMQt5vrUSJwA9Pa8B7VgBj9P7iping=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=MZl17klYlm5FQGYsk0zl62Lo5bmr2bHWxxLFBq2vDkVWH9AbWZFfKb+D9X2XDKP1g
	 gZNWbgLjXU8kQwk/XD+NT5brF4ZYaL8IjcvLnPhHl4T926lhEtKc5qC7BOsEATuBuJ
	 8SZ2NBBbWeACc5aGb11+5Ef6HTaHnBJP8B4OSunmdf3ImT1MvtPqWWiWQFinm1g5GV
	 cEj//tTM7sSca2WfY1yInBzudTl9DZyG+3PIOPb1DO+Q2isi0WKFNDjT4UYcoh0Rdg
	 SYu7Jh9zlGPSqNt4rrJr7uJvjY/aZMFX7GV5DDTDkOt3tLzzQMGPSC6dPPy1GTpG4o
	 lIPXhyHrdtvCQ==
To: Manuel Ullmann <labre@posteo.de>
From: Jordan Leppert <jordanleppert@protonmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, davem@davemloft.net
Reply-To: Jordan Leppert <jordanleppert@protonmail.com>
Subject: Re: Crash on resume after suspend (5.17.5 and 5.15.36)
Message-ID: <qkDMdC7Zb8bQ093sjURDqQpwhYplNlnDfSc7gGyJm2Lyh_uv3HRVv2cJEH6mJWtj8x7FN2v97EIPfvVVB3ZX68VAsqj_96Cgn6bqbkEP-no=@protonmail.com>
In-Reply-To: <874k252b33.fsf@posteo.de>
References: <refZ3y2HAXztrRkMMmFbBaF7Dz1CctWgjchSdBtcSNlpk-TL0fqLepVVHfw9qXtIQF9uFzBvFdjQiiX9Jv2zW9oaWej952s1IYwu61d1REo=@protonmail.com> <9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com> <87levhnlqu.fsf@posteo.de> <vcehgVc5mzweaw_ru0o1up63In2GGa9jtEWuaH8op7p2753Wfr2ezPhxFJdMPFxmpiPmrUB4XnH2nakuhC_BJby3wFa87cbpdLV-lDDb6Ko=@protonmail.com> <874k252b33.fsf@posteo.de>
Feedback-ID: 43610911:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the suggestion of using a USB stick, I managed to get it set up,=
 and hibernate actually works! Slightly in shock, once I get a proper swap =
partition set up I can turn my PC off at night now.



------- Original Message -------
On Wednesday, May 4th, 2022 at 23:21, Manuel Ullmann <labre@posteo.de> wrot=
e:


>
>
> > I also probably can't test hibernation, never managed to get it
>
> > working before. I'll give it a shot tomorrow though if I have time but
> > I don't even have swap set up ATM.
>
> That=E2=80=99s a pity, but okay, of course. Thanks for reporting this bug=
.
>
> Since you are using Arch and the Wiki is quite detailed, you could try
> setting up a swap on an unused USB stick floating around. This should be
> the easiest setup. Make sure to add resume to the mkinitcpio hooks after
> udev, but before fsck and add the resume parameter to your bootloader as
> described in the Wiki. This should get you going.
>
> Don=E2=80=99t make this a permanent setup, if you use encryption or like
> performance. The permanent solution would be creating a swap partition
> or, if that is not feasible, a swap file while considering the Wiki
> notes for e.g. btrfs.
>
> Best regards,
> Manuel
