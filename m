Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886E440C
	for <regressions@lists.linux.dev>; Tue,  4 Oct 2022 18:11:59 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id g23so8635099qtu.2
        for <regressions@lists.linux.dev>; Tue, 04 Oct 2022 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=4Ba4qZgQfuJrixZ7FTn7rpSQxTNM6P6LZ1lEe3Y1d7Q=;
        b=iSfvzWVUtPRrbZqzVitZPEfw8jxFY8yd/mSGGMOJFKuAKe0sGyul6xKnMPZR3DSNwu
         RymaA09rjI5269Wg0O+lGDFtD8F75O22jP1n67OCoNpkcVXMZah1Jy4pjxWwugZ/oAqw
         unteogeaJK8WuK9hTKhlQ364X5bZx4IKivL4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4Ba4qZgQfuJrixZ7FTn7rpSQxTNM6P6LZ1lEe3Y1d7Q=;
        b=7vSxB258hsHti6CQnG0i1Yj+SRLf8lYzKXx56s3ObYWXRVRYmWbBb1E3X5PrEd4xTn
         fMThXAcZwPz6h9LYXlTx5axc0CCLo1To6AkSLiR+XvnIZVjDnWPQRWC7QLuK0KJQbDmK
         Aw5gWbxu1/iVCFhhtpfq9yOEbtvU4uRoBkTuwks5+J+shccGeKQwclxlwJwHkNl+kOOB
         /fGOE8t83qRvLymQA7PJZSIfrljenDfgUJcSiEcVlGbeAsiJyG3eJE7pix47vaCR7GBI
         l5PQcBXhTqXkO5ZjScVgDrYCWrzAYozC0KrJP4PWcJOyO/YBMAM9XhBuMHEgLBkCpZtB
         Jtjg==
X-Gm-Message-State: ACrzQf0AWVLY7uCEFwixlW2E9RVWBd25iAk6s1oIx2fesh46QVZbzRNt
	Hp0rQU/EVwCOC1cpyZXNwhVnAtpPz57Pxg==
X-Google-Smtp-Source: AMsMyM5yF6Ry2qHHG4bIRsURULfGPpvuVh0VS0SX+5+kIXRGqxvBrHYKKZ4cQdhvSR2LHTtbP54fdQ==
X-Received: by 2002:ac8:5948:0:b0:35c:db03:be9 with SMTP id 8-20020ac85948000000b0035cdb030be9mr20789510qtz.29.1664907118860;
        Tue, 04 Oct 2022 11:11:58 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id e4-20020ac84904000000b003434e47515csm12034335qtq.7.2022.10.04.11.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 11:11:58 -0700 (PDT)
Date: Tue, 4 Oct 2022 14:11:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"Artem S. Tashkinov" <aros@gmx.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221004181156.nyz54oibtr5bd32f@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <CAHk-=wi7HyGxs2Ad-UiF-3qeLJnPc_WGKOVqYqaTjrbRig0V9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wi7HyGxs2Ad-UiF-3qeLJnPc_WGKOVqYqaTjrbRig0V9Q@mail.gmail.com>

On Tue, Oct 04, 2022 at 11:03:48AM -0700, Linus Torvalds wrote:
> And while the MAINTAINER file is useful for a fiel mapping, I'm not
> convinced it's all that useful for the "product/component category"
> mapping, because I doubt people will actually fill that in well (and
> reliably) enough.

Sure, but for a best-effort first go at it, it may do more good than harm. If
someone says "this is not mine, sorry, try X", the triage team will select the
suggested component instead and retrigger the bot with a new set of
addressees.

> With actual bisection data, it's fairly easy (get the emails from the
> commit that got bisected). But things like "use the backtrace in the
> oops to figure out who to add to participants" is likely a bit more of
> a "use clever heuristics" kind of thing.
> 
> Anyway, I do think that some kind of automation would be really good,
> at least for reports that have bisection information or backtraces in
> them. Without automation, people _will_ be overwhelmed on the first
> level response to bug reports (ie the "try to figure out who to bring
> in" front).
> 
> But if the automation is too stupid, people will start ignoring the
> report emails just on the assumption that it got thihngs wrong.

Well, then at worst we'll have gone a full circle, since that's the situation
right now anyway.

> Of course, if the automation is really solid enough, I think it should
> work on lore.kernel.org, not on just a bugzilla thing.

It would be cool if we could use all those big AI projects at LF to help out
here. The trouble is that there's not really anything to train it on, because
there is no reliable mapping from message threads to subsystem components.

Maybe as the triage team goes along, it can start feeding correctly triaged
bugs to a PyTorch instance. :)

-K
