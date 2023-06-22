Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C81D2D1
	for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 13:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF72C433CC
	for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 13:40:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X4Pd3cr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1687441229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMlPufS1+CTdDaO981ksP6l0rkZcElrayPR5JrP7aTU=;
	b=X4Pd3cr218Ro6wY80TW7hwWLIuf1+Ts5eDziE4SaLGmzDbxuTQMxTax6J0BcVp/u3zl+lL
	s/lER2JiTCdZr87ti/rsv3igTGk9+ydDGtuKKinRe/0rOEbBV67R5dx0KOsXKbxiO/ym5p
	BMtTqAt0afu0pw5wzdT0Recq2SxiXGU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eb960927 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Thu, 22 Jun 2023 13:40:27 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-440ad576d87so1787436137.1
        for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 06:40:27 -0700 (PDT)
X-Gm-Message-State: AC+VfDwUcapNFqkApWyBMLQLZ3jNEVivpsiDs7wkwcps6c5jw+dGpr7Z
	RwuF4GKHYDR4JpTPOrOVwceVMqHum0RTXmxl450=
X-Google-Smtp-Source: ACHHUZ6AedmTTMjJkhooZ6D7XkXYhYsP+uTelsVSFnTDMTpR+pjxhEZxY8PIvy32HERqZ48Gh3qsLyZrMsiakU7W+Q8=
X-Received: by 2002:a67:fbd8:0:b0:440:b25f:5cab with SMTP id
 o24-20020a67fbd8000000b00440b25f5cabmr6443596vsr.15.1687441226959; Thu, 22
 Jun 2023 06:40:26 -0700 (PDT)
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
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9oh7kEUe-6NFk9=_8UxeD-SNbfMksYh3GaYdutXS01zOw@mail.gmail.com>
 <CAHk-=who5-p3QKFnio2nA9b4yf0qrV-KZ8bJa7m80ouJbvOfoA@mail.gmail.com>
In-Reply-To: <CAHk-=who5-p3QKFnio2nA9b4yf0qrV-KZ8bJa7m80ouJbvOfoA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Jun 2023 15:40:15 +0200
X-Gmail-Original-Message-ID: <CAHmME9obXuj3qM8RkVqoKeU41--HqzMF-KEdNcepFWKCMAXCfQ@mail.gmail.com>
Message-ID: <CAHmME9obXuj3qM8RkVqoKeU41--HqzMF-KEdNcepFWKCMAXCfQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Cc: Andrew Lunn <andrew@lunn.ch>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Brad Spengler <spender@grsecurity.net>, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 9:51=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Now, with non-repeatable boot failures, anything is possible, and Sami
> does mention 6.1.30 as good (implying that 6.1.31 might not be - and
> that is when the backport happened).
>
> So it's certainly worth checking out, but on the face of it, that
> bisection result doesn't really support the bug being due to
> e9523a0d81899 (which came *after* e7b813b32a42).

Sami - awaiting your results.
