Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD33A29B
	for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708783933; cv=none; b=DEJIKTT5o/dzXJIoSRRf63LBtrvlM6DgLtM29FPr6AUOUvHgAn1MjWq433wZRy3r5BVU5hBtuwjBV+Oc36qJXQow5pLL2MS3TMKEnOtEPu1HstgkAq2J16uTwm5pyVk5z117f+K9Df+RwSaTX6J777XBfhPx3clOusYkdy62p8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708783933; c=relaxed/simple;
	bh=0FgNsjxOprgob6IpBDE43VocMkHW5zVSFxJ4WpG2R4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOzIO/dbsHedx9I6Fcau7zwkVzVh36bsZhIr2wpCIWRrMeB2UQj7xrt2HgN1GEqgITuGnJcCz1cQ/ehlkJllWyt5G/mFU8lOeWv2Zp21Ox9N/4+/F4fjrPvzFtRk4dy6pM0Gs1tc4l5sMc37yb4pLio2Ztkj47yl6vwC3+7ZXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3be110bbff9so479649b6e.1
        for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 06:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708783931; x=1709388731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FgNsjxOprgob6IpBDE43VocMkHW5zVSFxJ4WpG2R4s=;
        b=gPWTa6FPdbCEnlp9/Z3s1n6dkYv2Rqo5geBOh0ELWhP9U8ox4gCOQfKRgr4JWNsgAU
         rFeK34t5xeEyahtYlg129T7+M3rYdr30ewsbhYHy5aIu/AllBBT1kLJJX1maKFGQfqHw
         io4OAd5cbl3wRsyhWdMz3M8WU3TwdqmucqLE9MrpXue+R54eHuT0CCpuSd4HhT4F9VZu
         jnODVlIo+BtYHF8wSPjUo+BwPaA2bwtMsnPDjw30oYJmLIUEQnA7vluzqr71Vq5LvNaD
         qaZW/0nAQVeshuodMYrH3ldsFR/MD4otJTtqepfo4fI/VhuE81tczTwtW4TOAJj157/8
         ffhw==
X-Gm-Message-State: AOJu0YzPUzO4OO0bPTiep+xSdNs62FCLc2adn2lHMcaKvXdD9K5KEi2R
	QeFUfZ9zTkqPPw6Rq58W2x01eG8FiqE3AJGHyL8mouvI7AvFILNOPhcPo5sY0zXBkHmdrI9gbGe
	3tOagXd0XHxrecd/9e67k73nKPd27wNzl
X-Google-Smtp-Source: AGHT+IEVnUZQ1BW/6uiqG0tAPjBJBhge0xO0MypFZh90pjdUMU6FtbvTfMVVjuP/it801XVImJNU1DnIzuC7z3kUutk=
X-Received: by 2002:a4a:d037:0:b0:5a0:3d13:a45a with SMTP id
 w23-20020a4ad037000000b005a03d13a45amr2466185oor.0.1708783930814; Sat, 24 Feb
 2024 06:12:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <002f01da5ba0$49cbf810$dd63e830$@telus.net> <CAKfTPtA-jizig0sh_shmkAMudAxDPYHP0SdanZe=Gc57jVKouQ@mail.gmail.com>
 <003801da5bae$02d6f550$0884dff0$@telus.net> <CAKfTPtC7pOtb-srrgQLFbTueLLDqHay+GQBm9=sNsnZDg_UYSQ@mail.gmail.com>
 <000b01da5d09$8219f900$864deb00$@telus.net> <CAKfTPtB8v30LzL3EufRqbfcCceS2nQ_2G8ZHuoD5N1_y-pvFbg@mail.gmail.com>
 <001b01da5ea7$86c7a070$9456e150$@telus.net> <CAKfTPtD4Un-A2FcdsvKnNZskG=xH0wrsT3xzaWDs--mQjgZ3rg@mail.gmail.com>
 <003001da6061$bbad1e30$33075a90$@telus.net> <CAKfTPtC82YXOw5yYPNkHHyF+DYSG+Ts9OjnwsVjbd_HcUsZQMg@mail.gmail.com>
 <c03533dc-73fc-4d97-8248-0affbddbed32@leemhuis.info>
In-Reply-To: <c03533dc-73fc-4d97-8248-0affbddbed32@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 24 Feb 2024 15:11:59 +0100
Message-ID: <CAJZ5v0hfMuiZCFU6e9TZ7yZV1qER2ymOM7d=AAf5beyMOyHg+g@mail.gmail.com>
Subject: Re: sched/cpufreq: Rework schedutil governor performance estimation -
 Regression bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Doug Smythies <dsmythies@telus.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 2:44=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 16.02.24 14:17, Vincent Guittot wrote:
> > On Thu, 15 Feb 2024 at 23:53, Doug Smythies <dsmythies@telus.net> wrote=
:
> >>
> >> This email thread appears as if it might be moving away from a regress=
ion
> >> caused by your commit towards a conclusion that your commit exposed
> >> a pre-existing bug in the intel_psate.c code.
> > Ok
>
> Well, even in that case it's a regression that must be fixed -- ideally
> before 6.8. Did anything happen towards that?
>
> I noticed that Doug send the fix "cpufreq: intel_pstate: fix pstate
> limits enforcement for adjust_perf call back":
> https://lore.kernel.org/all/20240217213010.2466-1-dsmythies@telus.net/
>
> Is that supposed to fix the problem? Looks a bit like it, but I'm not
> totally sure. In that case I'd say it likely should be applied to 6.8,
> but Rafael apparently applied it to 6.9.

This hasn't reached linux-next yet, so I rebased it on top of -rc5 in
order to push it as a 6.8 fix.

> I'd also say that a Fixes: would be good as well (to ensure that fix is
> also backported in case anyone backports 9c0b4bb7f630), but I know that
> subsystems handle this differently.

So I added a Fixes: tag to it, but it points to the original change
that missed the check.

Thanks!
