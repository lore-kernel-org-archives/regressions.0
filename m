Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72669171B5
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JE1UprMB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so5914762a12.2
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 11:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699818828; x=1700423628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFh6+GBVb0Z9uHw00TBpOMCzVc3LQjABYyyVDDrhDfQ=;
        b=JE1UprMB4zfek0w8ipGj+JKnSgoS7BkODi7d8kUE9ARKEgmFAGLM6xM1zSal3tXCvI
         kQI0jbNGHcXri4uVyNepjudA0LbifVRTmTxQfLuhXbSwz3PQGPYlC5NPEwr3rOPdf5Sy
         r0ke/EZrJPbAIN6tFaVpyidEyeCleGjoqrXnHtlwivGs3cZ3eIB9efS6TbcOt698D1+s
         surdV/U9B2gi40jsqvl1bZWHvCZ+OhCWJaz3lCIx5H5GhCJuEFOL81ATQ4edn/NP4G6x
         ZbWGE9q7PRgTnyabIBvp4y6gHsL2jVKiW/3cqFBsBMNmNbjXXaH2qkbk57ejYjrfFef2
         YBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699818828; x=1700423628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFh6+GBVb0Z9uHw00TBpOMCzVc3LQjABYyyVDDrhDfQ=;
        b=RhHPNrClWAtDex1u5x1Du8y9VDa6l2o+5+NTN7a5VhT95Ve32qyspS80qoVDjrggau
         /Yl1VKGxfA5W4L+tnZg0EZJtPBKYAj1ZpNhEekF8fj8XL0TzWQyr2tiVm5RRt/tDFcBg
         IHXxaFFpn09QAyyIhOHRLYmTes4Rcw6bB1CHl4MR40aukSHX2+1ma5wEK9fw3Yz2jmqN
         9vkXNEV1LfqOW60q7A5br4oTSfVNi7aHj3LsrHKz/WrB1H2q0x3R/EBo7mEam8Z2uFP3
         HUqiroy1FzhEGIJ8y9bXyixoVxoBdb+sTbJWcdiTFlIjX6RkK39wFBu59Ty/y/Du2/Ct
         6tZw==
X-Gm-Message-State: AOJu0YyYCDkAjW/Y0VL7oAd2QNC32QlkB3Jc4SrgGWiaAtzwsRvM/knm
	YyOCmEiuj8fL7llDZnAp4uUTGoHum0wG5fjtT8Q=
X-Google-Smtp-Source: AGHT+IE2OyWSPXGTuZg7S0BiGGG5pxE4Ap/5JqIfOmY7skWJhSa00Y3VdxgSeFDv/DcWaVxpIIVZlgi7FDs8UHyNHag=
X-Received: by 2002:aa7:d84a:0:b0:540:fd21:b32d with SMTP id
 f10-20020aa7d84a000000b00540fd21b32dmr3423043eds.36.1699818827438; Sun, 12
 Nov 2023 11:53:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
 <20231112143620.36619-1-emmanuel.grumbach@intel.com> <875y26ajks.fsf@kernel.org>
 <CAHk-=wgyG-8ehCc4C4V-b-8rBtfyd9ApDeQSx-5BKRaHywhVpw@mail.gmail.com>
In-Reply-To: <CAHk-=wgyG-8ehCc4C4V-b-8rBtfyd9ApDeQSx-5BKRaHywhVpw@mail.gmail.com>
From: Emmanuel Grumbach <egrumbach@gmail.com>
Date: Sun, 12 Nov 2023 21:53:36 +0200
Message-ID: <CANUX_P0kDV6PC5=+oxgnVetMR+kERqCMsVju22mBqcW5bED8sA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 9:39=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 12 Nov 2023 at 10:54, Kalle Valo <kvalo@kernel.org> wrote:
> >
> > Linus, I suspect it will take a while before we make a new wireless pul=
l
> > request (there's currently just one commit in the wireless tree). So if
> > you want to take this directly to your tree please go ahead, otherwise
> > you get it via the normal route in a week or two. Just let us know what
> > you prefer.
> >
> > Acked-by: Kalle Valo <kvalo@kernel.org>
>
> Ok, I just tested it in my private tree, and it fixes the WARN_ON() as
> expected, so I'll apply it for real.

Good to know - thanks.

>
> However, now that I don't have that big warning in there, I do note
> another iwlwifi issue that is new to this meger window:
>
>   debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
>   iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:w=
lo2
>   debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
>   iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:w=
lo2
>
> and looking at my system logs, this is new.
>
> It looks like it is probably due to
>
>   c36235acb34f ("wifi: iwlwifi: mvm: rework debugfs handling")
>   e9dd25550770 ("wifi: iwlwifi: mvm: add a per-link debugfs")
>
> but that's just from looking at the patches (ie no bisection or any
> real effort).

Don't bother, we'll take a look.

>
> This is after the system has come up, so I assume it's when
> networkmanager or whatever actually is setting that wireless thing up.

Most likely the network-manager brings the device up several times or somet=
hing
like that, but let's not blame them before we check what happens internally=
.

>
> Again: I actually don't *use* the WiFi on this machine - but from a
> quick check it does seem to work. So this is just an annoyance and a
> sign that somebody didn't do all the details right (possibly triggered
> by odd user land behavior, of course, but still...)
>

Oh, we know the rules :)

>                 Linus
