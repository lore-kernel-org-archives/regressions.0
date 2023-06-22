Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586A1E536
	for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 19:26:11 +0000 (UTC)
Date: Thu, 22 Jun 2023 19:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1687461955; x=1687721155;
	bh=ADpE/ZbY89bRqLuQZe1Y0FFBNBNKvgk+vf0bMC0Wn5U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fgTe9BMrUuSI49LzamTSVm4joZyrnVY7aULSlcC642YASmFxn7/kSgm/2XT92PwP7
	 pmPZt+l1sfIt9nBwX6Ea8yAj1bbCoNguwgVDXCWsp4UToWqFpgNFKv5OfMvFYGqeWD
	 TOV0njoglJe5Sy/K5E8CGbjoYTzE4LtQWRJpFffpTQY84Q6/QRA2FxGRGX9UgpoNbf
	 /CrnZvIhN6IEGr6CLKD8I6T25HjbOPty07aCUfb6DyxC4RV06ssb93SBSb+bvbQK8I
	 rLxQSdZgEwwx8S32CiPRpLZdeqBdwmyS1YjL0hu/pgkr7eR2/egdVP3FpBDOeNJ7u0
	 j0W5UT8U7fBjg==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Sami Korkalainen <sami.korkalainen@proton.me>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Lunn <andrew@lunn.ch>, Linux Stable <stable@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, Brad Spengler <spender@grsecurity.net>, regressions@leemhuis.info
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
Message-ID: <B3rdc87zERdKUeeqyxt7UtKahv6vsZAZrVM6V4oVSA_yJBbvZns9Vu4lhzAc5ysbZQLZAxnjHd05_Hv6xEetS4r_OuVdDFopYt9yUfJ8Xmk=@proton.me>
In-Reply-To: <CAHmME9obXuj3qM8RkVqoKeU41--HqzMF-KEdNcepFWKCMAXCfQ@mail.gmail.com>
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me> <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me> <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me> <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9oh7kEUe-6NFk9=_8UxeD-SNbfMksYh3GaYdutXS01zOw@mail.gmail.com> <CAHk-=who5-p3QKFnio2nA9b4yf0qrV-KZ8bJa7m80ouJbvOfoA@mail.gmail.com> <CAHmME9obXuj3qM8RkVqoKeU41--HqzMF-KEdNcepFWKCMAXCfQ@mail.gmail.com>
Feedback-ID: 45678890:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> > Now, with non-repeatable boot failures, anything is possible, and Sami
> > does mention 6.1.30 as good (implying that 6.1.31 might not be -=20

6.1.34 is ok

> Sami - awaiting your results.

I cherry-picked that commit 13bb06f8dd42071cb9a49f6e21099eea05d4b856
on top of 6.4-rc7 and it does not fix the issue for me.

=E2=80=94Sami
