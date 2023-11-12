Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D0171B5
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UVyZFoMO"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9e62b14c9eeso343968966b.2
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 11:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1699817967; x=1700422767; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NPXgTuktbqtWeqdyLJjudSuaLvdprd72HkDeuPEKQYg=;
        b=UVyZFoMO81kGWTHdNv+3ZG8gx3PXMp1gy6QwBqWBd66YZrXawr2jVtgq6p+UfA9lVd
         uShqC44lR/JRcfHIMbh5vluW5vWcF0/DPzXjik8JcV/qYLSX08M5ayJ3XRRISZr9Qk45
         p8WaE6GfCUJkwR3yFx4MzEQtaY/03Yo01qkxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699817967; x=1700422767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPXgTuktbqtWeqdyLJjudSuaLvdprd72HkDeuPEKQYg=;
        b=pLOvc3KRvOvV5lEOzFsZsRGc2sjUfZX3r/q5l4FLvlLt2xVzTHwV0iRRX4L+XYCxoA
         kcyBgWVkKrQd3Fm4YvoESzjaVa9/XssYNusgwUVN7sNZ9QsEUhuStBunbhxZuc67jMzP
         RjZtSVmXzc+NT8+azFH01WhG7WvoVvuXETX3n16VBLmx1yH/DMryxNY1JmHMGXmsyCGJ
         CPfsq/rPEpMOHq+wnleyXX60sSPmiQ2T068OzTL5wVOQYomyQaiMrkY2TaHSAA029GxQ
         RdwHmhyoXykl4WVJd6doUKjdIgYhLmxuN2QLfOPunyBXZU6gjFGcegsNenwQrga8hg+7
         DDYQ==
X-Gm-Message-State: AOJu0YwSRK9L5lJ++UzEiu1SwWYxNhrwDdJI5zYL292gW/xPT82500xS
	tbCgDK/6g3WSAzwZAvebbZNJtyC5+dliyPv/GYZCOTUE
X-Google-Smtp-Source: AGHT+IE54ov+v7MRVwIwfGxkz60YHGiNuiPSiuecgSRc/L3UVcBmfLdiP2bupLJzr9JlT3mvlAmT0g==
X-Received: by 2002:a17:906:d8c2:b0:9d1:92bb:ce74 with SMTP id re2-20020a170906d8c200b009d192bbce74mr3260750ejb.38.1699817966950;
        Sun, 12 Nov 2023 11:39:26 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906b31400b009e656ce2930sm2930484ejz.60.2023.11.12.11.39.24
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 11:39:25 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5437d60fb7aso5712439a12.3
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 11:39:24 -0800 (PST)
X-Received: by 2002:aa7:cac4:0:b0:543:7c94:a879 with SMTP id
 l4-20020aa7cac4000000b005437c94a879mr3361889edt.29.1699817964440; Sun, 12 Nov
 2023 11:39:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
 <20231112143620.36619-1-emmanuel.grumbach@intel.com> <875y26ajks.fsf@kernel.org>
In-Reply-To: <875y26ajks.fsf@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 12 Nov 2023 11:39:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgyG-8ehCc4C4V-b-8rBtfyd9ApDeQSx-5BKRaHywhVpw@mail.gmail.com>
Message-ID: <CAHk-=wgyG-8ehCc4C4V-b-8rBtfyd9ApDeQSx-5BKRaHywhVpw@mail.gmail.com>
Subject: Re: [PATCH v4] wifi: iwlwifi: fix system commands group ordering
To: Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Gregory Greenman <gregory.greenman@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, pagadala.yesu.anjaneyulu@intel.com, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	=?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>, 
	Damian Tometzki <damian@riscv-rocks.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Nov 2023 at 10:54, Kalle Valo <kvalo@kernel.org> wrote:
>
> Linus, I suspect it will take a while before we make a new wireless pull
> request (there's currently just one commit in the wireless tree). So if
> you want to take this directly to your tree please go ahead, otherwise
> you get it via the normal route in a week or two. Just let us know what
> you prefer.
>
> Acked-by: Kalle Valo <kvalo@kernel.org>

Ok, I just tested it in my private tree, and it fixes the WARN_ON() as
expected, so I'll apply it for real.

However, now that I don't have that big warning in there, I do note
another iwlwifi issue that is new to this meger window:

  debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
  iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:wlo2
  debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
  iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:wlo2

and looking at my system logs, this is new.

It looks like it is probably due to

  c36235acb34f ("wifi: iwlwifi: mvm: rework debugfs handling")
  e9dd25550770 ("wifi: iwlwifi: mvm: add a per-link debugfs")

but that's just from looking at the patches (ie no bisection or any
real effort).

This is after the system has come up, so I assume it's when
networkmanager or whatever actually is setting that wireless thing up.

Again: I actually don't *use* the WiFi on this machine - but from a
quick check it does seem to work. So this is just an annoyance and a
sign that somebody didn't do all the details right (possibly triggered
by odd user land behavior, of course, but still...)

                Linus
