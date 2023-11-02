Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9492D618
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhdXPlEE"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5845213c583so333368eaf.0
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698916525; x=1699521325; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caPEzYV4J4M0wWYvtr+GB3NqWn9lERS8wHGxpAZ7shc=;
        b=DhdXPlEE+YkAQ9delRIKac7VfdbTIJe/NhJlE+bMrXCl73MLfyXVkt6KbF2U0znkrf
         8IwgVkXqCEHagxIzPfl3iUD38ODQ+A/z/6RRuB8pYq/JkdnsH1sRWlBO8HGCaqhAfrX3
         x/gEz0Hft0xU5ycquB5d3Hj9+b7dJvA4aKO4kKe+crGtp50lC+StjMkSh5EAI+rZS2ui
         q7LGFL9ZOnxtH8D9sMSK7Y0D/eTwjmtX/NHERROgr1YfQzLeV8fzYHh4AAj5c6u2Z4Su
         cNPhp5m0UVJa6H3Dbkyo1f8HXYn8/Xe53TcfyJF2Niku9noNxYHa3efojMfI1r/S0mo/
         bi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698916525; x=1699521325;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caPEzYV4J4M0wWYvtr+GB3NqWn9lERS8wHGxpAZ7shc=;
        b=QXX1thiK1biE3e2zKLBlqi947OGfA1ETk9dEVnRzXQIyWP7zh1FJrSTMwuMUHf959s
         SGZBIBwU6ZrGfv1YSvyZaXteSzOildHCWNDOlZ48hKeRTxmAog2Cn36r6JmVKmlFOu+6
         KdMQahKNnVd3Zw03Obdi50fWHsxK0/t+NR53wLSJ/dRgDcGBTnTP81Id53PKmAd6Xw/c
         cLXCMVMS7Hwi6bXB78RQG5P48GO7aCuvejatt42vc/xjl2jlWsBP8reMvnHQ47ud8aru
         aHKIOKN11654iZLBSUTg5xQQCK4eyJzGpKvPxFU/Ii/Mfzudj8A7iTCU89/ONGUF7jz9
         pSxQ==
X-Gm-Message-State: AOJu0YwCV06zZNmFKLAwRD7yaenRaGI6tq9u/bxOUobNQAy+e4mVSmNO
	4ldNAWerirpAHtFBs4IOTwAEWY/islrX0s9/qkk=
X-Google-Smtp-Source: AGHT+IGcPuomBK8TNpeziKDesTihsWNjAp2h3J1FWTC79dSussXvee+MrBWw6arKMMvPhYHRrxeyLSdrDICPywYRba8=
X-Received: by 2002:a4a:bb09:0:b0:56e:466c:7393 with SMTP id
 f9-20020a4abb09000000b0056e466c7393mr16749040oop.5.1698916525728; Thu, 02 Nov
 2023 02:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:118c:0:b0:4f0:1250:dd51 with HTTP; Thu, 2 Nov 2023
 02:15:25 -0700 (PDT)
In-Reply-To: <ZUNYNEnGC8cm6ALH@debian.me>
References: <bede02c1-ef90-8e30-aa8b-e6fae49a8ccf@gmail.com>
 <ZPql6tqBCnXJh64J@amd.com> <ZUNYNEnGC8cm6ALH@debian.me>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 2 Nov 2023 10:15:25 +0100
Message-ID: <CAGudoHGfjRd9r7ec7S+HcGf7=dVTAJz9WDxPc_5w5Fykns+vrg@mail.gmail.com>
Subject: Re: Fwd: Abnormal battery drain with kernel 6.5 (Ryzen 5500u)
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Huang Rui <ray.huang@amd.com>, Meng Li <li.meng@amd.com>, Perry Yuan <Perry.Yuan@amd.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Michele Della Guardia <micheledellaguardia@yahoo.it>, 
	Linux Power Management <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On 11/2/23, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Fri, Sep 08, 2023 at 12:41:14PM +0800, Huang Rui wrote:
>> On Fri, Sep 01, 2023 at 05:42:22PM +0800, Bagas Sanjaya wrote:
>> > Hi,
>> >
>> > I notice a regression report on Bugzilla [1] that have been already
>> > handled
>> > there. Quoting from it:
>> >
>> > > After switching from 6.4.x kernel to 6.5 I experienced an abnormal
>> > > battery drain since my laptop is actually never idle.
>> > > I accepted default CPUfreq to schedutil and AMD Processor P-State mode
>> > > is 3 (active).
>> > >
>> > > I expected a different behaviour, but am I missing something?
>> > > In my boot configuration I had "amd_pstate.shared_mem=1" and tried to
>> > > remove this switch, but did not affect my power consuption.
>> > >
>> > > Is there something changed from 6.4.x to 6.5 that requires a different
>> > > configuration to get an optimal power consumption?
>> > >
>> > > Thanks a lot for your attention
>> >
>> > See Bugzilla for the full thread.
>> >
>> > Anyway, I'm adding it to regzbot:
>> >
>> > #regzbot introduced: v6.4..v6.5
>> > https://bugzilla.kernel.org/show_bug.cgi?id=217853
>> >
>>
>> + Meng Li/Perry,
>>
>> May we know which CPU type are you using? Try "lscpu"?
>>
>
> Sorry for the replying just now.
>
> The reporter (on Bugzilla) had bisected to commit c8afaa1b0f8bc9 ("locking:
> remove spin_lock_prefetch"). Telling regzbot:
>
> #regzbot introduced: c8afaa1b0f8bc9
> #regzbot title: spin_lock_prefetch() removal causes abnormal battery drain
> on Ryzen 5500u
>

This particular commit is highly unlikely to be causing anything of the sort.

Looking at the bz I suspect the reporter did not follow through with
bisection, to quote:
> Tried to bisect following docs and I had just this output:
> [c8afaa1b0f8bc93d013ab2ea6b9649958af3f1d3] locking: remove spin_lock_prefetch

But that's what one gets when bisection is still in progress.

Final message, should one go through with everything and this commit
indeed was the culprit, would start with this:
> c8afaa1b0f8bc93d013ab2ea6b9649958af3f1d3 is the first bad commit

Perhaps you could help the reporter through building the kernel and
picking good/bad status. I don't know how easily visible the issue is.

-- 
Mateusz Guzik <mjguzik gmail.com>
