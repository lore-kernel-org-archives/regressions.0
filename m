Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080177F12
	for <regressions@lists.linux.dev>; Wed, 24 Jan 2024 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706110285; cv=none; b=gbFwtWjmeXvb753Y+EZmmP5uQceoy1A6RKA9woBIjfMRrbdRzQ2k/fH3nGvsUAzohwHlnHIuckEDUqlsZeiKBaCRGmKK8TR5zH1/p5sV1AorclQSDPEtfzO0fmnoRfTCLldkQbE/x/1pZ6bBPpGThJpq4hROLklg1bHq5xWim1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706110285; c=relaxed/simple;
	bh=GpDYrGFUEKKunXNg/UYXj4fE8ADfmJRlUhj5IzkEgCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjKFUT/FiUAsn2Nq+/kKwlQoVaNH08eC6UEBbuNkEAgesqS2ln/8Cuni+IX2UwtvSMMZIjeCtwremgXHUwGJGWI8CgtcWE4HFbOi2AMj64fSYBCPS+GQrob7Oc1jriojhWrXeEirJmqk6Bc6Jn6nCuw/BeqmnFptHlEHg8eFZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzbzVcaQ; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzbzVcaQ"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ba903342c2so319624439f.3
        for <regressions@lists.linux.dev>; Wed, 24 Jan 2024 07:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706110283; x=1706715083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpDYrGFUEKKunXNg/UYXj4fE8ADfmJRlUhj5IzkEgCY=;
        b=UzbzVcaQXz3J0iGzKa3H2igFnQ5UenZFbb8/ViJW9BhD5Tp8pPloXSDi4fHtF5cnLX
         x4pGUTc/EK3ljprrooRiYCNqd4mJaz3awo2rW1REATf+HYr+aitrCGU1iDFSAi1/3HFS
         PSzeEZ8uQYG1GOiI17qn2CwICsQDzqEqt88JpXBK0Tuz99dB+6+tTWN+ci0pchqARnLW
         V0Nsjw8pkItRIKjYFc13UqMhR1XoLeegcFeA0RGAJ5R0F4aan+bCdsAO06uZeXP/6KWh
         Q00jzh86copFFyjCrZOFVi5uX/+qKjxcoSx6+V6msU1lz4Q08ky4aqZkiTMt6bD5wCk8
         D0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110283; x=1706715083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpDYrGFUEKKunXNg/UYXj4fE8ADfmJRlUhj5IzkEgCY=;
        b=l91CnWYQbITpjJmHGN8M1K997TQGXyaGW5almanXIBjbNlSodr6bExma4zS/QBQGfG
         Lu0zjMmFXqJo1KaI6OJMqMgcNiAobGOl4VtFQLBgUaR3JDEmEAPUSCLGf1Lvt79zt9JK
         zzEEdl66RJH5eSVaL+ZY/6IQ2VicpanC8ZUrKvJ75q/IqU072B3B2POqHC0QrMouDdwu
         o/snSELS1hIVMix2T5p/Jy9EPi+Y0NPUtm4RhKg2QkfsKOyq67xQWDJ1EqjWReKhnGel
         ksYBmo84GZLXC7zk54EEw/6APKtY+YDztuDRFAOjioTFK3VDFb2r8HkQ6oKzCRFWN9b1
         3+Ug==
X-Gm-Message-State: AOJu0YyPyhLxMDAT7XTxR/9SU00WlUN12LPFKp5Y9oReWM5c9liuDeh3
	qYbZSLjJ8hCztwHGGlGBigbSC/VULvLPrePJTZCEHhz8a2xhfNXCcFK3RazLb9uHRu8fF3nBIB/
	XRvxT4+6lAxfkoQxabSY77U0BY3w=
X-Google-Smtp-Source: AGHT+IFmbG26lQ7rCOD6Ezf4LEillA3aq/WsGuNbM4NSyvksQSzDbi+OEeFCinMox0HyF9tz6wiv6wOw2C1N29vgjBc=
X-Received: by 2002:a92:c268:0:b0:35f:eb24:bb54 with SMTP id
 h8-20020a92c268000000b0035feb24bb54mr2260604ild.99.1706110282995; Wed, 24 Jan
 2024 07:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
In-Reply-To: <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
From: Donald Carr <sirspudd@gmail.com>
Date: Wed, 24 Jan 2024 07:31:10 -0800
Message-ID: <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Dave Airlie <airlied@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 7:06=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
> When testing the rc1 on my openSUSE Tumbleweed desktop, I've started
> experiencing "frozen desktop" (KDE/Wayland) issues. The symptoms are that
> everything freezes including mouse cursor. After a while it either resolv=
es,
> or e.g. firefox crashes (if it was actively used when it froze) or it's
> frozen for too long and I reboot with alt-sysrq-b. When it's frozen I can
> still ssh to the machine, and there's nothing happening in dmesg.
> The machine is based on Amd Ryzen 7 2700 and Radeon RX7600.
>
> I've bisected the merge commits so far and now will try to dig into this
> one. I've noticed there was also a drm fixes PR later in the merge window=
 but
> since it was also merged into rc1 and thus didn't prevent the issue for m=
e,
> I guess it's not relevant here?
>
> Because the reproduction wasn't very deterministic I considered a commit =
bad
> even if it didn't lead to completely frozen desktop and a forced reboot.
> Even the multi-second hangs that resolved were a regression compared to 6=
.7
> anyway.
>
> If there are known issues and perhaps candidate fixes already, please do =
tell.

I am experiencing the exact same symptoms; sddm (on weston) starts
perfectly, launching a KDE wayland session freezes at various points
(leading to plenty of premature celebration), but normally on the
handoff from sddm to kde (replete with terminal cursor on screen)

Working perfectly as of the end of 6.7 final release, broken as of 6.8 rc1.
Sometimes sddm can be successfully restarted via ssh, other times
restarting sddm is slow and fails to complete.

Yours sincerely,
Donald
