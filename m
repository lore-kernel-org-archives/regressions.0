Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623AD2595
	for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 18:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95722C433CA
	for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 18:49:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eWzjBBnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1687373368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR62tl0M6BOshKrD0nf8mF7iZ5cr1fmRG4jE24AQIZU=;
	b=eWzjBBnZXyfKOQHrJNCyhC3vxKBF2YY45r7fImrbeJVXpTZ9JCjHZWm+aRhShSshBJl+Tf
	EhEgEEuWhucAaEtA0OcZnS3YHkj+r6r7ClTkbekIz7Mer9WmobmeDO7bbKPeb4V+vsPckD
	GaDh3SmgQm+8VslgoYC3t8g7JgnDFds=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e6bc4923 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Wed, 21 Jun 2023 18:49:28 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-76d846a4b85so2279067241.1
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 11:49:28 -0700 (PDT)
X-Gm-Message-State: AC+VfDxi8FOXalw0tLLotV9nfTSrf+z/K8Jt4/5rmPXIBLEXWg4nDq7B
	LpT/aCET4HriiTfo4s/PRhVbLWUfTmbDHoAz8Jk=
X-Google-Smtp-Source: ACHHUZ4IQJSCPvWCxmMLQOe7nbT0LiDhZ8XnSQo8Wq/dexoR3YH1/8bbg9nnYkL7RUXRS29D5PNqruRa3+2Y/NxcdgI=
X-Received: by 2002:a67:edc9:0:b0:43b:2fa9:eb3a with SMTP id
 e9-20020a67edc9000000b0043b2fa9eb3amr6968951vsp.9.1687373367438; Wed, 21 Jun
 2023 11:49:27 -0700 (PDT)
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
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info>
In-Reply-To: <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Jun 2023 20:49:16 +0200
X-Gmail-Original-Message-ID: <CAHmME9oh7kEUe-6NFk9=_8UxeD-SNbfMksYh3GaYdutXS01zOw@mail.gmail.com>
Message-ID: <CAHmME9oh7kEUe-6NFk9=_8UxeD-SNbfMksYh3GaYdutXS01zOw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Sami Korkalainen <sami.korkalainen@proton.me>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Stable <stable@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Brad Spengler <spender@grsecurity.net>, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

Hi Sami,

Would you try applying
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=13bb06f8dd42071cb9a49f6e21099eea05d4b856
instead of the revert?

Spender (CC'd) suggested to me that possibly the reason for your first
mis-bisect and possibly for the result you wound with has more to do
with some non-determinism in the actual underlying bug that the above
commit fixes. If applying 13bb06f8dd4207 fixes the issue, then Linus
can then revert the revert he just committed.

Jason
