Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C1A31B838
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869337; cv=pass; b=OFOcRiioPxD4gt4SCrusWVDx/sc5rNMS/AsPIpvEYQTQvvp3rK6ot2t2L/nyp7JlKMqeV1STwPn7D3lvxgFZMtsB03pEvv7lDgTVZ0e/s8ZAaYomlPg/YBpWunbEgRcMIeap/2864VK6w4IEaA4d7dC3uY0y+lzlKTXByT4MlXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869337; c=relaxed/simple;
	bh=wn3ok0Jkz5sAH4FeklqQIbZniTuIxmMNTkxtEQVgsic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBrNEXlis+is0hzS1+PjtPd40QN82tQJWQBGy/dCTYryvFoWCeXcIxXjE82rm0TLa+1lf8D42HF/Pht00YMHNxWVRvp2LDzeHI1r9h/EgXICtq7C5zcEaRqpx5GDb9tCFC/dUUMvqJwSnckwyi/JRJXp4YplTby8Xm9NQO1Eo14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXGxAR6J; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXGxAR6J"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba67b332bbaso575283366b.0
        for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 07:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776869335; cv=none;
        d=google.com; s=arc-20240605;
        b=ceRZpk9FYaSd4ZQqwoRfuCsy9lm58libb44EKmATCBzbvbw6TijiDflq6KS04ObX14
         9IONB6VH57p+qoN+qoDNPVMy48GLzKXloKShNsifdFdgiFxxr26PbiWLTtsT2RxuC8p+
         HfPuaFFtWE7pc57rbxcNAcrg6nNgf+4d/UlGaYE+f8m9uU88dY6qi1QRFXRhRLiEmM5Q
         +Xe4ueSDh70cYldQs0ETQuJjhFnxy5UQqiaZryLP0uh45JI7/rcBAcJpHEi7aaI+7neW
         nsAvzY3t84w4kasVT7chAD9Zf4Y3kC7HTN7VVHur8wQAJAIVQcqWMPa1ozEbO+bfHTkM
         8bhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZiPIh5LbjptiRP0arjwi4DSydPp0e+RsTQxDhLOBuM=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=d4U5+m1OezwEL9351e5incT89EZwjRgJLG9xWVNjjlvh6i4OCGRZCzxoypiyl9E3Bf
         Dsu1ktiZYJ1g6KAzpp3bCQCjj1N4QEAixPLgkvhJiNZMqD8SBd2xGJdm+RArftBF0nuA
         nkr972ldggpH7MjRgKlpoZdB6AfD2DAZFKWWaQjvjYMR6hc53PPsCXH8q8TvEQmaAkek
         VK4txjAelg2SXzCJgl4oqFOYohemNhU68QWXrXCM47wPiOb1YmKu2XA7/BxnyTM+4yjC
         wwMpu2zhbCNfzTEB3MRM6DynU8fMH9ZOHvVkGOMy4nujt8Tp8Y+N9UiC4w6I2EvrIBmv
         XS2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776869335; x=1777474135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZiPIh5LbjptiRP0arjwi4DSydPp0e+RsTQxDhLOBuM=;
        b=lXGxAR6JoxIfO2788eJlkGw8DR0iQCV8OYgjORMZxyWybdsITnUTLVnA8uqdKvIyT0
         BuQei1itIuwjCg92pHJQFa+c6D3H/A0HqhDH2Hf4WQ6092fF4XAJpf6e7Cj1sz/qvmPJ
         1pcIIlr0DXaSkSp3TiDxROEFgzY5D3pS+hkGBLKKSOthcuvyH8FBatrfSzCSV8EnvHvo
         rHi8ybtMyPYqv3tntZd0bixL1RPjTHkw1oZAZvEqUJIGR3ptjIUpo6XEezXONNeFiBWW
         PnYn1jeKxk2of8cLml4CevSmmjbTO1vA/RDvUswm5uLJlAfR2+WizTffmJEDXgO7Purl
         /E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869335; x=1777474135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KZiPIh5LbjptiRP0arjwi4DSydPp0e+RsTQxDhLOBuM=;
        b=kAZBKH5C0WaX7SUBM2ZF3fZkTeehnuJDTWe+geh9C9zagoEGDa8598LUJL0ekvasvx
         Pcfj8CitG2jWuFgNrCI5agfpq3GUIsf/1AEnVgGgdsBgHs2vMgz7+sbEnS6ZQP0y2x2Q
         ErY9lSumS/iChdwtAeyiMH0fJnBrWpby8aWIZMCItYt5twpzQDYHYZYiMI1ua3842lCw
         S5SeY68xhw3RJFFpAUVDgxxJ5D/dwoLs6B161izSc8e/qeelXY2NxUmwTK4RwWFMARV5
         f1BUHlRIe1yY+zXQY1o9acjoVuGW7kNRA87QDAewxt0zTyCcvjQqXvkMt7Qetq7fCgJd
         6Ndw==
X-Gm-Message-State: AOJu0YyXHojdBgy2eUEE0z3boCAvCpI4tCgoUhLCcysadVOsZkwm8Por
	IMjL8csTPJd+9eJIQpPUWSXI7dIcZz1ovDOB1uWkOPLYQ3shAnakyyU8RgsLi3S/1ES0x5Fi6PL
	xqlFL0zMK+pNhjLiCdx7KP9E1iU5pJZI=
X-Gm-Gg: AeBDiet3n43o5maTVUmS17iaVW8uXhlavBqmzesPOM6tzqLGuVRHs8s3iDQIn26MGHw
	HW1bJsyMjwxpwaSQYdlqnV+KySylitfAh01JUq+gBfnsDRyG97dngE/PJ+OXPqOTJdcq4YE911P
	yQArJaru/jvxSpSbm47aF73cQo7z7aBjT7BbO9H6z221+agsXUStFOHK5zXbOahkYYtftQnyfwM
	iPzcIDrMo9A7RyoRRAak9aydEAMbFFYriOPdP5yKczSAG55AjImb9WwM0zyxIvpv8IUtzf1Aoxb
	UzVOZEeAOJEJ948FEA==
X-Received: by 2002:a17:907:96a1:b0:ba7:fbfb:4caf with SMTP id
 a640c23a62f3a-ba7fbfb4d91mr688050566b.43.1776869334367; Wed, 22 Apr 2026
 07:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <168591776860440@mail.yandex.ru>
 <CAGAxtY1QDN_vkXEzdT8yUC5ZR3W+18TypEcJLR+-=kUkaBOdTw@mail.gmail.com>
 <CAJZ5v0jzPk1Ad-fkKnKZwBWifQ89oPgEhv7A5M5mLtPyMRX+nw@mail.gmail.com>
 <CAGAxtY0g-eo9r5NmSD34bZrPWwfHsfNcXb=XRPuL=65WGmgOmg@mail.gmail.com> <CAJZ5v0j+WO2yP53nvjshFfEo+ETWiyCo7LohoN2DoORVd_NFbw@mail.gmail.com>
In-Reply-To: <CAJZ5v0j+WO2yP53nvjshFfEo+ETWiyCo7LohoN2DoORVd_NFbw@mail.gmail.com>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Wed, 22 Apr 2026 17:48:41 +0300
X-Gm-Features: AQROBzDxrlXx0G1dGhXFpRFfGlujxPsMPFWTBSXxLZ5Jvf1Zt21D9ZANQ7KSIcY
Message-ID: <CAGAxtY0tgWJ=QQ48=aYTiQd994Z+9e=BAFN1OFTvzP9KE46t8A@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> There are two cpufreq governors to choose from.  Have you decided to comp=
ile out the other ones on purpose?

Powersave is compiled into the stock Debian kernel as a module, so it
does not appear in this list.

I changed governor to powersave and pressed the power button. The PC
shut down normally.

=D1=81=D1=80, 22 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 17:04, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Wed, Apr 22, 2026 at 3:34=E2=80=AFPM Evgeny Sagatov <evgeny.sagatov@gm=
ail.com> wrote:
> >
> > # grep -r . /sys/devices/system/cpu/cpufreq/
> > /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us:240
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_min_freq:2000000
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_available_governors:per=
formance
> > schedutil
>
> There are two cpufreq governors to choose from.  Have you decided to
> compile out the other ones on purpose?
>
> It might be useful to compile the powersave governor in and try to
> switch over to it (on all CPUs) before pressing the power button
> (without any patches applied).
>
> > /sys/devices/system/cpu/cpufreq/policy2/freqdomain_cpus:2
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_governor:schedutil
> > /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_max_freq:2834000
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_available_frequencies:2=
834000
> > 2000000
>
> The frequency scaling on this CPU is quite limited (only 2 states to
> choose from).
>
> > /sys/devices/system/cpu/cpufreq/policy2/related_cpus:2
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_cur_freq:2000088
>
> Interestingly, this number doesn't match the available choices (maybe
> due to a rounding error or similar).
>
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_setspeed:<unsupported>
> > grep: /sys/devices/system/cpu/cpufreq/policy2/stats/reset: Access denie=
d
> > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:   From  :   =
 To
> > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:         :
> > 2834000   2000000
> > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:  2834000:
> >       0       762
> > /sys/devices/system/cpu/cpufreq/policy2/stats/trans_table:  2000000:
> >     761         0
> > /sys/devices/system/cpu/cpufreq/policy2/stats/total_trans:1523
> > /sys/devices/system/cpu/cpufreq/policy2/stats/time_in_state:2834000 660=
6
> > /sys/devices/system/cpu/cpufreq/policy2/stats/time_in_state:2000000 248=
733
> > /sys/devices/system/cpu/cpufreq/policy2/affected_cpus:2
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_max_freq:2834000
> > /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_transition_latency:1600=
00
> > /sys/devices/system/cpu/cpufreq/policy2/scaling_driver:acpi-cpufreq
> > /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_min_freq:2000000
> > /sys/devices/system/cpu/cpufreq/policy2/bios_limit:2834000
>
> The fact that acpi-cpufreq is the scaling driver may be related to the
> power button issue in principle.
>
> I'm still going to send you another debug patch for the button driver tho=
ugh.
