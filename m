Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D5A3ACA65
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549316; cv=pass; b=F2DtmH2rZ5tGaVWxSHX7tIh0HUCVL4nPpRYZwnAABwc8NEym0rCG9ReVHsaQsjacqTjY4cTs172tYyeD30JeNWM1K9SQAZIBwMzoLtLC+NLaIEL3FAUbcIOIt0a7bpzo3TAsFGLxS2+vUdjWmLeXVZOaY5tA0F+zT3FU7agFfhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549316; c=relaxed/simple;
	bh=/5pzMFPyyu5B1ZrMTUDdPrpWXVCAGEdpGUv3o/pBFuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2ueW3MO2CZpX51kKkASdkyex6LEVTUs2tUtgVMmO7h437z+Kem6jbf0pkWRpe3rG7Vsoekl18otqra9caP/jCD9p63a7JXlQMtExe/xbm4i3jWqkr1U7TH+7g/hvbclxMtEFyEx62h7bhHXlZDPBLwxGaJ3hS29G0J/rGobb6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2lzSeK/; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2lzSeK/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso3203667a12.0
        for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 04:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777549313; cv=none;
        d=google.com; s=arc-20240605;
        b=htr1Sb3zsFoDzdzPOe0GUTfXmceciJ2V6x6keX0Bm/ZnTyv966pJwgOZvkkbtq7qgG
         Qc8dyKBhSkweXjTMoJu+cd1A0jECWxeWB94i3qB8YKnCOVqgO2jBYLuWxFnxgXchujXQ
         kDpjQQoqOHPSCAgy955rB1vnT72Daec4wvhywr1NU2AXNwUq79cwow1GLcFTl2Yz/q4p
         hzvyFkcwAjGIzbKdj/V2CrVwswJefmo98ezqGnlLsW72iNC1zCPSQUPRrVDzBTqIhCfk
         sfz/aqObGViLwbiLeZtRgGyJ2O2s8AtZCMYz1cpnixuxoZum7c2mpxIyGBlgEC/cz3iZ
         xZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DazGWBgk03LG4+OcyJaAsBQ8XTHJgJmb+GxkgUCMjvA=;
        fh=aNFrgwd+2g2qwBUxxhwD6FiioojO5VxAS5dtacpUOlg=;
        b=J4HUNmF+SMpzJK/RY3G3YwyTMcwTBYTbNXXcnn3oAZxoX1Ntayf+iuOuQd3rJWfLSS
         mP2m78PRldIY4jukOuYBC/hVF7R5ZOLdzK9psNVIWsrvbW6AA0fX/OBviCFM0Ucn87C5
         lfpYPbsyxa+478iHt3MYHAVJkICyS476+N8A7kLc0O0mq3ZVd9ei8nmgu/iAHDq+9yA6
         ytd83aoYfeW1uQwjUd/JM4G8DBZM9ElCIcGXgApABFG/4IdF0nhDFzD7elOMyNW3zIUw
         MBfghdkAVZ07jtNyPs14GVWNganV1VjCqjG1huYwY9H2rlrcHp12gJkLB18Tly3w3x7s
         pwpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549313; x=1778154113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DazGWBgk03LG4+OcyJaAsBQ8XTHJgJmb+GxkgUCMjvA=;
        b=c2lzSeK/spdxd8Bx2dkx9Tw5br6d4cWOuevh9YkO9rASiuOicjFzzjR3Z4IXHmW6nF
         Hb0mPh35SLb9PW2i34VB3QZy2JLgryjDxQWCqjAYdvAbFad8kSZIa3TCKtR4PL/00HTM
         r4wi+sTYAR+s2F/Ws/9mVJRnWOp0usTwhANlgd9EvDKEySSgUXGVfugg2is9Tzg1IY4m
         0DKZdAk/QNdnrlkfnIzFVCO2rL3Y3nE2kpIffdldQA+xdgIrbFCbVDl8vlIClYwxfEdq
         hIRK+qZhO5T8u3OqfbLUBsYKR526AlANjb8WLPpWPoJ6L92VfMhfWlO5+IkAHBpCapcl
         v+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549313; x=1778154113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DazGWBgk03LG4+OcyJaAsBQ8XTHJgJmb+GxkgUCMjvA=;
        b=Vk8u65oHwOLZ1JZVIJdg73kaOJU6x5J36bZFZBbsRLxY805sXMwnblfjP9ERZioHJo
         7ADNLPBgfm9ua6bvdwjLqyN/ViesIoVhRKQ4T5Fob5ZeVCFnb2o31O/72NkzOxnWRkWV
         rfnR/tE2YhqJmix+O61JsGKkV+DuDLI9chR6Nnb3V7lkGi0KG2Xy/WjS+rm2lpGCTMbU
         6VPwLPVPSehB3qhzkN2ceZKnd/6exSRKXJkFZKa9Pzf4uTZG3ojrp4+zkI2rb8WEYNzK
         /chAUUaURVGO8YGSrGqOJxYSYR+ToorhK3S4hvTphs1Csu6GOL1tx35XhC28e7G/aqx8
         wbaw==
X-Gm-Message-State: AOJu0YzpaMyf8/lJZr3L9GlBT5q6YcF2grfm8aZZnriweFGUJBcT/LH7
	5SK3NmnX+u+tf6RJz69xSLc9RlnYwSHgWqR5V8xApHObHtkI4G4xHTssEdFOZK8GeUHVteGsWRD
	n01cHlaQDsybA0yHs4OVSZs7dc4YQSVg=
X-Gm-Gg: AeBDieteZ+bLZqj4fa46icV7HaFUP5EdkK2daqiQD/w/RaX2r/dHDo2+GU3PIS9nwLa
	+VdRssjHH17aR1RBqQYcvr4L2qHXQX93cLr8CGHU3WxoKwshbf1+CwpcL/L+Mt8JhUdkxcWeNaR
	Nwgb2Z+XqjpAYV8ZpQ0gU/KWV2ai9tHiUnvPf3cJJln9qGia9KZhIhELAP/65Ay6Tiyyk94eg/Y
	3GsafLmDyxoSFK+O5RVC94Zw3Kk3WEKqd1h37oU44CiroQBNv+IuM6Tv5p7F9pRHFuqh0GfjgbE
	jCTN+UjmVCwUou5Lsw==
X-Received: by 2002:a17:907:9307:b0:ba6:4eea:c1e1 with SMTP id
 a640c23a62f3a-bbb98f6d53emr115233366b.17.1777549313324; Thu, 30 Apr 2026
 04:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <CAGAxtY2SEkx7OgMgM5ypA8qsBN0h6pcs111VjnhD-5ZGq7Je6Q@mail.gmail.com>
 <CAJZ5v0ikAeu7cW9K6sfKYbbsVK51GOsFrX-qv3KJ7cVr-gRHew@mail.gmail.com>
 <6010375.DvuYhMxLoT@rafael.j.wysocki> <CAGAxtY2N-=3taOBCTFZzEmm4NqJ-KhtsWq0fNts_tn3nAxpkTA@mail.gmail.com>
 <CAJZ5v0j2MKGRFRRVT4rFuzr2OwJg7ufAfDKUS0rgAsg-EBH6Kg@mail.gmail.com> <CAJZ5v0jhjXap6gSZ5unR7cE+CQQPk1tDnAXLm9rkGsC2AnZTew@mail.gmail.com>
In-Reply-To: <CAJZ5v0jhjXap6gSZ5unR7cE+CQQPk1tDnAXLm9rkGsC2AnZTew@mail.gmail.com>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Thu, 30 Apr 2026 14:41:41 +0300
X-Gm-Features: AVHnY4JKI49zCihyCRiDCHor3psH662OA-YRmGfRM8cz3gfxerDwOZjw7eShbjI
Message-ID: <CAGAxtY3h4sEphqKL-jiSn4p0NT9mdZtOFrVxW7CDo22XdL56iw@mail.gmail.com>
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

I noticed that for powersave mode, I'm getting the following values:
cat /proc/cpuinfo | grep MHz
cpu MHz         : 2798.689
cpu MHz         : 1999.659
cpu MHz         : 1999.797
cpu MHz         : 2741.103
Also, there's now no difference in the single-core benchmark between
schedutil, ondemand, powersave and performance modes. The benchmark
always gives a very high result.
This wasn't the case before; the modes had different performance levels.

I switched to ondemand, did a reset and waited a few minutes:
grep -r . /sys/devices/system/cpu/cpufreq/
/sys/devices/system/cpu/cpufreq/ondemand/up_threshold:95
/sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load:0
/sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor:1
/sys/devices/system/cpu/cpufreq/ondemand/powersave_bias:0
/sys/devices/system/cpu/cpufreq/ondemand/sampling_rate:8000
/sys/devices/system/cpu/cpufreq/ondemand/io_is_busy:1
/sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors:ondeman=
d
performance schedutil
/sys/devices/system/cpu/cpufreq/policy0/freqdomain_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_governor:ondemand
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
      0        80
/sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2000000:
     80         0
/sys/devices/system/cpu/cpufreq/policy0/stats/total_trans:160
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2834000 397
/sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2000000 68525
/sys/devices/system/cpu/cpufreq/policy0/affected_cpus:0 1 2 3
/sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq:2834000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_transition_latency:160000
/sys/devices/system/cpu/cpufreq/policy0/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq:2000000
/sys/devices/system/cpu/cpufreq/policy0/bios_limit:2834000

=D1=87=D1=82, 30 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 13:53, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Thu, Apr 30, 2026 at 12:40=E2=80=AFPM Rafael J. Wysocki <rafael@kernel=
.org> wrote:
> >
> > On Wed, Apr 29, 2026 at 11:17=E2=80=AFPM Evgeny Sagatov
> > <evgeny.sagatov@gmail.com> wrote:
> > >
> > > The PC froze when I pressed the power button.
> >
> > Well, we need to dig more I guess.
> >
> > > grep -r . /sys/devices/system/cpu/cpufreq/
> > > /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us:240
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq:2000000
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors:p=
erformance
> > > schedutil
> > > /sys/devices/system/cpu/cpufreq/policy0/freqdomain_cpus:0 1 2 3
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor:schedutil
> > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq:2834000
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies=
:2834000
> > > 2000000
> > > /sys/devices/system/cpu/cpufreq/policy0/related_cpus:0 1 2 3
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq:1999759
> >
> > This kind of calls for some investigation.  It should not be less than
> > scaling_min_freq, even though this looks like a rounding error.
> >
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed:<unsupported=
>
> > > grep: /sys/devices/system/cpu/cpufreq/policy0/stats/reset: =D0=9E=D1=
=82=D0=BA=D0=B0=D0=B7=D0=B0=D0=BD=D0=BE =D0=B2 =D0=B4=D0=BE=D1=81=D1=82=D1=
=83=D0=BF=D0=B5
> > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:   From  : =
   To
> > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:         :
> > > 2834000   2000000
> > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2834000:
> > >       0       844
> > > /sys/devices/system/cpu/cpufreq/policy0/stats/trans_table:  2000000:
> > >     843         0
> > > /sys/devices/system/cpu/cpufreq/policy0/stats/total_trans:1687
> > > /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2834000 1=
164
> > > /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:2000000 1=
4130
> > > /sys/devices/system/cpu/cpufreq/policy0/affected_cpus:0 1 2 3
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq:2834000
> > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_transition_latency:16=
0000
> > > /sys/devices/system/cpu/cpufreq/policy0/scaling_driver:acpi-cpufreq
> > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq:2000000
> > > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq:1999759
> > > /sys/devices/system/cpu/cpufreq/policy0/bios_limit:2834000
> >
> > So with the same patch applied (because I think that the one-policy
> > configuration is suitable for this platform), please capture the
> > output of
> >
> > grep -r . /sys/devices/system/cpu/cpufreq/
>
> Actually, the step above isn't necessary.
>
> > switch over to the ondemand governor,
>
> It is better to reset the cpufreq statistics after switching over to
> ondemand by writing 1 to
>
> /sys/devices/system/cpu/cpufreq/policy0/stats/reset
>
> as root.  Then, wait for some time and capture the output of
>
> grep -r . /sys/devices/system/cpu/cpufreq/
>
> just once.
>
> > wait for some time, capture the
> > output of the above command again and send both.
> >
> > Also, please send the output of
> >
> > grep . /sys/firmware/acpi/interrupts/sci*
> >
> > acquired after doing all of the above.
> >
> > You may as well check again if the power button works after switching
> > to ondemand.
