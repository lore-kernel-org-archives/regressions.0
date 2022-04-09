Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64685622
	for <regressions@lists.linux.dev>; Sat,  9 Apr 2022 02:13:53 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id t13so9281111pgn.8
        for <regressions@lists.linux.dev>; Fri, 08 Apr 2022 19:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EoWPSPWqWw5i1pUl8sUAWot9g8foyIcMzdNqiGiO4F4=;
        b=RZt5KYYbOkDfghmFt/7qyoWgsAUAzZMz+zNKjErml7yrqokW4kA3d8GS76kDTuKK51
         9REd9aPYvEnPXgnBPq3kZlfw/LdxTpXAYQmtqPeGWVbxaxlQk61pBgZDA1vDsX4tNwZZ
         w5gq0d6kIfnb4rw2sGFStZeDLMyUztQjVJj2uDHP2qO4CNoaiRHt3KoEfG2WkL0VJtvM
         IoW2mrxaggmRtGvtwqFK8E5A9QRvTaynkZQJoM0xuxuMOrD37IbBlg8RZywPLcW6ZdG8
         iUPAggoA2waPSw/10rgZrurq99Ta9uk37zk+Z1iIF8WLXAYhWnoNZpxVmbaUpR7aCrzk
         oENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EoWPSPWqWw5i1pUl8sUAWot9g8foyIcMzdNqiGiO4F4=;
        b=iv8qi9J1CQs55+/nhKaUiB/TflEUGBVsvteFMCI+6n9a2g7JjOzuYJTT7a3ALPZWPp
         T6zribN6AO2FT4wXkWT70FVXvsE1INpiC004ILxMNVKwsEFow03DUT8E/cu5CogN/2dS
         dNC5uG2Iiu9tU2x6brGSglsjSFlrSM47NGUO4M1J18u618p6I+YehF5H/HXzBzxTYedS
         /8G0Om4dguOKO8OBBCrSRNQ5L+Ci2byMYzAnxU6J0LnkmZkXdIx+EJEX2NnIJPH4Evs7
         T7AU+z6an+eWcyLQX2ihEUG6l+0GN4AD5Nz+Laxf3deVJoMFenWeatVxoUtz78OtcP8K
         k6Sw==
X-Gm-Message-State: AOAM530uJbpaaFgzyrUSRRQiRiUiou7duecsmMKECQjvUOIsyRiJFeYf
	R6paRfCAxR1OCbdgPXPq9SU=
X-Google-Smtp-Source: ABdhPJzjdcqvB8PwuZTCUyFTNiDQlaThJfAmJ2QvRTpS9iTx7sHXkc2GM6CPQqN03NmU2STbAscy8g==
X-Received: by 2002:a05:6a00:1256:b0:4fb:1374:2f65 with SMTP id u22-20020a056a00125600b004fb13742f65mr22696889pfi.72.1649470432689;
        Fri, 08 Apr 2022 19:13:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9186:332c:bcb2:4506])
        by smtp.gmail.com with ESMTPSA id gb5-20020a17090b060500b001c6d46f7e75sm13799347pjb.30.2022.04.08.19.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 19:13:51 -0700 (PDT)
Date: Fri, 8 Apr 2022 19:13:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	Nico Schottelius <nico-bugzilla.kernel.org@schottelius.org>,
	Jingle Wu <jingle.wu@emc.com.tw>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Regression: Mouse gets sluggish after suspend/resume and power
 usage significant higher after resume
Message-ID: <YlDr3bxY3tIOgn44@google.com>
References: <9af2d249-91e7-4871-59c8-704823118e48@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9af2d249-91e7-4871-59c8-704823118e48@leemhuis.info>

On Fri, Apr 08, 2022 at 03:20:14PM +0200, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and all people that seemed to be relevant
> here. To quote from https://bugzilla.kernel.org/show_bug.cgi?id=215747 :

This looks like I2C-HID controller and I see bunch of "incomplete
report"s in the logs:

[16558.456434] i2c_hid_acpi i2c-ELAN0670:00: i2c_hid_get_input: incomplete report (14/3583)
[16558.457434] i2c_hid_acpi i2c-ELAN0670:00: i2c_hid_get_input: incomplete report (14/259)
[16558.458384] i2c_hid_acpi i2c-ELAN0670:00: i2c_hid_get_input: incomplete report (14/65281)

Let's add benjamin, Jiri and Jungle...

> 
> >  Nico Schottelius 2022-03-26 19:27:06 UTC
> > 
> > Created attachment 300619 [details]
> > dmesg
> > 
> > TL;DR:
> > 
> > Suspending and resume makes the ELAN0670:00 trackpad sluggish (very hard to move the pointer) and the energy usage of the notebook is about 3 times higher than before suspend.
> > 
> > Background:
> > 
> > 
> > On a Lenovo X1 Nano the trackpad works fine until suspend/resume.The estimated battery runtime PRIOR to suspend/resume is 8h 43m. After suspend resume it drops to 2h 20m instantly.
> > 
> > There seems to be a firmware error in the iwlwifi card show in the attached dmesg, but I am not sure whether "that's enough" to cause both symptoms.
> > 
> > Kernel is from Alpine Linux, which is basically stock upstream afaics.
> 
> See later comments for more details. In one of them the reporter states
> he's pretty sure that it didn't happen with 5.13.
> 
> Not sure if this is input, PM, bluetooth, or something else. But sounds
> like a problem in the input code to me (you have to start somewhere...).
> 
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?
> 
> Anyway, to get this tracked:
> 
> #regzbot introduced: v5.13..v5.15.31	
> #regzbot from: Nico Schottelius  <nico-bugzilla.kernel.org@schottelius.org>
> #regzbot title: input: Mouse gets sluggish after suspend/resume and
> power usage significant higher after resume
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215747
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 
> -- 
> Additional information about regzbot:
> 
> If you want to know more about regzbot, check out its web-interface, the
> getting start guide, and the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> 
> The last two documents will explain how you can interact with regzbot
> yourself if your want to.
> 
> Hint for reporters: when reporting a regression it's in your interest to
> CC the regression list and tell regzbot about the issue, as that ensures
> the regression makes it onto the radar of the Linux kernel's regression
> tracker -- that's in your interest, as it ensures your report won't fall
> through the cracks unnoticed.
> 
> Hint for developers: you normally don't need to care about regzbot once
> it's involved. Fix the issue as you normally would, just remember to
> include 'Link:' tag in the patch descriptions pointing to all reports
> about the issue. This has been expected from developers even before
> regzbot showed up for reasons explained in
> 'Documentation/process/submitting-patches.rst' and
> 'Documentation/process/5.Posting.rst'.

-- 
Dmitry
