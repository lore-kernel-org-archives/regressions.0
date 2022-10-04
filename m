Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4D440C
	for <regressions@lists.linux.dev>; Tue,  4 Oct 2022 18:04:08 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id w127so601157oiw.8
        for <regressions@lists.linux.dev>; Tue, 04 Oct 2022 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sor9D9i/EJpgjGPLpMubXbPXNL6NfcDkrHXBrZqrku4=;
        b=etS61wv0tV5Tr5yGB26lMRJz5KF87CbWf8vsC0mcngDXaqkhSZKuaPi8OghfGOQLQj
         aP98reDcR1aPBsiupOp8u3oTidiuNovXySlB1hshVQjrHYVtiJmk1WYMVamRA54IQTb6
         359w1y6S03b8fDqbMY6dbwRQ8Nj6JfRjoQhMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sor9D9i/EJpgjGPLpMubXbPXNL6NfcDkrHXBrZqrku4=;
        b=RMoZdy5G+/E7mDpublrGFNnIymbIr94ljiMmR+BroGiOs7OjMe8+QfZgCNxyGb0CaW
         VxjAlrt8X64Z2yi8m577DNgsROxk/EsbY7aY+CwCNIa+lTPmsA4kVraCujsfEvY6dCrh
         RRs81SzeZb1sQ8zi4Z44b0VFg3D3X0PSD+DfZHoAvVwvn30pSHslZVnINi/G1ppnT3t/
         jWlU49iX4u1/FHyWr8d2rXDR/d9fYaJC8HuN9933yNGOyWG+TvwZnY50WGWThJQp/8NY
         UUCWevimqEzfuZAdxJ7eq02eE3maQIpiq8DYAQZhw1jpbLKik7C85GW21jx/PUUmiyGm
         iPwQ==
X-Gm-Message-State: ACrzQf24tuIQGS62g7V3iM5ba2bcZ+DNICOeYofE21ew6cL7Awu0otYl
	0FwurogQR/9xEkHOIxxCjoi0ICynGA3fyA==
X-Google-Smtp-Source: AMsMyM62xr0khPQiAWiRN1ANsH7x+nKiMfgpahBalByDvJpvBXGDSV5di/5Jf1aZ46avw3dcl9m09A==
X-Received: by 2002:a05:6808:1707:b0:351:4a02:fdf4 with SMTP id bc7-20020a056808170700b003514a02fdf4mr492524oib.40.1664906647690;
        Tue, 04 Oct 2022 11:04:07 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id s3-20020a056808208300b00350aae903e0sm3248085oiw.56.2022.10.04.11.04.05
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 11:04:05 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id w127so600968oiw.8
        for <regressions@lists.linux.dev>; Tue, 04 Oct 2022 11:04:05 -0700 (PDT)
X-Received: by 2002:aca:b957:0:b0:351:4ecf:477d with SMTP id
 j84-20020acab957000000b003514ecf477dmr469103oif.126.1664906645054; Tue, 04
 Oct 2022 11:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info> <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
In-Reply-To: <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Oct 2022 11:03:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7HyGxs2Ad-UiF-3qeLJnPc_WGKOVqYqaTjrbRig0V9Q@mail.gmail.com>
Message-ID: <CAHk-=wi7HyGxs2Ad-UiF-3qeLJnPc_WGKOVqYqaTjrbRig0V9Q@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, "Artem S. Tashkinov" <aros@gmx.com>, 
	ksummit <ksummit-discuss@lists.linuxfoundation.org>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 4, 2022 at 10:53 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> 2. Create and maintain a mapping from MAINTAINER subsystem entries to
>    Product/Component categories in Bugzilla (the scheme to be established).

It's probably worth asking the 0day people what they do.

Maybe they do it all manually and have no real helping infrastructure,
but I see emails from them that often (but certainly not always) seem
to get the right people involved.

And while the MAINTAINER file is useful for a fiel mapping, I'm not
convinced it's all that useful for the "product/component category"
mapping, because I doubt people will actually fill that in well (and
reliably) enough.

With actual bisection data, it's fairly easy (get the emails from the
commit that got bisected). But things like "use the backtrace in the
oops to figure out who to add to participants" is likely a bit more of
a "use clever heuristics" kind of thing.

Anyway, I do think that some kind of automation would be really good,
at least for reports that have bisection information or backtraces in
them. Without automation, people _will_ be overwhelmed on the first
level response to bug reports (ie the "try to figure out who to bring
in" front).

But if the automation is too stupid, people will start ignoring the
report emails just on the assumption that it got thihngs wrong.

Of course, if the automation is really solid enough, I think it should
work on lore.kernel.org, not on just a bugzilla thing.

             Linus
