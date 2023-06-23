Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE32100CA
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 18:20:37 +0000 (UTC)
Date: Fri, 23 Jun 2023 18:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1687544427; x=1687803627;
	bh=sqyZYV43F6W278PBn+QNb6bfWovuTOxia6lpaVS6ZSE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F5WtJ0W6lyJQfjHub1jYVSMvVAO2KBh08wk48X7UEDK9qPvh+/yccIGrFy9k+0vE7
	 Baw0Qfhds9o/I3WR/nRfYYAZID229+5vwc9myZHTwjA8dl11Vyd7tnumeUyXSkZMVY
	 zL1V5tPmLJpRkMi+IecJtIROemHEQYGx09al+kvzFwZcvyGNS/tAOmUuOCVlV/8Cyi
	 HiCMQiD36c4X2iTNaXBp2kLlcS/8d4fSwYTl/rJv4JrXmD2wEG0siG4HvZ1Oj9wZdW
	 +jXzL1ZVnbOoogAha1u807/eQBNzL0x5DbN2ZLNj9Xi2QPuafMl+2MOxlGhm+Sa+b4
	 bdu8bAQXsUMSQ==
To: Ard Biesheuvel <ardb@kernel.org>
From: Sami Korkalainen <sami.korkalainen@proton.me>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, regressions@leemhuis.info, Andrew Lunn <andrew@lunn.ch>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Stable <stable@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
Message-ID: <CzNbNfn7R2cqLMD6_jp11Dku0OoXYJhx2AMfk8JXeQVP2EGdt7tqeYD4HH0COhp2o_yj5kN6Ao7oObSelRi8yiz-5ltbQ2xtjBvplvgcZjo=@proton.me>
In-Reply-To: <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me> <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me> <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me> <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me> <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com> <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
Feedback-ID: 45678890:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> However, the failure mode still strikes me as odd, and I'd be
> interested in finding out whether booting with efi=3Dnoruntime makes a
> difference at all, as that would prevent the SetVariable() all from
> taking place, without affecting anything else.

No boot stall with efi=3Dnoruntime. Tested on 6.3.9 and 6.4-rc7.
