Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6361F4174
	for <regressions@lists.linux.dev>; Wed, 26 Mar 2025 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000894; cv=none; b=brYLdzq7JCEWwVUhVm7OdE82LJzCoB+EUKvI1Dh8SM8uK3v+JWHvTtjWX1RjUtXVh97ztepDwP8/uQErn6gjCRoJYM1eeyL7T6SsCs/u4lxlwOXLMkvBbjnFupmh9zzVcsNdyZFJTVfiecjmwNNJfISZAyi6HeZIspIiNRdTiyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000894; c=relaxed/simple;
	bh=02X6yN4SswI/9hcxh3NzYkNAPF+BwgR9jvGHnZrFNrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuLWrusHOND8Sv3jXzOi0f4GSs1n3XYgHEvLWsHygXUVvvs11oqVU6D7c+xy9WBraMA87OXxOptl4IbgNK9Yic08f1Se7a2zgyecYSjn2jl5PTxjGLL7DLVngS22fsnsaPbDrIOc/GZiksnp41HfD0hp9ogWoxJ/6/YNezCflls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVrT1yjv; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVrT1yjv"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ff1e375a47so61646437b3.1
        for <regressions@lists.linux.dev>; Wed, 26 Mar 2025 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000892; x=1743605692; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=02X6yN4SswI/9hcxh3NzYkNAPF+BwgR9jvGHnZrFNrU=;
        b=XVrT1yjvPXXFXcKWzpnwn0HcFR8aqwqRiQkLI5/GkSnMsS2AqwpvC2406RCDYpRL/J
         UjSI4ep2lW0ejAcCWa8Jtp8ZKLVYDeWKaIPFeyVziT6iwsOaJZsFSRNib5iQJFOyNoPQ
         hZENUcovSamHkX21JQ5VbZTN0E2ITRS5U2E87yhXFWVRJfbA02ZWlhXl2vTxq9yw0ZPd
         p4jBrnB+9el79AwnoMS9lolb3WflR9k7UKBl+8+bfDE5B0NX0zb9+CgcCi7kVZCei4D7
         cFPjUahH7HIaso/a9A2ULLLxx0DPdL1MZjuqMyj0mIi1AwHPwyynWxEMKdj5NsV2NlVl
         xIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000892; x=1743605692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02X6yN4SswI/9hcxh3NzYkNAPF+BwgR9jvGHnZrFNrU=;
        b=tee5SliXwaEK32EVtrYCE/rSkVMeEtln+ZDsXJz0nWWzGXkWyotfteOKgpNMKZMSCB
         nrTiCET281yLrHCmmEEhRS6CW50dTT7HoE1H3imYkP8TnjsWFbC9ljofeFlilXH24tt1
         5YnDUSaBmOK+elIpxXWXy8UqTG97Q3ZeArPGAZxtEEKAy3H1rK1ZWYlObj7D9Guwo7IP
         7SutJzKO8Zk+pmq0V4J4STgOX4NAtMT6C6LR2S1lwOyIFqHHf/4cXkWWlI6yI5TMf+7a
         ds6wsvpGOipYkE3mWfm05wDBOhFVrU0VHBdhv4L99a3phybYwBUgSst2R5Rf4sNLujV6
         2MLA==
X-Forwarded-Encrypted: i=1; AJvYcCUj3pdW7E6I3BSvcwnURv+u+sYV+eJdyAEJbOsRf3c3R4uPIKWOG9kvVxneOMKSw1OkAd2mM8qan2X3ZA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx+DuHdYNoVtE3nP26cAbf5JIYvgqhBOHIC6sPmjkLE3OZe9yk
	TYZODDMz+Nds7A5MlFm/Lb9qfe3ZLUs4DO4Zzi7xtzPcjKKBwgai4+Zf35yNaMX2vTz7f9qBDN+
	OhYbSboa+i+HvEuNiq10aI2wWLS0=
X-Gm-Gg: ASbGncsJUmb34vxIrr+IEnZTsQVTbjzZCzWlprQvXiJNy4K5RF229QbKdWtjJbSqrdP
	q6X6jekB9ICJIyCqpinGKJ3jRvLnh6QcNf/7DTf+lIL3ohPUX/+RKcPaPp3R0kCC7rYXZPL8O/4
	7Nl1qm1NJblhq7WKdckCASR28Q+DnENeTJVZ9AXRqTOui+WRWZo6ViLhLMvf8=
X-Google-Smtp-Source: AGHT+IFi5q4gE0Mg2Cb0WVtsLpHpLob8VAUW3HFAyPXEifnXwd2HKTT3Mf9IvJOzq4flnb9WeXAC8wM77OVOywt8Mpc=
X-Received: by 2002:a05:690c:c09:b0:6f9:9e80:46bf with SMTP id
 00721157ae682-700bacfc23amr274557107b3.29.1743000891785; Wed, 26 Mar 2025
 07:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbMbZe9LCE15SCbYNTGZjE_xiAm29qzO_WNVjHsJ6oyyg@mail.gmail.com>
 <9ada34661b93fa5dfe3b0c66816a62c1a27f22a3.camel@intel.com>
 <CAP-bSRZm4CyxY1VdtWvZRcfLMwc3njd3OTSd446Q5dcSfjJY=Q@mail.gmail.com>
 <CAP-bSRbon4O=DCLHvOZHm452Svc3-gsZ133Jn7-TFt8f_Y1CFA@mail.gmail.com> <36b0f88ff0f17e0246037d5f834ac545afa69cf0.camel@intel.com>
In-Reply-To: <36b0f88ff0f17e0246037d5f834ac545afa69cf0.camel@intel.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Wed, 26 Mar 2025 14:54:40 +0000
X-Gm-Features: AQ5f1JrFGcJKO_go_hszrWqOvwd4pr-9LVI_gBcazdsIwCJkluHfBXi78KEDGlM
Message-ID: <CAP-bSRb_f1A=_+A9x8J75socYsKFKDtysZ-m0+6Ks7NdSjQ0-Q@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi resume error, bisected
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Sept 2024 at 11:26, Grumbach, Emmanuel
<emmanuel.grumbach@intel.com> wrote:
>
> On Tue, 2024-09-10 at 10:23 +0100, Chris Bainbridge wrote:
> > On Sat, 7 Sept 2024 at 22:21, Chris Bainbridge
> > <chris.bainbridge@gmail.com> wrote:
> > >
> > > It's possible that the
> > > HP BIOS turns off the wifi when suspended on battery power
> >
> > This is not the case. Suspending while on battery power and then
> > resuming (still on battery power) works without error.
> >
> > If the laptop is docked, and powered via both the dock USB-C *and* a
> > mains PSU on the separate PSU connector, then suspended, then either
> > the dock or the PSU are disconnected, then the error happens on
> > resume, even though the laptop is continuously mains powered via the
> > other power supply. It appears there's something about a powered
> > dock/PSU unplug event while suspended that causes the error, as
> > opposed to just being suspended while running on battery.
>
> Ok.. so that's really pointing in the direction of the BIOS or the system's firmware. Sure we made a
> change in the driver that is now sensitive to that problem so it pops up.
> Since wifi is available for you after resume, I think it's better not to fix that for the coming
> release which is almost out. I'll funnel the fix patch I sent through the regular channel but you'll
> see errors even with that patch.

Was this ever fixed? I see there was some kind of fix that was picked
up by regzbot but it looks like it was for a different issue caused by
the same original commit. I'm now on a different laptop, and hitting
the "Timeout waiting for hardware access (CSR_GP_CNTRL 0x08040008) ...
iwl_mvm_check_rt_status failed, device is gone during suspend" error
on every suspend/resume cycle (even if laptop remains plugged in while
suspended). I see it's also been reported elsewhere too, e.g.
https://www.reddit.com/r/debian/comments/1g7yook/iwlwifi_crashes_after_resume_from_s3_sleep_on/

I know the wifi is still functional after the error, but spamming the
kernel log with a stack trace and register dump seems excessive given
that the BIOS turning off power to the wifi when suspended seems
reasonably common.
