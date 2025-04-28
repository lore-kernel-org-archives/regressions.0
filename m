Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E29C76C61
	for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872842; cv=none; b=Mq5qS5NQK2j4CK3hKTvQzr+pfSV1fufQvo8c5/ouetmsD7/1Rfcrma2IE+qEifeBpEhlEUwnX5E3Ms9+avnpK0jptqebsYKtaeFus77QfHQi7FXTSbdKIn4cqpYQJ+8bj/gh6X/xIftUXFEvFlDMv1mFKZ8/c/oe/PmcuGBFXPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872842; c=relaxed/simple;
	bh=16e/YgzDjtZcsT5VW1ZKH/kbfB8Ev/B1D3q5d83zWeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mP4eOn/ngAf+8104YGASv6CE8J4sbDstXsEB3c6a9TSvlsQHAD3d7VItWPWZy9WYcHaF4/pzYvPitnO8jax13nySe4jEmGyFE8okf0gaoq1x/irYJ89gmufbiYwekP6A8CvRe2IcQJG3ld2lAepYbR9qJX9nnIs/P6C2lol7QVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L9SiBKcW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L9SiBKcW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224341bbc1dso56813595ad.3
        for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745872839; x=1746477639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeoT+z9Ix7KNe6MZWCzuaIP+N6t2Dwvzh7IKztB6k4g=;
        b=L9SiBKcWZq2SvynDJM19W9W7jF9XXpdLYSM2X5HCa/T1apn0Cno5pAxRXz1aZ0olAM
         +E/UGv/nHB2i1wO5usYoE/+F3RzbKPxDQsfCp9IyrlYW2nGKknlxF+oZjpggaMzSx1r2
         dzP678QNa0vn9iCwSbx3kKnIrErYBwu2jj6fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872839; x=1746477639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeoT+z9Ix7KNe6MZWCzuaIP+N6t2Dwvzh7IKztB6k4g=;
        b=WLQN39jrVfHLpxPAM5QVsq2b/6OrXmIgOM04CbsviUD/tJ3+gvLoa4p6+npKwm0gA1
         8fqSP0qUzFNOefuWaznPTmSn19WTUiwvyR+OHUgPO0PCCFrztXjmqtnNRDHUNVMEc1Bt
         +8mCtiJybRcu5nENmiA8gQZFl3nszqOC7Y9or+KF1+eJnHgVHOY3mTTFIcwEY6ZukrU4
         euYXzsOy41ZWa2EYxi5o53UPe5C42WJkukrIOsUizKHb9JtVH/dILrZ965dfjd+wVS1o
         jZRrQa0t5IQlm69QqOKZG4sgJOWzaNfIXC602B70Shq1nDTXPVydOc7TPUoFww9tIGku
         v85g==
X-Forwarded-Encrypted: i=1; AJvYcCXF779Zj94+eEJvk2byfyCwoLFpivteG4p/Rqpv3ITxM4hlXunEgX5qmw4/EmxauEvw5PhS7kMGuCi1kg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1bnArmxB/qFbONe5EwXPRTrCX8f+PMIqHiWsiMU9tFfKptk1r
	U8M3J/QitAdDNzAqECsV04/YESGR04XpZ8Nby5KuGsDt//39z3v5HXS+WU8InHtCSAl6NzwbWPc
	=
X-Gm-Gg: ASbGnctAjLufKa57H1ptBWrTqvAZOa87w9cSFE86YWlBn8IhtC1q99BxYrNYpJ9SjnK
	lFR+aKTh7hAIBhs5pCDKjPuhbucKuozmdEwBlcuI6N/CUyARGMp6gdyqpUQnB3gek+V37ywUXCH
	8de8f//dTSHk2/F9hTCp1VHiNBr2ve3QrQlVK7cbNyAVzUEgqT/69eHCABabkalcYCI25iAR6Wi
	yAS9f2ypqcmoQjJHEai7AtjN80sWnNemnmBemquKOabEJH+M3tTPSyC5VOwHTyaLk1aHjLkWnW1
	lklQv3hYrCZt13TEtFflNZ1IXn2HVnl3oycY9EdhNE42ZQJeWODnyoWJcCNYcgqhsMT/jaRcnd0
	7REzQ
X-Google-Smtp-Source: AGHT+IH0IKtd1oy8Rkpv8wrdE8MFRb6+nUFioJ8ks1WJZAS70pSRv+D0q8/4iyBrofdWOnFWylSQmw==
X-Received: by 2002:a17:902:e545:b0:224:1943:c65 with SMTP id d9443c01a7336-22de7015c0bmr5835635ad.14.1745872838773;
        Mon, 28 Apr 2025 13:40:38 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7543sm87846285ad.133.2025.04.28.13.40.37
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:40:37 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30a0c05e2c6so2216469a91.2
        for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 13:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPAQ06F8Tr5w5LXMYOPdhGsnJM/AMGn9zrqOvg64JiprFMq0s/gAMQYrxenXwlg2dGgCDaJupZjrrREw==@lists.linux.dev
X-Received: by 2002:a17:90a:e7cb:b0:2fe:861b:1ae3 with SMTP id
 98e67ed59e1d1-30a23dd605fmr290208a91.8.1745872836894; Mon, 28 Apr 2025
 13:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
In-Reply-To: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:40:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
X-Gm-Features: ATxdqUHkn2To6s-FCGeuNkrJ5YMdp_B_e090JmhY2DphP9BmoEpxztHghXs9YcE
Message-ID: <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 20, 2025 at 9:26=E2=80=AFPM Nick Bowler <nbowler@draconx.ca> wr=
ote:
>
> Hi,
>
> I recently noticed that on current kernels I lose video output from
> my Blackbird's AST2500 BMC after a reboot, which makes it difficult to
> boot the system again (the video output will come on only after Linux
> is booted again).
>
> With Linux 6.6 and earlier, there is no problem rebooting, everything
> is fine.
>
> I bisected to this commit:
>
>   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
>   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
>   Author: Douglas Anderson <dianders@chromium.org>
>   Date:   Fri Sep 1 16:39:53 2023 -0700
>
>       drm: Call drm_atomic_helper_shutdown() at shutdown time for misc dr=
ivers
>
> This commit does not revert cleanly on 6.14, but I can easily undo
> the changes this commit made to the ast driver, and this is enough
> to restore working behaviour.
>
> Let me know if you need any more info!

Bleh. That's not good. If I had to guess there's some subtle bug /
missing timing constraint that's being triggered here. A few things to
try:

1. Add a several second delay after the call to
"drm_atomic_helper_shutdown()", like msleep(5000) or something like
that. That's kind of a shot in the dark, but it's fairly common for
panels to get upset if you turn them off and then turn them on again
too quickly. This would be my blind guess of what is happening.

2. Could you give more details about what panel you're using? Ideally
it'd be great if you could say which device tree you're using too.

3. Any chance you can gather the `dmesg` from a failing boot and
provide it somehow? Are there any errors in the logs from the failing
boot?

-Doug
