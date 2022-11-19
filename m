Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4636EC0D
	for <regressions@lists.linux.dev>; Sat, 19 Nov 2022 23:20:26 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id b3so13756425lfv.2
        for <regressions@lists.linux.dev>; Sat, 19 Nov 2022 15:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PnhRnJNAyjU6feAu0abzX3ol/WrQz0Qd4vkqXDr2Luw=;
        b=idpQMRnwoQfYlxRNRoka53gYOGZ6pWpnaVYc1ceez2qA1VcLtmcaJ2GOwms2IhgX1f
         9lS9v9gCaHTA7LCU9uhjkPiX1SU5XOZY2uenWG2FkDla/RE6V1LP30BGHRFgy71ZAQFr
         iSMHbYi9+vSZc/l8lpXsROX2EWcAIDwlxVC4KW2JBW8PyeynRHEpfhOCykSJA8A1bm3K
         JFftd8VUl9/z5Zb6XQPtlWpaYYqyVaUP3YYj/kphtdIDLHZUZTUwaNqzEjjTR88rclzn
         vpyLvUIwoXamHmKQEjO9SI/wGa1bhT0zXrvFvKxEDWFWqoGorqB3IVfvxQB15acJzkK+
         40ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnhRnJNAyjU6feAu0abzX3ol/WrQz0Qd4vkqXDr2Luw=;
        b=Z1b7Aqa/V6SSWoPGAGu31gSf1jFSqzu3yZRIvmxRH741K3AdHxJLxFkLDukz2ij1uO
         kvdpB9AH4/cjLSA9TWQqEHT2Rhqr8wCJ4XorbtIbCkminIu3ppA4WiOFVGqIfQZvxRc1
         tCGhk4Ko4qwSQwLKQzTukwRhC91HuehRA7wvlhs4ytE71ygFqXik12Ty+Y1xCf2efmqL
         VwBebU4TgIMzPMrKmxl+D/caXioHjke04Vv2M474caxlHxdlC8UTHKfQqH9qPbQSJ50X
         y5vwe27u87isTI/uTfaqzD15xilvLgfvbwwFRL53a2G0hPc5XVazseEv6Rl0Ts+fqzeu
         wulg==
X-Gm-Message-State: ANoB5plFom1K/aGz/9JxlijDHWTFfMf/3W5Oh3PzLwXH0gkqeBPnQO7g
	wABm3d2XjsmR3mFVnAv9WHSEUaovBzTRndgfwco=
X-Google-Smtp-Source: AA0mqf4bTD56V41OFfrKfmfQa/7rNrYxbA0at0tfetRTfzYEzZJLSj6Xe3A2SrjfR2RZC3eV+wtTD8ZPaIknFKCUjSo=
X-Received: by 2002:a05:6512:484:b0:4a2:33f8:2d0f with SMTP id
 v4-20020a056512048400b004a233f82d0fmr3999702lfq.140.1668900024725; Sat, 19
 Nov 2022 15:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWihb_EYWKXOqdN0iDBDygk+EGbhaxWHTKVRhtpm_TihbCjtw@mail.gmail.com>
 <Y3h118oIDsvclZHM@casper.infradead.org>
In-Reply-To: <Y3h118oIDsvclZHM@casper.infradead.org>
From: Jorropo <jorropo.pgm@gmail.com>
Date: Sun, 20 Nov 2022 00:20:13 +0100
Message-ID: <CAHWihb_HugpV44NdvUc2CV_0q2wk-XWyhmGdQhwCP6nDmo1k7g@mail.gmail.com>
Subject: Re: [REGRESSION] XArray commit prevents booting with 6.0-rc1 or later
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, nborisov@suse.com
Content-Type: text/plain; charset="UTF-8"

Matthew Wilcox <willy@infradead.org> wrote :
>
> On Sat, Nov 19, 2022 at 05:07:45AM +0100, Jorropo wrote:
> > #regzbot introduced v5.19-rc6..1dd685c414a7b9fdb3d23aca3aedae84f0b998ae
> >
> > Hi, I recently tried to upgrade to linux v6.0.x but when trying to
> > boot it fails with "error: out of memory" when or after loading
> > initramfs (which then kpanics because the vfs root is missing).
> > The latest releases I tested are v6.0.9 and v6.1-rc5 and it's broken there too.
> >
> > I bisected the error to this patch:
> > 1dd685c414a7b9fdb3d23aca3aedae84f0b998ae "XArray: Add calls to
> > might_alloc()" is the first bad commit.
> > I've confirmed this is not a side effect of a poor bitsect because
> > 1dd685c414a7b9fdb3d23aca3aedae84f0b998ae~1 (v5.19-rc6) works.
>
> That makes no sense.  I can't look into this until Wednesday, but I
> suggest that what you have is an intermittent failure to boot, and
> the bisect has led you down the wrong path.

I rebuilt both 1dd685c414a7b9fdb3d23aca3aedae84f0b998ae and
the parent commit (v5.19-rc6), then tried to start each one 8 times
(shuffled in a Thue morse sequence).
0 successes for 1dd685c414a7b9fdb3d23aca3aedae84f0b998ae
8 successes for v5.19-rc6

This really does not look like an intermittent issue.
