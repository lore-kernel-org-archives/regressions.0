Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96933E0
	for <regressions@lists.linux.dev>; Wed,  4 May 2022 22:21:07 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 93195240108
	for <regressions@lists.linux.dev>; Thu,  5 May 2022 00:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1651702865; bh=l5fU5AlspjVNt2vkjfCweBCpgGYWhRAH4hwZaPcBIdo=;
	h=From:To:Cc:Subject:Date:From;
	b=LKN/2vLrJNi011b4JZAlXEjOoI7ZbPPNS4mQ8tWsbSVCURXg2WzN0XgeKo93zn5Y8
	 Pze/9jghh0cI3S9saWXbXYN3wNBSscnXVYXYAHGfNL1dNhbTN2SVVAseLu4UwvoRNw
	 JNWObC0awcnPdAxpA4hL5wNf41dlxOoeq7XB2OBYwlmlebHkQ7NSqQbzbpRjeC0JAc
	 FygdvVNoMzMVoWnp9ubuRWvGJnFSfeXBHo5ZWkbUbnach1cijZgRZ2S5dkisQYyoSu
	 Zl5heZ1pbYmNYu6ovP9ggBwCFjjPufkOSABkAK0xmRzblR3eFdXfRbf76A4u42onAe
	 tbjCIUuziEhQg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ktrrc6vwPz6tpJ;
	Thu,  5 May 2022 00:21:04 +0200 (CEST)
From: Manuel Ullmann <labre@posteo.de>
To: Jordan Leppert <jordanleppert@protonmail.com>
Cc: labre@posteo.de,  stable@vger.kernel.org,  regressions@lists.linux.dev,
  davem@davemloft.net
Subject: Re: Crash on resume after suspend (5.17.5 and 5.15.36)
References: <refZ3y2HAXztrRkMMmFbBaF7Dz1CctWgjchSdBtcSNlpk-TL0fqLepVVHfw9qXtIQF9uFzBvFdjQiiX9Jv2zW9oaWej952s1IYwu61d1REo=@protonmail.com>
	<9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com>
	<87levhnlqu.fsf@posteo.de>
	<vcehgVc5mzweaw_ru0o1up63In2GGa9jtEWuaH8op7p2753Wfr2ezPhxFJdMPFxmpiPmrUB4XnH2nakuhC_BJby3wFa87cbpdLV-lDDb6Ko=@protonmail.com>
Date: Wed, 04 May 2022 22:21:20 +0000
In-Reply-To: <vcehgVc5mzweaw_ru0o1up63In2GGa9jtEWuaH8op7p2753Wfr2ezPhxFJdMPFxmpiPmrUB4XnH2nakuhC_BJby3wFa87cbpdLV-lDDb6Ko=@protonmail.com>
	(Jordan Leppert's message of "Wed, 04 May 2022 21:13:45 +0000")
Message-ID: <874k252b33.fsf@posteo.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> I also probably can't test hibernation, never managed to get it
> working before. I'll give it a shot tomorrow though if I have time but
> I don't even have swap set up ATM.
That=E2=80=99s a pity, but okay, of course. Thanks for reporting this bug.

Since you are using Arch and the Wiki is quite detailed, you could try
setting up a swap on an unused USB stick floating around. This should be
the easiest setup. Make sure to add resume to the mkinitcpio hooks after
udev, but before fsck and add the resume parameter to your bootloader as
described in the Wiki. This should get you going.

Don=E2=80=99t make this a permanent setup, if you use encryption or like
performance. The permanent solution would be creating a swap partition
or, if that is not feasible, a swap file while considering the Wiki
notes for e.g. btrfs.

Best regards,
Manuel
