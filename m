Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224B46AEF6
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777565059; cv=pass; b=RSl68pz75Zgq92JNM4Nj2ulv8tpIAOUnLhf3oD7IAyBeUS7buWCHpIAYI5t8csYGlz/xGLzmh0wRp7ts7CHFTqGuF1GcPTYjUyf9Ur3HGOFbABhji4U+ek9UTSssmiAy1PKzoVp2B3zFkGiSW/4OyQwInFh0CQOXsxGZsiDAxnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777565059; c=relaxed/simple;
	bh=Ef49oYT6p94yZhjmT5kOtDJ3He8IHhFy3xHgSEFlhfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpI+kovYWXk6QAj79hofcL32QvFITPtySHDUkAx2PtFEdjFtubFi3vTlu65ZB0iUGjV8zFWQ3t8uFlcIsidAvrFy3hfoLngCI49URtvq5BFI8Nz9mQ+pgcn1u7hq+8vrOaFNVGrsVx/vWIWVwdMoaIlhQarO0SNxl3h1S49XpL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3plA3wQ; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3plA3wQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c01854477so158336766b.0
        for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 09:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777565056; cv=none;
        d=google.com; s=arc-20240605;
        b=ULUFuFzn1M3mtnyzDcRCh81Za/h/2YI+VZCUX2vIFLmMsxTnFcEwy/ih8GyxspU0QC
         pQr9ttvwfFsfOlt3BuYjF5V6FOpNRgFg5psm6Si5yHrQtb8EA/ba+ccl2wQ8T7wxiC7Y
         xw8+LiUw6XnRhnT+gcrkGV8AXPd1gNfzAdY+zTrgrPgV8aD6yhYl7tUvPtZLLun6xBR2
         Hu8PmLDklOCEtl/bq43m3Q/JIy+0tGW47VUwF0K7nnDtC8MMGep3+J+LvWy7EcWRLzXq
         tqq5N9KH7ONz5A/CkSMb8YEdsjrAGuSjR5w9vy52Ckef4VwzuNq+VXd5RC6FDzXvVNQV
         wBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y9SQf5HaVb2gJQwnS3/lQbxFEkfxVfifFwEXsxY/FTg=;
        fh=aNFrgwd+2g2qwBUxxhwD6FiioojO5VxAS5dtacpUOlg=;
        b=LWTYEmuyvtCT/9LkSalt+9Q5L3sSelQoBHsuiECA4VYD5LQh9dfrydMeoJohG8/Mb2
         iJij1wsHUgGrK9hWqrVjbfJktuhE7t/NwBurGhzeLCeeFv4a5CXHwrJANQjjBUJtlEHE
         WEL5ng7X13Q67wkl++wq9LZppInXxYxHj4TSr+vcr99OjP/vDR/LFvgbmexjScgBUsTb
         odLlvlp7aYYLv/tTW5kUKjCC6pf1FyS6SLMf8k4K/ugItaZlDqkNyVbjKvCV9zpdMaO/
         prpaWR5l8OMPJEbeBEeVRdN8URzDUKn+lpnmZWwmkT02CSRihTQoxnIqHfDJvLlC8zO4
         U97A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777565056; x=1778169856; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9SQf5HaVb2gJQwnS3/lQbxFEkfxVfifFwEXsxY/FTg=;
        b=M3plA3wQIvU2WZbZ2NY76MHx6AvnvM32KX/Ek+8sZ8d1jaCjuKdGZP6ZLHUXfStjcL
         f+H9vQ4GaQZQzp1kyOyYAv/BHoGcj+Q/OJEZD3e2oAQsJN9D+9+Q3mC17NsuoPMhhBNz
         gX1cRl84zRXUtSD/7sNj0EvVG1PcOKSwEsTqnoPU/XD7oRpoBl76MD23EcHCaI5tpwHo
         Efp1MHeWE4ggN1C7NiID9yZvNcwsi63JIXgAvtnM2MGVAUGE60lYKtymeckfOSl0DE9E
         YhlrQCLXVccUturbV7IK7e6L4g5/e5H8cELP1jt64X7ZXT8oOKKP/SEurf4ygtuqukVm
         MA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777565056; x=1778169856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9SQf5HaVb2gJQwnS3/lQbxFEkfxVfifFwEXsxY/FTg=;
        b=E373GuNe4Ve+aIQSNHkGjdkSU0zoPLoKsnWXZgciL+K2fBfOOzLl8o/n/G7kvGodUK
         2U7x/YFHCoic++qGr8AUH01w/0adORUNOgVGbFJzY2sKf61RmnrTZ98K/+qQHMRunxsQ
         hEpBqQ8LFNb0N+j6jz32A4D1kr1EUVG6WYhqt2NhjlK//jc8orM9fRPVyqa1l4m+Tqfm
         WMQ3Ea7ZG/TCpJIiseUGBiPFfdA3mWmNJnahLyi434R++iByYTUAYJz7mDoBLMfF3w0F
         LcPJ7qpp6Tnr4u7uJngMTZM8FmnWrfZYgwcLiej/kAJ/GYxEUbCJLVyHTsEOXvt/ksFI
         eEaQ==
X-Gm-Message-State: AOJu0Yxt10xhbLTISzH98MoviAC3hw1KNw1OPXG7+EDqDvP+9szQIJju
	/tUfxo+621JLMqedsd6bRYh1ZNoWtiIcoOXbpvUpwhv8A91COAvQmi/w6RYOIU+XTmv5PkEX47Y
	J0B/KzK9DNMUsvzaea1nxbfe2QgxoRSibY+2v
X-Gm-Gg: AeBDievO4EXQAI6rqKcSEzBZXAfMZoaPINzFR5knyV15UjPtAXxMxcV5Ce8FJEfQrQf
	+wKc4e0WAk84gQDKUko4PmtHPUdV6GHQ6IsJ7eVxpamqyKq8vmMa0FLrAaMGZ0kd2ApxnNnpr7H
	tIehF+TkNtmcUiFtBNzV5vKbRgjf4xwt1m+o1ukPIkQHPD47cNJ4//w6s34GGes58FHfvmGTvVH
	DAI18iKVdKcXY+ttXbC2nEaBI0wI32ykZdmJS8P1j5fLU4GG1Gnad/SzBYQA6cppfJWEpHSw4CF
	cy4vLUVeuL0WwR1XXg==
X-Received: by 2002:a17:907:6d0c:b0:bba:87c4:2a8c with SMTP id
 a640c23a62f3a-bbb68d0e7ccmr214367666b.4.1777565056166; Thu, 30 Apr 2026
 09:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <CAGAxtY2SEkx7OgMgM5ypA8qsBN0h6pcs111VjnhD-5ZGq7Je6Q@mail.gmail.com>
 <CAJZ5v0ikAeu7cW9K6sfKYbbsVK51GOsFrX-qv3KJ7cVr-gRHew@mail.gmail.com>
 <6010375.DvuYhMxLoT@rafael.j.wysocki> <CAGAxtY2N-=3taOBCTFZzEmm4NqJ-KhtsWq0fNts_tn3nAxpkTA@mail.gmail.com>
 <CAJZ5v0j2MKGRFRRVT4rFuzr2OwJg7ufAfDKUS0rgAsg-EBH6Kg@mail.gmail.com>
 <CAJZ5v0jhjXap6gSZ5unR7cE+CQQPk1tDnAXLm9rkGsC2AnZTew@mail.gmail.com>
 <CAGAxtY3h4sEphqKL-jiSn4p0NT9mdZtOFrVxW7CDo22XdL56iw@mail.gmail.com>
 <CAGAxtY39Te1zwK11KmuELHGV3MJMRYfTju+oXuzKeEZqVGKQzg@mail.gmail.com> <CAJZ5v0jF1YNyo4uYTK+JPK2QFhC-k=dazgoq4XCAYVri9Km99A@mail.gmail.com>
In-Reply-To: <CAJZ5v0jF1YNyo4uYTK+JPK2QFhC-k=dazgoq4XCAYVri9Km99A@mail.gmail.com>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Thu, 30 Apr 2026 19:04:04 +0300
X-Gm-Features: AVHnY4LYFq_5yQK-qoCOKzisAXSWoguvo_eBUYRzmRmEVKO3fMayERUTrTMbmVw
Message-ID: <CAGAxtY0qGr4ULh+dV6f6JnYoFinMhJM6B2SLAEGAL+5Z-K6pMQ@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
 (schedutil involved)
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I guess you mean with the powersave governor.

That's the thing, I get these weird values in powersave mode.

> I would expect schedutil, ondemand and performance to give similar
> scores, but for powersave I would expect the score to be lower.

I did some measurements earlier. I got roughly the same values in
schedutil and performance modes. In ondemand mode, it was 7% lower. In
powersave mode, it was significantly lower, but I don't remember the
exact values.
Now, the values are at their maximum in all modes.

I see that the frequencies change frequently.

cat /proc/cpuinfo | grep MHz
cpu MHz         : 2000.000
cpu MHz         : 2000.000
cpu MHz         : 2673.037
cpu MHz         : 2601.029

But I don't see this reflected in the statistics.

grep -r . /sys/devices/system/cpu/cpufreq/
/sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors:powersa=
ve
performance schedutil
/sys/devices/system/cpu/cpufreq/policy0/freqdomain_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_governor:powersave
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq:2834000
/sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies:28340=
00
2000000
/sys/devices/system/cpu/cpufreq/policy0/related_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed:<unsupported>
grep: /sys/devices/system/cpu/cpufreq/policy0/stats/reset: Access denied
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:   From  :    To
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:         :
2834000   2000000
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2834000:
      0         0
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2000000:
      0         0
/sys/devices/system/cpu/cpufreq/policy0/stats/total_trans:0
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2834000 0
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2000000 8222
/sys/devices/system/cpu/cpufreq/policy0/affected_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq:2834000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_transition_latency:160000
/sys/devices/system/cpu/cpufreq/policy0/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/bios_limit:2834000

grep . /sys/firmware/acpi/interrupts/sci*
/sys/firmware/acpi/interrupts/sci:       0
/sys/firmware/acpi/interrupts/sci_not:       0


I tried this with the previous patch, and the kernel didn't freeze
when I pressed the button.
But with kernel 6.12.74, it doesn't work.
echo 100000 > /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us

=D1=87=D1=82, 30 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 17:10, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Thu, Apr 30, 2026 at 1:58=E2=80=AFPM Evgeny Sagatov <evgeny.sagatov@gm=
ail.com> wrote:
> >
> > I forgot to say that in ondemand mode, when I pressed the power
> > button, the PC did not freeze.
>
> OK
>
> I think that's because ondemand changes the CPU frequency 10 times
> less frequently than schedutil.
>
> Writing a sufficiently large number to
>
> /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us
>
> when schedutil is the cpufreq governor may help, but I actually don't
> know how large that number would need to be.
