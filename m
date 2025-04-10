Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B92B1714B7
	for <regressions@lists.linux.dev>; Thu, 10 Apr 2025 02:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744250814; cv=none; b=Mk3XS44zT9E+OQDTHxpPkM1AoExOY+j9dXz0BOlHF+C1Anbw53Pdf65sMUUM72TjVmuZmIGbv4KVui6ps212rMO0uMRPsWA6+LOJga1P5Ih5MQ+MK/BToCRWixOUxTDgN7DhA8eHyKoGwl8wo9BeYEhFCFRujhzIztxoG5WN1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744250814; c=relaxed/simple;
	bh=6aKPcDBjxIk54AoAKfLiANygiBTVJUz4dADL4xOc+ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTU97hACGFQpCPbuh6SWh0vnvJRHqwKeZ1jtGH2hLZNmjYYG/vsxFHGO65Ary1MIqirM07VsdIl1YyvSQK4ahUiNm6mJkoqzIFuRGjkJ3SXWbKYeCTaVgEyZRZoO9UTK8jm60eaiZQI1Gs6ukaPms6DP7rB9VmuKWo9SOTgehXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntNuhjqi; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntNuhjqi"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47690a4ec97so2587291cf.2
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 19:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744250812; x=1744855612; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oznmRH0MRwn5C+Bdh8MND8wsPstvx/A6QgxF4SDozmc=;
        b=ntNuhjqi+AIKMDfkEEqk3Hp/WJq36tGrlzNntxhu0QjdhInxY77ZNVq61wZD2nnlEx
         Mz3eadcWEYipnjjk62bzDVi9rq2awtQ0jvFECQAE3PJF9wQhmOiQWaCD8MUxMWK5+rhd
         ZgTyPMjFC4mdwm2IjOgU6d+T9pLOBiYViJWHypMI7PnJYaQdZas+1fS4bVyHErH4ZUcW
         12ISUBjMb48R8mak0oP/iz2rOobNbHzpB+EVXqc7GnDBC0Xoik18fRbUCzBPu6748+EH
         pv7xpzZl22EOY5ODiIRBiNaG14/UVkXkGeQiEn6U7YyL9N/jSzTwfjR++yJDvzgRrArn
         lVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744250812; x=1744855612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oznmRH0MRwn5C+Bdh8MND8wsPstvx/A6QgxF4SDozmc=;
        b=eEpff4BPy+MHLu0AAIPCWV7CyV5/aKVlaR4GhP18F7/sF1UgF/bghGikcin48scwVY
         6Nzs+eRP1sSkVJ55pnEKWoF4MviX9M7oMp1Q2q1/wXh468Binikn5Ptany8WODavseSl
         paVD6wdQb/8uRH/LeVSG97+cw222wIMEea0TcmpmWqe2020zu9bzUANqLkVIkSLWpQfM
         gkg6Jp9EzujbkLhj8/QeTlyw2EWjc1wCOWX7X1gekdv5ZuqqbbMUo2fpiTYOJsPloBR9
         Y/CUr9OUmj1D5CuDx5YQcn7wwOEXVUq3i3DyNnzmir6TtDEn8obYOR49D/UxZGQvb7Li
         QOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCURpqcQIqQ7KI2sXEFgsOR3nOBW1qLbEIVdsQQQxceMeguqP2VqXrqfxPVrJBwZwSxR9VZaByuOxu+mWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+CPJ3y9qIbNd7amQwCCyPDyTyEZG0ZQS49++rrssfPujUABlA
	RmeMTXPJkqM9X9NZWizYHiq9NBU83z1czqmZmsqoovhV/4wMPrP55n51d35C1/ACKuFNABL3mOd
	4HUOONy9L0kEcV1LWDXiKY1yqlHw=
X-Gm-Gg: ASbGncuI26pnzDtYOBLSGGvd+NDPgJHDkEQmqxB9AnImS2p7iHQrXXnJkLY0pUjyCjB
	0X7QSqMnsPzveW98bMVjoZFOGUb/g7e+KdtNnOxkJVI/OfyiZvkx55ADNDBR/4OFd+8TFU2+dq9
	JtcWqSi2GUpjc2pSB4nqbC5l4=
X-Google-Smtp-Source: AGHT+IE6feir823tk9p04+MQ67tkEvsGFpDhlxE85coCIxK4OgZI1UVSSK2WTf3Psf1vgVvryrvZlJSoAGUwxwPFhA0=
X-Received: by 2002:a05:622a:7d8e:b0:476:a3c8:c78d with SMTP id
 d75a77b69052e-4796cbc7845mr13216021cf.29.1744250812062; Wed, 09 Apr 2025
 19:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241212015734.41241-1-sultan@kerneltoast.com>
 <20241212015734.41241-2-sultan@kerneltoast.com> <Z_Tlc6Qs-tYpxWYb@linaro.org>
 <Z_U_LN0AtH_n4YtE@sultan-box.localdomain> <Z_VTRspvmOUfrawh@linaro.org>
 <CAB8ipk8ARRdR8UPgLqJ3EcAzuE4KNEO=cmLNJLk6thTxdBSHWw@mail.gmail.com>
 <CAB8ipk_Ayqmh=Ch2aH2c+i-q+qdiQ317VBH1kOHYN=R9dt6LOw@mail.gmail.com> <Z_cjv0EJ45NShYOp@sultan-box.localdomain>
In-Reply-To: <Z_cjv0EJ45NShYOp@sultan-box.localdomain>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 10 Apr 2025 10:06:41 +0800
X-Gm-Features: ATxdqUH-TO5SSdUlIRTVuklZTtQs4JbzNell1efpaLSC386_i8obXDuf740Va-4
Message-ID: <CAB8ipk8WOh5_XvRYJrPi6b6wf8G4=zjoFRWpXk3viv3gkHCn1g@mail.gmail.com>
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

On Thu, Apr 10, 2025 at 9:49=E2=80=AFAM Sultan Alsawaf <sultan@kerneltoast.=
com> wrote:
>
> On Wed, Apr 09, 2025 at 07:48:05PM +0800, Xuewen Yan wrote:
> > Or can we modify it as follows?
> >
> > -->8--
> >
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_sc=
hedutil.c
> > index 1a19d69b91ed..0e8d3b92ffe7 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -83,7 +83,7 @@ static bool sugov_should_update_freq(struct
> > sugov_policy *sg_policy, u64 time)
> >
> >         if (unlikely(sg_policy->limits_changed)) {
> >                 sg_policy->limits_changed =3D false;
> > -               sg_policy->need_freq_update =3D
> > cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMITS);
> > +               sg_policy->need_freq_update =3D true;
> >                 return true;
> >         }
> >
> > @@ -95,11 +95,15 @@ static bool sugov_should_update_freq(struct
> > sugov_policy *sg_policy, u64 time)
> >  static bool sugov_update_next_freq(struct sugov_policy *sg_policy, u64=
 time,
> >                                    unsigned int next_freq)
> >  {
> > -       if (sg_policy->need_freq_update)
> > +       if (sg_policy->need_freq_update) {
> >                 sg_policy->need_freq_update =3D false;
> > -       else if (sg_policy->next_freq =3D=3D next_freq)
> > -               return false;
> > +               if (cpufreq_driver_test_flags(CPUFREQ_NEED_UPDATE_LIMIT=
S))
> > +                       goto change;
> > +       }
> >
> > +       if (sg_policy->next_freq =3D=3D next_freq)
> > +               return false;
> > +change:
> >         sg_policy->next_freq =3D next_freq;
> >         sg_policy->last_freq_update_time =3D time;
>
> If CPUFREQ_NEED_UPDATE_LIMITS isn't specified, then there's no need to re=
quest a
> frequency switch from the driver when the current frequency is exactly th=
e same
> as the next frequency.

Yes, the following check would return false:

 +       if (sg_policy->next_freq =3D=3D next_freq)
 +               return false;


>
> Sultan
