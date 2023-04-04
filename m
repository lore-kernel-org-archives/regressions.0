Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2DC942
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 19:12:56 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id he13so23319wmb.2
        for <regressions@lists.linux.dev>; Tue, 04 Apr 2023 12:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680635574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8woTh6TmpAlNCOLoz71IZoc+E0qAgl5MU7Ao9EKbBHk=;
        b=KPfuigLyv61uJyQUiNpe7ExwX9NFTtMCd8yEnPeSVIYWsxs6wE0WZ+GTbdlAH2fnJa
         Qzk5pmjVxjAjWEwi3WbvjnHyA4mj8Sh/iiNp5nYDvZcrD/cYytnL4+QFolUk2Fz37qd+
         BcLGWnSGj+BMfbemz8MzcUnKeGpztUvsh+SKK45WhZ1J61nv/roDLAhL4usrlTMI+bu4
         Jhg1wHK1yLmNHKKYW4s7QerB/oVQfyLZfGP/oMePhK6kvqkyAtosg5ComgfbC6dhxzKy
         NJiePeW/LmGW0OoUoMrwBEeTYR1QBvmaB2FKwnKmLx5ucrTJAQFnxneq8Iaz5ZxOAXMO
         YolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680635574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8woTh6TmpAlNCOLoz71IZoc+E0qAgl5MU7Ao9EKbBHk=;
        b=1qGQM20nVlaFaF+4hsUROcLE+46BrAeBXgJcKcjmk4vtVOUKesJ/MIieQsfD8gdk3Z
         V7t8iVNLRakk1wVPhPDLVBBWVJaRXjsrisLgJWwExTr8jCBSePH+xeNlqmd0q6l7flFR
         oPr0V2SESHL573HLGEpXDh5Q0zcm/N4mcP5aJ9BVAIpDjlRTQe62AouEOQOWSSkgfDEk
         pil6QatvyiqPTlpQPWzRcmvp8PTuls71bhOEDjnAcUTHZGKIKamFfrvQX0JqT2N1YGGi
         a+PUQFpanBlSjdTWikWjEkdxtaW+SOni43qEiCJ9q1wSB4DX6vBXQJ7DBKs0b2nWr6BD
         Hlhg==
X-Gm-Message-State: AAQBX9d0stOAoxpYXYo3U7XsOIvqm+VEglslqRd1Y7KeDRJzM/EuOVOk
	GgKEW8J3qBtF3+hBHkBU5b4=
X-Google-Smtp-Source: AKy350a73Urn/l+wooCjkGxIHwXnK8lQemFq8w430MLCs0ijarQgElWQgMZd5ttgExur64fUygzwHA==
X-Received: by 2002:a05:600c:3658:b0:3ef:4138:9eef with SMTP id y24-20020a05600c365800b003ef41389eefmr2971884wmq.36.1680635574479;
        Tue, 04 Apr 2023 12:12:54 -0700 (PDT)
Received: from nz (host81-147-8-96.range81-147.btcentralplus.com. [81.147.8.96])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c459000b003f03d483966sm18201117wmo.44.2023.04.04.12.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 12:12:54 -0700 (PDT)
Date: Tue, 4 Apr 2023 20:12:53 +0100
From: Sergei Trofimovich <slyich@gmail.com>
To: Boris Burkov <boris@bur.io>
Cc: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Christoph Hellwig <hch@infradead.org>, Josef
 Bacik <josef@toxicpanda.com>, Christopher Price <pricechrispy@gmail.com>,
 anand.jain@oracle.com, clm@fb.com, dsterba@suse.com,
 linux-btrfs@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
Message-ID: <20230404201253.096c9c09@nz>
In-Reply-To: <20230404182256.GA344341@zen>
References: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
	<CAEzrpqeOAiYCeHCuU2O8Hg5=xMwW_Suw1sXZtQ=f0f0WWHe9aw@mail.gmail.com>
	<ZBq+ktWm2gZR/sgq@infradead.org>
	<20230323222606.20d10de2@nz>
	<20d85dc4-b6c2-dac1-fdc6-94e44b43692a@leemhuis.info>
	<20230404182256.GA344341@zen>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Apr 2023 11:23:12 -0700
Boris Burkov <boris@bur.io> wrote:

> On Tue, Apr 04, 2023 at 12:49:40PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 23.03.23 23:26, Sergei Trofimovich wrote:  
> > > On Wed, 22 Mar 2023 01:38:42 -0700
> > > Christoph Hellwig <hch@infradead.org> wrote:
> > >   
> > >> On Tue, Mar 21, 2023 at 05:26:49PM -0400, Josef Bacik wrote:  
> > >>> We got the defaults based on our testing with our workloads inside of
> > >>> FB.  Clearly this isn't representative of a normal desktop usage, but
> > >>> we've also got a lot of workloads so figured if it made the whole
> > >>> fleet happy it would probably be fine everywhere.
> > >>>
> > >>> That being said this is tunable for a reason, your workload seems to
> > >>> generate a lot of free'd extents and discards.  We can probably mess
> > >>> with the async stuff to maybe pause discarding if there's no other
> > >>> activity happening on the device at the moment, but tuning it to let
> > >>> more discards through at a time is also completely valid.  Thanks,    
> > 
> > BTW, there is another report about this issue here:
> > https://bugzilla.redhat.com/show_bug.cgi?id=2182228
> > 
> > /me wonders if there is a opensuse report as well, but a quick search
> > didn't find one
> > 
> > And as fun fact or for completeness, the issue even made it to reddit, too:
> > https://www.reddit.com/r/archlinux/comments/121htxn/btrfs_discard_storm_on_62x_kernel/  
> 
> Good find, but also:
> https://www.reddit.com/r/Fedora/comments/vjfpkv/periodic_trim_freezes_ssd/
> So without harder data, there is a bit of bias inherent in cherrypicking
> negative impressions from the internet.
> 
> >   
> > >> FYI, discard performance differs a lot between different SSDs.
> > >> It used to be pretty horrible for most devices early on, and then a
> > >> certain hyperscaler started requiring decent performance for enterprise
> > >> drives, so many of them are good now.  A lot less so for the typical
> > >> consumer drive, especially at the lower end of the spectrum.
> > >>
> > >> And that jut NVMe, the still shipping SATA SSDs are another different
> > >> story.  Not helped by the fact that we don't even support ranged
> > >> discards for them in Linux.  
> > 
> > Thx for your comments Christoph. Quick question, just to be sure I
> > understand things properly:
> > 
> > I assume on some of those problematic devices these discard storms will
> > lead to a performance regression?
> > 
> > I also heard people saying these discard storms might reduce the life
> > time of some devices - is that true?
> > 
> > If the answer to at least one of these is "yes" I'd say we it might be
> > best to revert 63a7cb130718 for now.
> >   
> > > Josef, what did you use as a signal to detect what value was good
> > > enough? Did you crank up the number until discard backlog clears up in a
> > > reasonable time?  
> 
> Josef is OOO, so I'll try to clarify some things around async discard,
> hopefully it's helpful to anyone wondering how to tune it.
> 
> Like you guessed, our tuning basically consists of looking at the
> discardable_extents/discardable_bytes metric in the fleet and ensuring
> it looks sane, and that we see an improvement in I/O tail latencies or
> fix some concrete instances of bad tail latencies. e.g. with
> iops_limit=10, we see concrete cases of bad latency go away and don't
> see a steady buildup of discardable_extents.
> 
> > > 
> > > I still don't understand what I should take into account to change the
> > > default and whether I should change it at all. Is it fine if the discard
> > > backlog takes a week to get through it? (Or a day? An hour? A minute?)  
> 
> I believe the relevant metrics are:
> 
> - number of trims issued/bytes trimmed (you would measure this by tracing
>   and by looking at discard_extent_bytes and discard_bitmap_bytes)
> - bytes "wrongly" trimmed. (extents that were reallocated without getting
>   trimmed are exposed in discard_bytes_saved, so if that drops, you are
>   maybe trimming things that you may have not needed to)
> - discardable_extents/discardable_bytes (in sysfs; the outstanding work)
> - tail latency of file system operations
> - disk idle time
> 
> By doing periodic trim you tradeoff better bytes_saved and better disk
> idle time (big trim once a week, vs. "trim all the time" against worse
> tail latency during the trim itself, and risking trimming too
> infrequently, leading to worse latency on a drive that needs a trim.
> 
> > > 
> > > Is it fine to send discards as fast as device allows instead of doing 10
> > > IOPS? Does IOPS limit consider a device wearing tradeoff? Then low IOPS
> > > makes sense. Or IOPS limit is just a way to reserve most bandwidth to
> > > non-discard workloads? Then I would say unlimited IOPS as a default
> > > would make more sense for btrfs.  
> 
> Unfortunately, btrfs currently doesn't have a "fully unlimited" async
> discard no matter how you tune it. Ignoring kbps_limit, which only
> serves to increase the delay, iops_limit has an effective range between
> 1 and 1000. The basic premise of btrfs async discard is to meter out
> the discards at a steady rate, asynchronously from file system
> operations, so the effect of the tunables is to set that delay between
> discard operations. The delay is clamped between 1ms and 1000ms, so
> iops_limit > 1000 is the same as iops_limit = 1000. iops_limit=0 does
> not lead to unmetered discards, but rather hits a hardcoded case of
> metering them out over 6 hours. (no clue why, I don't personally love
> that...)
> 
> Hope that's somewhat helpful,

Thank you, Boris! That is very helpful. `discard_bytes_saved` is a good
(and not very obvious to understand!) signal.

> Boris
> 
> > 
> > /me would be interested in answers to these questions as well
> > 
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.  

-- 

  Sergei
