Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2EC37DE81
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776974875; cv=pass; b=BlXaXn/l9Y+e/5tMZGQguhMdN2a2miKTPwd9WaNrCFvOZ4zOcrPxN5WRBQoWyTwgVR68MywYeZqc7wDxcAdWn4f1x+5cxXnKv/ouzIAPNPuEjxs40SB0X8nngn0KvjDlvqftMh+whX3ssu9JkYAcbEisQkqWNM9TkM1o1MNUf2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776974875; c=relaxed/simple;
	bh=ptennygPTeYOh3hyjkB0bFPt3NW80AGcTawmPCnKvGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTTw9tRzqucSHe+Hq/GeWc2gFStSYnFm8Eicw5z21eWK3arZXRowJS+olWuBcpZgYBoi+Y2GunWpASvTIwfSUeGEkRtqifoKBpCFz1OhcKrEYJjEhlbAcnmRSAiR7/JAdkHAnvw58yWzw/wiFzsRIJRXFQHnXY5btZ5eiTZYRLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbKju0+7; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbKju0+7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bad54961385so67790166b.2
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 13:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776974872; cv=none;
        d=google.com; s=arc-20240605;
        b=PG+iAAI2zUD/uM84EgHBhUtj5Dlmlb4qiK/WY6IVMdg10V5jRmiG2NP/Jd4gLFV8qf
         4HWMTRV+o+GcQiaAeAP3eiFj6NM+TjUFX/N2YauhmpylouYNmcT5/WtJ4ezUCX8RT67q
         NluI7WcXFRWH57ywWFWf17MxYp9hezloiOfgd2nQ9VufbMelLih16gE1DX0Hzacu5iMD
         BbYOrXCX9zycbCXPZHY4uEREyt8EuNlm92923jRknicOL5S1BeGQpZu+cXbjprzYfCny
         NlOZH9YmcgVrTbnoBpZ/iIAuvstGCA7KW3Xmq3TGlIx3QXXVhcmdSMYDH8zMREjG20ln
         rf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jGCi+RvGdziSzpVZyx3Aax7NdvsO8nn7n5GmUEwoKVI=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=WVraJI4n8CwHGFlsGItnspF6/h8Kkbht+6z3+/hn8SXkNCr6eEkhdz6iOyMJMfUrb3
         c1eS8Q1cxpQNqmv3FC6J/zhjrIDlk2rkVcoKIBsuWqKAvsLnY+kY/JhFSEraMEXiS91y
         N7NP/8RZWzZK1nsLVOMKn50whPimWNQWMbZv7s44BDXfre5BjG1Cs5iZYr7EetnZZLGz
         MhQszjuRdR7H1qEt/MePIHar3SV7otCXt/0JE/VH9s+TGwZYA7XUryYPHydntisV59r/
         MtoTlRdfZTy0Dt8PPVzgJQaq1eS3s0w3YO0kKyzxhuJ3e/iqTAcKsrK5UWMTYEUd2QEg
         WEiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776974872; x=1777579672; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGCi+RvGdziSzpVZyx3Aax7NdvsO8nn7n5GmUEwoKVI=;
        b=RbKju0+7OLpKRWq8pCc+RSV22pI/eN1VInMFNIu9EO3z6G7ocVfzSs/pp4wnykaHP2
         65mJA0rEFn/ZaOQI9Sdym0gyNYcOVv2tLKU2W18h7e/gAK8gVfov4I8T88PJ9g0qZTxH
         3PBdzZgv8PWMmCodPq8hQ8QqgH/s8ykKIiDYUNIVQDY4qMhBI+k/jR7AAtoX/PZQ8B5i
         RPBNmXzfLu0o6Rv1eqp1iI0Bdygcy9i9PeUs4ywXOn+iFVHp642quOtmrrLxDhzP4s5L
         RkRzJv1OtHua08A154+LndmDsiDeqcb1hsJbAhTG4ai0OAaznqTT6Y4O668DQ9zsv7fX
         Nhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974872; x=1777579672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jGCi+RvGdziSzpVZyx3Aax7NdvsO8nn7n5GmUEwoKVI=;
        b=lzCSDYwxUMqUeqbEyJ1e/MPWYlg474p8zUWZmUnqslBNaSdyegGa7J64AX7hKzCdT7
         XTTtCxhRz9NAOOVpyyLaXIfLdxtp9rKh2n7k+o2pmp+NH4JSaSvqBInjfxf0RvHRYFB5
         Ii4OV2MevJles8r2Kr/5s4QiUMrTAYY/NfI2RXqxEqTcnrBNHntWs+4xkNibc5GzzpKa
         jgRm1QCczrMto7mfKTxHCXmzMT2ODu1dmsR7wInEdjqMnhMy+54FCSJe8dI1PrWQTjNN
         oQBUr4aMl9lbi0OZ2Sx/8TIvKDB6XhfGoQCT/ww2J07ElbNIPHfPSP+dZzgvBZTTXsDL
         Rkkw==
X-Gm-Message-State: AOJu0Yybha79eRdGbIQbZJcVvkRv3jqcelbb4v8wDlm5dTfQnj9k7PzX
	2RGz73dLcbl84T2N4LfFwxr+MCrIgTZ+AGs9T2vJY1LVzEo8H+OEgVnGdhhVWvysBfw/HWCNpUo
	d0BsLx983PCBXkH8SWiK7MfsxvRg3AVw=
X-Gm-Gg: AeBDievw90GXTit7vv84Zj9twPVnvLBSHXWHMc5Axs7s7sL+ulECKIsejFRPlQdBqhG
	qKeCD/XPgRWQ85R8rtgpQkFK9CETwuIgsfyfa5sdJ0QbRkdu68n51qMyyxPgUR3qp2cQ2/QtKMY
	yOluHgyzaJ49kt74qgANtGJwa3kYSpNFll1w/u6fISTIrpkBS+XdPVtbFDsbno4sBNsOc14fGFx
	uR7pVWy5lB2zGwWhIce/H4Su0PGjgj7ZqkEQupd41NIwL/jC5r5cJ6mTnUiAol5SyeLV48TQzB4
	0vtv+JsBO5eWHYn93w==
X-Received: by 2002:a17:907:86a3:b0:ba9:8b0b:986e with SMTP id
 a640c23a62f3a-ba98b0b9b8cmr720628866b.11.1776974872326; Thu, 23 Apr 2026
 13:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <4738258.LvFx2qVVIh@rafael.j.wysocki>
 <CAGAxtY1eVP5y6GTDoLM2xVDt2KF7fCKxDx0Mo9QO3afTA54GgQ@mail.gmail.com> <5996744.DvuYhMxLoT@rafael.j.wysocki>
In-Reply-To: <5996744.DvuYhMxLoT@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Thu, 23 Apr 2026 23:07:39 +0300
X-Gm-Features: AQROBzDh9sKKaRFRcBX9_7bAxxWy2J3ptQH43gEM6DvJhs_D_E8sAVyP6ZqTR60
Message-ID: <CAGAxtY2vstAuswt0b6sS_0Gi1=S6fd6cetskjfOEKnWqmMZBiw@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch doesn't change anything. The PC remains frozen when
pressing the power button.

=D1=87=D1=82, 23 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:21, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Thursday, April 23, 2026 4:51:36 PM CEST Evgeny Sagatov wrote:
> > I removed the previous patch and installed the new one in kernel 7.0.0.
> > schedutil - complete freeze, no messages in the log
> > performance - log message when pressing power button, doesn't reboot
> > ondemand - log message when pressing power button, doesn't reboot
> >
> > Log: apr 23 17:40:04 srv kernel: acpi-button LNXPWRBN:00: ACPI button e=
vent
>
> There clearly is some unexpected interaction between the schedutil govern=
or
> (or generally what happens in cpufreq when it is used) and the ACPI power
> button handling.  It looks like some memory gets corrupted when schedutil
> runs and it is then tripped over by the power button handling code.
>
> Kind of on a hunch, please see if the appended schedutil patch (either wi=
th
> or without the previous patch applied) makes any difference.
>
> ---
>  kernel/sched/cpufreq_schedutil.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -158,7 +158,7 @@ unsigned long get_capacity_ref_freq(stru
>         if (freq)
>                 return freq;
>
> -       if (arch_scale_freq_invariant())
> +       if (arch_scale_freq_invariant() || policy->cur >=3D policy->cpuin=
fo.max_freq)
>                 return policy->cpuinfo.max_freq;
>
>         /*
>
>
>
