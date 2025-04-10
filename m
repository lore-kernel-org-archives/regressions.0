Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5E01E378C
	for <regressions@lists.linux.dev>; Thu, 10 Apr 2025 02:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744252934; cv=none; b=jTAw6CfVyIJHBMQgayCoc6IEjojorevKhMel9tndcNQIhYupO6QRaIsFMJ8+5I1ktgkaZhwqWcc4GWzoX1aqNtds3ynD463mgiGpBnlpxTuS5kZ/TOPnQUTI9k/LjcSW9gawaJvlMwjSCFc2ZuT6N8h0/N73DhjJHbw4RG609E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744252934; c=relaxed/simple;
	bh=uzpEyGdabx5JjzfCp4OlyCFtnJOIrXjZ2hMoNizjz+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHH4r/Zuu/kyLxN5M6eSGGt+MC9yMHWoMl8LiVJp7hqFeLFHxVy3gHJCYjiAtKysdOzuOjv0fM+9LQzbZqGyIMc3WnRVcThyQX1Rby+5PLe32C+sU3d6+5ZIoZBZwq/+uFPbbxb+9ogNP8zsoww2tD+8N1MEu0EuGovKkpJJyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5fH7sN4; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5fH7sN4"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476a304a8edso2751021cf.3
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 19:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744252932; x=1744857732; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/x2Xsd5edjMoVZFqaYJpv38CJTMje6c+RsPYlISzoc=;
        b=W5fH7sN4vFcK2Am3yKg4JLsY7bHx3varT0eoGqbaVR3an9pvwTB+GoTUKUmfnmHM5T
         8XNFevpX1WXcvrg00t3C2XKHxoPD/b9sWH3lTndBvpZTKxez1qlBcm/E5F82nrEgbWsf
         VRDIoiXmU2E+tJz4qL/nepEZidOd77BK3D00y3xUwcgwNqYSgNbhqMedHFucR07M8QA6
         tVGYcLNmQHj+62aDbN5scoHKsaJsglN11pTwOkxj8CgyxilCUGsKXl3dm5rdfNX4eW8M
         xRJ7MJ136vNixt6U/DO9p+/zLZ2yyc9RUJWE7DRpavlWuW7Weg3WQZfsiH8TIaVdZMWE
         YgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744252932; x=1744857732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/x2Xsd5edjMoVZFqaYJpv38CJTMje6c+RsPYlISzoc=;
        b=unEyZQ5Afw8/0WeFSH16Ar6HRFMagboPKMhAGaxM/d94m2kQrdUrWmCYdwB7dJZP4S
         Z37KD94TsSKYXx3Fqv3nHE43Gblol4OF5KBflZEP4GX3tS40jlY8wD6SqAuaFP+ZujUi
         IwKQjrwCIF6MZ4rMCEcFb9KsIG7OrfYA7JPied4+QpooO5eOd2VpzR0x8hkmOVet/ooQ
         KnLfXIGcCd3aAaclI0heXJkECRb1pJR9aKiKj85GlsHDI0SVMO+DvD7AI8YB5LhaG7gC
         YVv1q9b3DJ9avAugzCxyEkuaPwz1pChOzQv3lFhdXqk04uOjdFb4MH1Wbw8qN6CuC8st
         7fkA==
X-Forwarded-Encrypted: i=1; AJvYcCV2dk7J1ld492NuuvD7U+BSeyjTTpOg8X/xKC+FKewpF/zC+dKwo0jZdPYNV2v9Jaa19UlN/+jC6y1RWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxknQat0RdfzxmAqw8yJ/GLHUR/Oqhags39yg/epZ5b5O7+R/CB
	gJ8DMLxUFhgtzZh3hfj6H//p40iEhMB2FctaIgtJFkHbRn09n7kZXi+wUvd3+Lz84K3BO2febpL
	+ka5liKecZPfQHaWtNEhSrI/iRAk=
X-Gm-Gg: ASbGncu/yx/Cl8o6KHhyNEszzxrbqvRiLEVifxsE1tFmcG5xDTeqL5vBganiGTDee+F
	wfKiKAd35yXCrFhaThv3/EoJYMPAPJtq9KpUq6NXeB3n3IhW2SWhkh9FbI7fNID2bqGVXmLi1Uy
	tbDSumKp/Z+rlvqG+Dql9CfMM=
X-Google-Smtp-Source: AGHT+IHz5R6cOC58Fkd5pVvU+w1ZTlH9yIVnIz1iAk+FJR1rUZx/FtTKr6fJRKH8xNOIF2Sf0sTD6f5iP/JRAmPwsTQ=
X-Received: by 2002:ac8:5f0f:0:b0:472:1d98:c6df with SMTP id
 d75a77b69052e-4796cd2aa8bmr19465471cf.52.1744252932086; Wed, 09 Apr 2025
 19:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z_U_LN0AtH_n4YtE@sultan-box.localdomain> <Z_VTRspvmOUfrawh@linaro.org>
 <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
 <CAB8ipk_Ayqmh=Ch2aH2c+i-q+qdiQ317VBH1kOHYN=R9dt6LOw@mail.gmail.com>
 <Z_cjv0EJ45NShYOp@sultan-box.localdomain> <CAB8ipk8WOh5_XvRYJrPi6b6wf8G4=zjoFRWpXk3viv3gkHCn1g@mail.gmail.com>
 <Z_coNmh-CabcfIWD@sultan-box.localdomain> <CAB8ipk8AAFFtV3OA4S=g9X9AXsC4Ntr911DLLRkhgQtvMvXAvg@mail.gmail.com>
 <Z_cracmQRfB8hF06@sultan-box.localdomain> <CAB8ipk9FdC2X78B4sAnne5=ZS=ZrhZdUKYREEZZk7RQLH8LAwA@mail.gmail.com>
 <Z_cuA3lcewKhj4Rz@sultan-box.localdomain>
In-Reply-To: <Z_cuA3lcewKhj4Rz@sultan-box.localdomain>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 10 Apr 2025 10:42:00 +0800
X-Gm-Features: ATxdqUH6HB_nCoXp4_9Ml7plwFBWa5bbfpokZ87aOt78eaE4LJ16yaeWnTXA4Qk
Message-ID: <CAB8ipk-5vSLHkW9h26Zduvn4t7CG3dNKS2d5Xb1f9MXtgX2J4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:33=E2=80=AFAM Sultan Alsawaf <sultan@kerneltoast=
.com> wrote:
>
> On Thu, Apr 10, 2025 at 10:30:45AM +0800, Xuewen Yan wrote:
> > On Thu, Apr 10, 2025 at 10:22=E2=80=AFAM Sultan Alsawaf <sultan@kernelt=
oast.com> wrote:
> > >
> > > On Thu, Apr 10, 2025 at 10:13:04AM +0800, Xuewen Yan wrote:
> > > > On Thu, Apr 10, 2025 at 10:09=E2=80=AFAM Sultan Alsawaf <sultan@ker=
neltoast.com> wrote:
> > > > >
> > > > > On Thu, Apr 10, 2025 at 10:06:41AM +0800, Xuewen Yan wrote:
> > > > > > On Thu, Apr 10, 2025 at 9:49=E2=80=AFAM Sultan Alsawaf <sultan@=
kerneltoast.com> wrote:
> > > > > > >
> > > > > > > On Wed, Apr 09, 2025 at 07:48:05PM +0800, Xuewen Yan wrote:
> > > > > > > > Or can we modify it as follows?
> > > > > > > >
> > > > > > > > -->8--
> > > > > > > >
> > > > > > > > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sche=
d/cpufreq_schedutil.c
> > > > > > > > index 1a19d69b91ed..0e8d3b92ffe7 100644
> > > > > > > > --- a/kernel/sched/cpufreq_schedutil.c
> > > > > > > > +++ b/kernel/sched/cpufreq_schedutil.c
> > > > > > > > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(stru=
ct
> > > > > > > > sugov_policy *sg_policy, u64 time)
> > > > > > > >
> > > > > > > >         if (unlikely(sg_policy->limits_changed)) {
> > > > > > > >                 sg_policy->limits_changed =3D false;
> > > > > > > > -               sg_policy->need_freq_update =3D
> > > > > > > > cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > > > > > > > +               sg_policy->need_freq_update =3D true;
> > > > > > > >                 return true;
> > > > > > > >         }
> > > > > > > >
> > > > > > > > @@ -95,11 +95,15 @@ static bool sugov_should_update_freq(st=
ruct
> > > > > > > > sugov_policy *sg_policy, u64 time)
> > > > > > > >  static bool sugov_update_next_freq(struct sugov_policy *sg=
_policy, u64 time,
> > > > > > > >                                    unsigned int next_freq)
> > > > > > > >  {
> > > > > > > > -       if (sg_policy->need_freq_update)
> > > > > > > > +       if (sg_policy->need_freq_update) {
> > > > > > > >                 sg_policy->need_freq_update =3D false;
> > > > > > > > -       else if (sg_policy->next_freq =3D=3D next_freq)
> > > > > > > > -               return false;
> > > > > > > > +               if (cpufreq_driver_test_flags(CPUFREQ_NEED_=
UPDATE_LIMITS))
> > > > > > > > +                       goto change;
> > > > > > > > +       }
> > > > > > > >
> > > > > > > > +       if (sg_policy->next_freq =3D=3D next_freq)
> > > > > > > > +               return false;
> >
> > I have deleted the else.
>
> Yes, but your change causes a regression by recreating part of the proble=
m
> solved in 8e461a1cb43d6 ("cpufreq: schedutil: Fix superfluous updates cau=
sed by
> need_freq_update").

Hi, Sultan,

Did I miss anything?

@@ -95,11 +95,15 @@ static bool sugov_should_update_freq(struct
sugov_policy *sg_policy, u64 time)
 static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64 tim=
e,
                                   unsigned int next_freq)
 {
-       if (sg_policy->need_freq_update)
+       if (sg_policy->need_freq_update) {
                sg_policy->need_freq_update =3D false;
-       else if (sg_policy->next_freq =3D=3D next_freq)
-               return false;
+               if (cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS))
+                       goto change;
+       }

+       if (sg_policy->next_freq =3D=3D next_freq)
+               return false;
+change:
        sg_policy->next_freq =3D next_freq;
        sg_policy->last_freq_update_time =3D time;

---
The patch set the need_freq_update to be false Unconditionally.
Is there another issue ?

Thanks=EF=BC=81

>
> Sultan
