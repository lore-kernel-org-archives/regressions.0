Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEC67F48C
	for <regressions@lists.linux.dev>; Wed, 19 Jun 2024 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718793759; cv=none; b=VgwUYhsgh0l38PgLep6zy0qdHJixA+IDS+RRAydoFEUuRbF3LsKqDGhhX1capHCY4lgXJ1ex2CNSslH+ATuMb2nQlx/G+ePlwGzh7rMwtb60vAnuUvT3I7QJuM0XeWO5wiVlVjOQkfrilXA3155JX8Dozvv+X9v2Celtmy3tZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718793759; c=relaxed/simple;
	bh=OH4j8K0eAER0yzFR+JWb3wfzjQkXj5AVKQoulvr5dpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ059KXwlENxYxLADbFn7Nx+fAr6AGnKo0DBu2jgRwZWEWUTfCpDh07P4c8+AOy15mVF1fsvaDA/vLhAklKRUgpQSZucjwzXgOaX9KjCAN1vQfGPplsuoYHybiehEObxDRoyC6Q1P0H3UDNB5BVAWYUb9bRhdqIquheDQDVcD8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV6A4LPJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV6A4LPJ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so66714881fa.3
        for <regressions@lists.linux.dev>; Wed, 19 Jun 2024 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718793756; x=1719398556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytdGjGo0KSXMtOisu6BpBfldVzFpmCfYA0zu/R+JQKg=;
        b=WV6A4LPJ3z+s+8TeocuD70Q4C6jks/WZsL2VmXhJDwEwtGUaEewmVyCyHM+CKlNUwO
         3x5CwaderX0Phr3yRokq9h87QgJGjo3R3RxWFm7Swgo8F5xkaQq6j50QkwEQkshcvj7Y
         L7W0SewhwoBzzNHYPZk8eSB3POt88gKsudeo7XPyBGOtOh39UOsmu2naL1/MD3MLKlsr
         r6cpQbEpVgA/Lgf5uwrDadfX4EeHR2GQoDV8nQT4twWSIsxMFHaDxvoA4GG2LUO6XZla
         x4aLc4F840r72MO9AtWMSDHVMqPx07miK+gXhgrC4OfmQAijpuB7LJ+Iqg8cwMLQnPIa
         isSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718793756; x=1719398556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytdGjGo0KSXMtOisu6BpBfldVzFpmCfYA0zu/R+JQKg=;
        b=SpTCHsZpnPwTOADIjZFUmAzKYWHV0UgHAt99ePoFH2sOrzydVy2TkcBGa73IvUA7fq
         XG93DTbVwEZJ42zcX/v/r7ZuD7upGAqeMhrRyTr7tIUj5gJzOQofmgDchSqJg0KSQNXk
         QLRaMrfmHgrXoCEPLCf5F+ZTMUafCoRfjYpuUamM4tkOiBZdtx4XRP2BIXDR5Yx+jLMJ
         99imEvnrryEsiV2kPacxvX7eXhSqMCSknJ9T9XRqFiQCRNAA/8AVG2OA6LcLhOvUm2Fs
         h6HfSbq0rUjG0NlEnMd+wJjQTwPtOicq8KLizCKFi46XAnY8u/ReHp6heKb974vMfTdO
         KyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO/1mRiSBP87q92swR2u4jeiExZwcOaLsP/blcTulRf+nbN/Pl6wQEQqa6hm2BlcMnH4xDZT8WNIYY7m+YSnkUw0Q98dlXDYLU1yg=
X-Gm-Message-State: AOJu0YxPz0fugFWf6rAWTAI4uC98uC1UNTLvOLojB8arFg6PZM8BN5YZ
	SrI/JL5Lj+pdgTCEmYQMIdjgy6lj1nYDtcBncZTR0IM9kHn1O8YdtdRnVrwMOTA40mCjl2VJStl
	DXcbZlDnRyP+Zz46Mw7yn/92i6OyWSeCl664=
X-Google-Smtp-Source: AGHT+IHizWCLJBVqkpMdTL/7gDJs+2m1dqzDpctk/052EPRcJ501DymTi7m4cUMUPe446g68hjRydPkMddzEEwoP6K4=
X-Received: by 2002:a2e:7e0b:0:b0:2ec:2508:f370 with SMTP id
 38308e7fff4ca-2ec3cfe1cb4mr12648381fa.51.1718793756074; Wed, 19 Jun 2024
 03:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE4VaREzY+a2PvQJYJbfh8DwB4OP7kucZG-e28H22xyWob1w_A@mail.gmail.com>
 <5b79732b-087c-411f-a477-9b837566673e@leemhuis.info> <20240527183139.42b6123c@rorschach.local.home>
 <CAE4VaRHaijpV1CC9Jo_Lg4tNQb_+=LTHwygOp5Bm2z5ErVzeow@mail.gmail.com>
 <20240528144743.149e351b@rorschach.local.home> <CAE4VaRE3_MYVt+=BGs+WVCmKUiQv0VSKE2NT+JmUPKG0UF+Juw@mail.gmail.com>
 <20240529144757.79d09eeb@rorschach.local.home> <20240529154824.2db8133a@rorschach.local.home>
 <CAE4VaRGRwsp+KuEWtsUCxjEtgv1FO+_Ey1-A9xr-o+chaUeteg@mail.gmail.com>
 <20240530095953.0020dff9@rorschach.local.home> <CAE4VaRGYoa_CAtttifVzmkdm4vW05WtoCwOrcH7=rSUVeD6n5g@mail.gmail.com>
 <ceb24cb7-dbb0-48b0-9de2-9557f3e310b5@leemhuis.info> <20240612115612.2e5f4b34@rorschach.local.home>
 <CAE4VaRFwdxNuUWb=S+itDLZf1rOZx9px+xoLWCi+hdUaWJwj6Q@mail.gmail.com> <20240618105239.1feda53a@rorschach.local.home>
In-Reply-To: <20240618105239.1feda53a@rorschach.local.home>
From: =?UTF-8?B?SWxra2EgTmF1bGFww6TDpA==?= <digirigawa@gmail.com>
Date: Wed, 19 Jun 2024 13:41:59 +0300
Message-ID: <CAE4VaRFuZWEBEoNfApQL8SuUDxod9FcWhgzP1joTzDecf74B+Q@mail.gmail.com>
Subject: Re: Bug in Kernel 6.8.x, 6.9.x Causing Trace/Panic During Shutdown/Reboot
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

disabled  CONFIG_FORCE_NR_CPUS option for 6.9.5 but the trace + panic
still exists. So that one didn't help. I've also been bisecting the
trace but have not finished it yet as the last half dozen builds
produced non-bootable kernels. Anyway, I will continue it soon(ish)
when I have a bit more free time.

--Ilkka

On Tue, Jun 18, 2024 at 5:52=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Thu, 13 Jun 2024 10:32:24 +0300
> Ilkka Naulap=C3=A4=C3=A4 <digirigawa@gmail.com> wrote:
>
> > ok, so if you don't have any idea where this bug is after those debug
> > patches, I'll try to find some time to bisect it as a last resort.
> > Stay tuned.
>
> FYI,
>
> I just debugged a strange crash that was caused by my config having
> something leftover from your config. Specifically, that was:
>
> CONFIG_FORCE_NR_CPUS
>
> Do you get any warning about nr cpus not matching at boot up?
>
> Regardless, can you disable that and see if you still get the same
> crash.
>
> Thanks,
>
> -- Steve
