Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7E3D9DBF
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550293; cv=pass; b=D2L0GkLLHxUBvAEGSbAs0SHX28+qmsbL9X1p6JneX51YvNIOueFCTvzf5aVXn5BNtx6LnX4uQqMxNcAOVcfwVKFu+og/02J7ICSMvXatEqu5n2NHDIW0JTCrhRs5DD650yg7hu1wpsYTPIvuRs6YnTUk+boMQ7W7yOJNdBijBSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550293; c=relaxed/simple;
	bh=7+t7PSX2hG3R6I8OwaBELhZdseFSqxN1e19Nin/FxfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AR81abaJh0FSFWXjmPZg1arv7W0UQ4Z2PcajvwOTa6RyuKEfvgzXZL/KTh4/ReIywF4SzN0sH6aXzwYT7qFTSV+lae0Tcze9Af/WqY76hMt4BTrUftYQcl4qrEoNduBfL5g/7zCkORx4K1gDUo5L4dGTbDWpMUgZPTbMq14LY3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnBLr7g5; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnBLr7g5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f9568e074so136005066b.0
        for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 04:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777550289; cv=none;
        d=google.com; s=arc-20240605;
        b=NIRhpPcciDdOUcMr0KnH48B4y+CsI4BwYX+vfUZJoKA4Z/5u/E2gvw9aB64M33SQw6
         0GBrEeYrROCHFYe5MgILzEsGvcfnaDfvuUxYT+9kRMlgaDZtBqTEtnB5Aq8bESBYy558
         iQeV2pPE9L3iB9+odb/A0RYgxJbMVsxW77yGVzG0xPkXn3pzFY8ds6b+M3czwLEbLc1U
         Lnlp71R5KiNj1ANWDRiCZ8D2nZ0H4VmR327TQsgyYc2dBX1ppCuaZ9gongBH/E7I9ZIQ
         aKSaSzIjM7viF/gZqly31OmqZe6RjQjokn5sAnrPT679P5iwjvmVPBw5jc16yRs5AHPC
         cj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=INw951u0BnQvjie+6mZXj6MBL3SF3GMW2lihCNmsoAM=;
        fh=aNFrgwd+2g2qwBUxxhwD6FiioojO5VxAS5dtacpUOlg=;
        b=E89sqtwWWffbFUF4KNIByI+VjGTF2HjQmk7SoZ5LlnlJYrQ2yWulaaKxYNWxlR2uBz
         znAT//vwrI+IHR8qN7mopHWkellDKXzDJu7XUs90w0qHgALtA+aesXqK9EAXjKQbbDcS
         rA5hBwDs2DM62sHhZMoId2v8/aR7CH8946E/gSMv3PFRyhGtlY8Xg5/te+2nXwwKuQHV
         mKdCYCD4gsrdDZcQi8G5NQ4Lv2+S2m/8FBjrAaqtlR3+8YQ4+Ch1O165akWbTJVpXZWN
         C+TkVC1nFRSxAN2abQgZqIp2slIm7e1cYpbPGy5FeWOBkdRu12PmsFqRlPiErYbjRJNF
         pwXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777550289; x=1778155089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INw951u0BnQvjie+6mZXj6MBL3SF3GMW2lihCNmsoAM=;
        b=RnBLr7g52EaOy3pnBA2qv539VoMkh5Fk4HAO/4UvSZv/lLh2GiLkHyUQ8Prv8I77h6
         ObpJUXUcwezRlh6s1PapWLFLhIgCbWYVqjPmCXKF6gH6Weyp//Q2dfdpNMeygBA5vJCc
         s6U3vXAyLWyySqDhB1JUAXp9Cp1k8GwRUOQIFpRfwViUbrQvtUlr0XVaLwjoe+LhG/h2
         99x9a5kZdSeLx+AToVrcwAGvHnx8Q1WbY3nF2Ftqj70XAjp/AsuZpfd2BMeZqrs9SBgv
         ZXlSFXYNqAnMbGLa0UPmHhpmVMW1crvTAutyahoxXasUSfbUByZ0vuJTLjXQcZ/QUOk4
         18HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550289; x=1778155089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INw951u0BnQvjie+6mZXj6MBL3SF3GMW2lihCNmsoAM=;
        b=LuMYWCF8c+zPsKF/dXbtftAuXrsqyuhiPYnX3IYOApNKogIM5VXg1MX3EYvYJkfthE
         a1OXQxXWZkxhyZyw1e+Fq7E3h7hPmXhc4P3SRvWKIW5a3gFkfkvrSIktCWGdwAZaO58T
         i5bVyu1CUSC2nD8OVFu7unCKRAU69I+q7xMwoHMDpecTKkLZPQ94jDQ0QjWOm4VLETy2
         eA/VQ3JinO50zAOUQSMSdlYbfF1NDjaZK+QpJrqpX2hSv3fPo3vXY0I6IhNxaFW4iCQo
         YPg4TS57B30hKeiSOFk+ru6AN69u4gvoW//UKZ6o5sRWwqhSyyYoDqriLJpjlcG0DlM2
         xSeQ==
X-Gm-Message-State: AOJu0Yx1NqHO+Z0kcEsF91eSwCAaPj4mWWDsLhPPFsDHBhwxZzKaTQp2
	1kR5TuBZTYUEqCy//n6LTQjfklep7AlGk2PoJC7WZetKFzkfR4eEf72tJJdPiKyX0nx8ZUh/zMl
	6CCNKzI+v9hTIbPqYWlFjB+1MGBeVmGs=
X-Gm-Gg: AeBDievPIbe9uISm2hOfp6n3JkWz2ClVz3XGhMOtB1gfe/cYCgF1xNNvV974TUv+5ZT
	Muj4MQzOz60ao6B6D8Ifogp4CGXiyaEOF6Ru2/TpYRccK5TpIoGsR1ac/gMxycJN4XvxIKRYdoE
	iOSHSgn5cLhzqOsSSMnxfEkYdnLkedyplscUjgAvhWTtgQUBXFRiCU91qsGzZ6mHxpdORb18AjO
	dOeyAULlLZOCEC8Nfve+472xaA3vkTbBP2ZqXAi1lDoJC9rddEjhXY9OBRSzaSfAZ4kH8cvy6Wg
	oVZ3WQJqQ8w4mL9J6g==
X-Received: by 2002:a17:907:d308:b0:bac:6d85:255c with SMTP id
 a640c23a62f3a-bbac6abed63mr168975766b.21.1777550289198; Thu, 30 Apr 2026
 04:58:09 -0700 (PDT)
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
 <CAJZ5v0jhjXap6gSZ5unR7cE+CQQPk1tDnAXLm9rkGsC2AnZTew@mail.gmail.com> <CAGAxtY3h4sEphqKL-jiSn4p0NT9mdZtOFrVxW7CDo22XdL56iw@mail.gmail.com>
In-Reply-To: <CAGAxtY3h4sEphqKL-jiSn4p0NT9mdZtOFrVxW7CDo22XdL56iw@mail.gmail.com>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Thu, 30 Apr 2026 14:57:57 +0300
X-Gm-Features: AVHnY4LQvFt_35xvg1VRGjxGx8TvY4fG1ix5ySQiyFhIwCPGN-TjlLMRfJgANw8
Message-ID: <CAGAxtY39Te1zwK11KmuELHGV3MJMRYfTju+oXuzKeEZqVGKQzg@mail.gmail.com>
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

I forgot to say that in ondemand mode, when I pressed the power
button, the PC did not freeze.

=D1=87=D1=82, 30 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 14:41, Evg=
eny Sagatov <evgeny.sagatov@gmail.com>:
>
> I noticed that for powersave mode, I'm getting the following values:
> cat /proc/cpuinfo | grep MHz
> cpu MHz         : 2798.689
> cpu MHz         : 1999.659
> cpu MHz         : 1999.797
> cpu MHz         : 2741.103
> Also, there's now no difference in the single-core benchmark between
> schedutil, ondemand, powersave and performance modes. The benchmark
> always gives a very high result.
> This wasn't the case before; the modes had different performance levels.
>
> I switched to ondemand, did a reset and waited a few minutes:
> grep -r . /sys/devices/system/cpu/cpufreq/
> /sys/devices/system/cpu/cpufreq/ondemand/up_threshold:95
> /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load:0
> /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor:1
> /sys/devices/system/cpu/cpufreq/ondemand/powersave_bias:0
> /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate:8000
> /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy:1
> /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq:2000000
> /sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors:ondem=
and
> performance schedutil
> /sys/devices/system/cpu/cpufreq/policy0/freqdomain_cpus:0 1 2 3
> /sys/devices/system/cpu/cpufreq/policy0/scaling_governor:ondemand
> /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq:2834000
> /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies:283=
4000
> 2000000
> /sys/devices/system/cpu/cpufreq/policy0/related_cpus:0 1 2 3
> /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq:2000000
> /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed:<unsupported>
> grep: /sys/devices/system/cpu/cpufreq/policy0/stats/reset: Access denied
> /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:   From  :    T=
o
> /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:         :
> 2834000   2000000
> /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2834000:
>       0        80
> /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2000000:
>      80         0
> /sys/devices/system/cpu/cpufreq/policy0/stats/total_trans:160
> /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2834000 397
> /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2000000 68525
> /sys/devices/system/cpu/cpufreq/policy0/affected_cpus:0 1 2 3
> /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq:2834000
> /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_transition_latency:160000
> /sys/devices/system/cpu/cpufreq/policy0/scaling_driver:acpi-cpufreq
> /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq:2000000
> /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq:2000000
> /sys/devices/system/cpu/cpufreq/policy0/bios_limit:2834000
>
> =D1=87=D1=82, 30 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 13:53, R=
afael J. Wysocki <rafael@kernel.org>:
> >
> > On Thu, Apr 30, 2026 at 12:40=E2=80=AFPM Rafael J. Wysocki <rafael@kern=
el.org> wrote:
> > >
> > > On Wed, Apr 29, 2026 at 11:17=E2=80=AFPM Evgeny Sagatov
> > > <evgeny.sagatov@gmail.com> wrote:
> > > >
> > > > The PC froze when I pressed the power button.
> > >
> > > Well, we need to dig more I guess.
> > >
> > > > grep -r . /sys/devices/system/cpu/cpufreq/
> > > > /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us:240
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq:2000000
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors=
:performance
> > > > schedutil
> > > > /sys/devices/system/cpu/cpufreq/policy0/freqdomain_cpus:0 1 2 3
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor:schedutil
> > > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq:2834000
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequenci=
es:2834000
> > > > 2000000
> > > > /sys/devices/system/cpu/cpufreq/policy0/related_cpus:0 1 2 3
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq:1999759
> > >
> > > This kind of calls for some investigation.  It should not be less tha=
n
> > > scaling_min_freq, even though this looks like a rounding error.
> > >
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed:<unsupport=
ed>
> > > > grep: /sys/devices/system/cpu/cpufreq/policy0/stats/reset: =D0=9E=
=D1=82=D0=BA=D0=B0=D0=B7=D0=B0=D0=BD=D0=BE =D0=B2 =D0=B4=D0=BE=D1=81=D1=82=
=D1=83=D0=BF=D0=B5
> > > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:   From  =
:    To
> > > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:         =
:
> > > > 2834000   2000000
> > > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2834000=
:
> > > >       0       844
> > > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2000000=
:
> > > >     843         0
> > > > /sys/devices/system/cpu/cpufreq/policy0/stats/total_trans:1687
> > > > /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2834000=
 1164
> > > > /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2000000=
 14130
> > > > /sys/devices/system/cpu/cpufreq/policy0/affected_cpus:0 1 2 3
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq:2834000
> > > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_transition_latency:=
160000
> > > > /sys/devices/system/cpu/cpufreq/policy0/scaling_driver:acpi-cpufreq
> > > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq:2000000
> > > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq:1999759
> > > > /sys/devices/system/cpu/cpufreq/policy0/bios_limit:2834000
> > >
> > > So with the same patch applied (because I think that the one-policy
> > > configuration is suitable for this platform), please capture the
> > > output of
> > >
> > > grep -r . /sys/devices/system/cpu/cpufreq/
> >
> > Actually, the step above isn't necessary.
> >
> > > switch over to the ondemand governor,
> >
> > It is better to reset the cpufreq statistics after switching over to
> > ondemand by writing 1 to
> >
> > /sys/devices/system/cpu/cpufreq/policy0/stats/reset
> >
> > as root.  Then, wait for some time and capture the output of
> >
> > grep -r . /sys/devices/system/cpu/cpufreq/
> >
> > just once.
> >
> > > wait for some time, capture the
> > > output of the above command again and send both.
> > >
> > > Also, please send the output of
> > >
> > > grep . /sys/firmware/acpi/interrupts/sci*
> > >
> > > acquired after doing all of the above.
> > >
> > > You may as well check again if the power button works after switching
> > > to ondemand.
