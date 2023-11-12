Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE018048
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 20:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKhAgIa4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9e2838bcb5eso562592766b.0
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 12:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699819327; x=1700424127; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hHzinFDvhQfCEmbllZpgf+nGVEeFpAyDqoTWQyqM2UU=;
        b=eKhAgIa4AFO+r14XYTPqmd1OcmE7mUe/SeNKXBRUjEU6h1PqxeqJLTxXl7GIHAczyu
         U4mNqf6t8Oh8NYua8iihkQNbfBAN57cnhSrql5cHTB2uP5syHp5Goi9UjLLRoISOX09h
         kGr1+6uBt+LUxyeuZ45rr/vbA8RqS3nNN7OEpqp83Jr8nuPATRDYDjyxcQZX8JBjeZJv
         Yt4LpEcCARSkfvkxoErPcLmV7CAO54e/d49lGJfIer0LTQLU9Ewx6mpLrtWo5YXGdaJd
         5un8gvHlp728lhFZTDVMyUKRuUpwxkSCJIe0dG0Jl3RLeUHUsO8pkuNwRlqT9w1PZNiA
         J4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699819327; x=1700424127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHzinFDvhQfCEmbllZpgf+nGVEeFpAyDqoTWQyqM2UU=;
        b=OXqqs6nBmfRAj+vo4wdRomNMySZUQoemBiXm+2eYEhHdAb75L65KnmaOeZFVupIbxa
         XdNceKsoWYc44zSUPoFXJefv4WKHk4LEpF8n7Zq1J+5tmAspAQEVyKQMxCefoBHACAvu
         YCG9lt8FMG0lPkqTeg98nJA8ak0OO7g62cwG3w9RaSi4aH9BEbF+bg9obyAL17TSUhuB
         3B0qa7tF+NPDs5IlB6RKg5v43L90PdrbZuGPQ5KxiUAr6ri7Pfbh6Guv8TruEU83iKmk
         tCQDeIURWiGJMSO3ZKmOsI4Q2osNPY9kGwsQFzzPU4/pfOeuhwdlo+rAQZojV1O9XZUs
         rn+A==
X-Gm-Message-State: AOJu0YzK+LBA2Uepn0ALh4QroUbsaVwclbg08Mys/QVZ7oY+VUX2Us15
	nN56ONBGxnbMMQxNBV40f19DHN5x182F6G3Dzak=
X-Google-Smtp-Source: AGHT+IGu7e1kyFwejfvWrFdXehMYNQxqtHwD6vcn7TMv2clCGO8Vb1mOj9rGFsW8VnRyo6XRqLWIKyvtRt2ievk4s7U=
X-Received: by 2002:a17:906:b817:b0:9e6:59d5:7aa6 with SMTP id
 dv23-20020a170906b81700b009e659d57aa6mr3430166ejb.64.1699819325900; Sun, 12
 Nov 2023 12:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
 <20231112143620.36619-1-emmanuel.grumbach@intel.com> <875y26ajks.fsf@kernel.org>
 <CAHk-=wgyG-8ehCc4C4V-b-8rBtfyd9ApDeQSx-5BKRaHywhVpw@mail.gmail.com> <CANUX_P0kDV6PC5=+oxgnVetMR+kERqCMsVju22mBqcW5bED8sA@mail.gmail.com>
In-Reply-To: <CANUX_P0kDV6PC5=+oxgnVetMR+kERqCMsVju22mBqcW5bED8sA@mail.gmail.com>
From: Emmanuel Grumbach <egrumbach@gmail.com>
Date: Sun, 12 Nov 2023 22:01:54 +0200
Message-ID: <CANUX_P31JV2QDm=puUyNhJxArB5UGW2aBnwp-YMVnu_xfDjMHg@mail.gmail.com>
Subject: Re: [PATCH v4] wifi: iwlwifi: fix system commands group ordering
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Gregory Greenman <gregory.greenman@intel.com>, 
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, pagadala.yesu.anjaneyulu@intel.com, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	=?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>, 
	Damian Tometzki <damian@riscv-rocks.de>
Content-Type: text/plain; charset="UTF-8"

>
> >
> > However, now that I don't have that big warning in there, I do note
> > another iwlwifi issue that is new to this meger window:
> >
> >   debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
> >   iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:wlo2
> >   debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
> >   iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:wlo2
> >
> > and looking at my system logs, this is new.
> >
> > It looks like it is probably due to
> >
> >   c36235acb34f ("wifi: iwlwifi: mvm: rework debugfs handling")
> >   e9dd25550770 ("wifi: iwlwifi: mvm: add a per-link debugfs")
> >
> > but that's just from looking at the patches (ie no bisection or any
> > real effort).
>
> Don't bother, we'll take a look.

Miri sent me fixes that we have in our internal tree that have not yet
been published.
The fixes were made during the merge window.
I can send them here, but I think I'd prefer to let those patches go
through the regular
pipes. Also, I'd prefer the people who usually interact with the trees
handle that. Gregory
was OOO today and that's why I chimed in. Miri is still ramping up.
If it's really urgent, I can send the fixes though.

>
> >
> > This is after the system has come up, so I assume it's when
> > networkmanager or whatever actually is setting that wireless thing up.
>
> Most likely the network-manager brings the device up several times or something
> like that, but let's not blame them before we check what happens internally.
>
> >
> > Again: I actually don't *use* the WiFi on this machine - but from a
> > quick check it does seem to work. So this is just an annoyance and a
> > sign that somebody didn't do all the details right (possibly triggered
> > by odd user land behavior, of course, but still...)
> >
>
> Oh, we know the rules :)
>
> >                 Linus
