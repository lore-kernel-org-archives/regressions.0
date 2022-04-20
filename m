Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479FB10F3
	for <regressions@lists.linux.dev>; Wed, 20 Apr 2022 16:32:26 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id hf18so1377992qtb.0
        for <regressions@lists.linux.dev>; Wed, 20 Apr 2022 09:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3J4XthPQxhmZkFCcoyfDlVHXj50acCyi35YWGqXRzhQ=;
        b=MnuBJjSO+X5Pn8+P5NO2V5AJCtF1cWQ6TPbAd8C+4hJ5Qvnsyy7d412pABypCnNTlk
         GqdXNfazFth9H0OxyARXt//T6KxxcABwfqHwl0XjhcpQ73Lq//+viSjwoBWzsN9BjwH+
         LDRP+DaHS0tzYKk8DZQz6i/TNoeBRlftRxZNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3J4XthPQxhmZkFCcoyfDlVHXj50acCyi35YWGqXRzhQ=;
        b=uGc8v2jVMtfZsEii8WvroeB1WW1uOFwtexpDdnoX3KxQ3NWCgRaiEfhLwszVw3Dhe7
         2gJ8rkUbUb3BIRDaaRBnUxqtFdz7K1UouX0UAhnuPJITmwsat71IzaRaUOu9e2MJ45tq
         4hPDiZBO2PpsvGiUqMKZzhXJIcrlM6rj63ynNqFc+klc7J8r5Tykx3Lvodsw1it9Qbnp
         LF5D3k//vaEtPUeAiHj0agcYfPcgX2+WAUWM9GuJewDfNM1xuUa+fHTGYjxcepeVBnkB
         dmEY4LQHrRO7CCdPjRegiMzdCzpBm6UQEHHB4PGFkWP5AkURbF0pBrtMNKnswoIPszSx
         wV9Q==
X-Gm-Message-State: AOAM533Sz/ei2LHFwFYOnp1AZNYsPdCMj5+9xQWKFjQ+1EjD2tTCg/yH
	TJJB5AlluCKJD/nJiN5zBV5DAQ==
X-Google-Smtp-Source: ABdhPJx539AYgJ3/MSSBaHkjC7fNsv8ltIIot/KmpPFw8OAWDw6agxwItmPKNSuHHH1eKaSLKSEWOg==
X-Received: by 2002:ac8:5c4c:0:b0:2e2:1006:2b21 with SMTP id j12-20020ac85c4c000000b002e210062b21mr14391034qtj.423.1650472345134;
        Wed, 20 Apr 2022 09:32:25 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id k20-20020a05622a03d400b002ec16d2694fsm1978359qtx.39.2022.04.20.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:32:24 -0700 (PDT)
Date: Wed, 20 Apr 2022 12:32:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	workflows@vger.kernel.org
Subject: Re: A lot of regression reports submitted to bugzilla.kernel.org are
 apparently ignored, even bisected ones
Message-ID: <20220420163223.kz32qomzj3y4hjj5@nitro.local>
References: <6808cd17-b48c-657d-de60-ef9d8bfa151e@leemhuis.info>
 <acccdf28-3c5d-a81b-8e3a-f72e0f46149c@kernel.org>
 <20ad7c63-c837-6f6e-6bbe-7b49d653e033@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20ad7c63-c837-6f6e-6bbe-7b49d653e033@leemhuis.info>

On Wed, Apr 20, 2022 at 01:57:12PM +0200, Thorsten Leemhuis wrote:
> > I find such Bugzilla useless - the Components are not matching reality,
> > Products look ok except missing really a lot. Does it have proper
> > assigners based on maintainers? Nope. At least not everywhere.

Nobody has stepped up to maintain bugzilla for the past 10 years. Managing
components, products, assignees -- that's not the job of the infrastructure
team. Linux development is so compartmentalized that cross-subsystem tasks
like bug reporting have been thoroughly neglected.

However, I would argue that bugzilla needs fewer components, not more of them.
Otherwise people get confused and file bugs against "kernel.org" or whatever
happens to be the first entry in the list. For bugzilla to be useful, it needs
to have a bugmaster -- and nobody has volunteered thus far. It's not something
that members of the LF IT team can do, since none of us are kernel developers.

If someone steps up, I'll be happy to grant them admin rights to manage all
the components, etc.

> > All the bug or issue reports I get via email and I think I am not alone
> > in this. All automated tools (kbuild, kernelCI) are using emails for bug
> > reporting. Why having one more system which seems not up to date?

Email is a poor choice when someone needs to share large files (usually,
dumps). Besides, I really don't want stuff like that in public-inbox archives,
either.

This is one major upside of bugzilla -- it can still be largely email-based,
but it also provides a way to share large files without the need to ship them
around as attachments or use some other 3rd-party file sharing services.

> I'm the wrong one to ask, as I think it's a disservice right now that
> needs to be dealt with -- for example by turning it off or by making it
> work properly. But to my knowledge there is nobody really responsible
> for it (apart from Konstantin and his team, but they are afaics only
> responsible for running bugzilla the software -- not for maintaining
> components, products, and such things). That's afaics why we as the
> kernel developers community need to come up with a decision. But maybe
> mailing lists are a bad tool for this and this needs to wait till kernel
> and/or maintainers summit in September (it's already on the list of
> topics I plan to propose).

All that really needs to happen to improve the situation:

1. have an actual kernel developer be responsible for managing bugzilla; this
   person would manage components and keep an eye on new bugs to make sure
   they get to proper subsystem owners

That's it, there are no other entries here. Bugzilla *can* be a useful tool
and works reasonably well with email back-and-forth, but nobody wants to do
this work -- so everyone ends up blaming the tool.

-K
