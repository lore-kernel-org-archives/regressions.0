Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D7E21255E
	for <regressions@lists.linux.dev>; Sat,  6 Sep 2025 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757148254; cv=none; b=Yt2pDPNzg+GQzsXs5VRyCeWCK+GrXfSd66oqfbAWhwVom6Tqkh97CmqXBNNIcbN8568eDP86BxrY7bcyXDgvjXPYRBpw7LkCU9gzlWYyZE0q4MF5yhUsH2WvoS8S/DGhuDvNGmdI0xlQGZgrsKGZXTfMOG0/80WcP6MQNnKgNRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757148254; c=relaxed/simple;
	bh=ioBMi4/eFSTZR/gwR4miHwSmbvpNL7DYm9ThLt7uKdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhLgQNarBE1ThvVNhiy0KeDNNZtw9ERGps5f5n1iyojXR+SQ2yz1Ns2Qgjck4FARzIGV/Kg4xSzn1hu27y8EeiIQExBJNRGk1CxDOhetYC88fty05xpkagqm2wBsea5tl/S0+BpWKW6ACsf6WjWNyqpr8giBsAYsc/LENADFi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1b8r4UA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1b8r4UA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-324e6daaa39so2816736a91.0
        for <regressions@lists.linux.dev>; Sat, 06 Sep 2025 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757148252; x=1757753052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ew5mxc5caN5gcDtxTwu7IwmhCpTzTpkvaeyIZ+j1bkQ=;
        b=H1b8r4UAJeQDU0onQn0RQEHhLBEtYKf9Nml7lFcPM55xCCYeafJZK3vNsV+qbjBlLU
         L5MWZz2brr0HQCpuvhISFfE3j16P+rjc/mQqVLh0QNg/kyxNLq9M+4chvA2Uw3EgqUn3
         piaakZXJoigCJjo7QHHvFhfgyK5griNjvX66j9uGV7gHJgKxBETG4RKyZKLkmbDSJ9om
         N5T69YbhkR4nc7mTTV09sLGkvyYGRFUQu2ELhUakkGtDIAr0bpUPlMILYGuCbe56aubY
         1Ah6pmG8P++Aa1hvIdcqQ1P1tlwbCi6haFcHCSzCCEI+OdbaEiFjYNTddLarKzoQDKFM
         HWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757148252; x=1757753052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ew5mxc5caN5gcDtxTwu7IwmhCpTzTpkvaeyIZ+j1bkQ=;
        b=WZZdECMNv+eX1oTmkVlhY7vlV962sPszAW3nLH9OZtm4XbSiPFsmRCig5Rx51+nGqG
         KKh9ob4zm4iFfmHaRDHCsqGI9+ZSHtgNtZrcfyaxTTtOoTQSBVr2DZGpQ8Ms/NTeYuAO
         9EhmBl1rUJ4Ju6V/u8Ajdf8ybVUt6NPm5WDmpmAX3Qe/Uvi95uQSaCcaTNGYGl8QIbJi
         ynozEMGFP91fvJXXJi3SwyU9TZ+p8ZKiJ/Gkq1LYvLC6G5/PqFLvSIczz9vV0MGZsXIB
         M2QUFmYehXU/nyMZg3QC9wY9BrP854IIkwJoSOTv6oMvhlJAqEvtLv/HxC7zwIS3/R9/
         6/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWkPosZ8y+OV4HV0dst0q0CVRtjeKwpmfKx3hpBB+M3JoHWO8H1eL6jfCwacd4E6CZSCBi10xzQJf+2WQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9A/Vpk2CfjbR9nNuSI+LuactSctCy//X2D00sfsXlv29HsCN+
	HQjozkdGAUGcVk+DL3dqNuXkSJBNdJ3mwKvKDyvbPn1LwrPKHEN5r+yUjFVCq+df4PnMYH9vjlY
	GYNDTxxAtMr6RUu4/6pk/Op3tG0TkeBvL7O9gJH6yGA==
X-Gm-Gg: ASbGncuf8IYCPCW1aaoMY1NANJ4MIseGP9FdRIhiNn2hAcVAiUuVnRRJ+XMK/7ld9Hi
	HNlA8wSvoH3uTGmweIuS1YNsjRVbdfAEaKBrnxqpk9BYVh/6KmPMYhWgQCNc1BT7a3J0ZYecG7g
	I50VjtgkPKQIyG8G8DIVwqznAO1ehFOicAGXR38lwhewt1gYizJTx83exzQ8UAKbXp5K7Tlm3Ta
	6V1PZunCSnSn3zRa+zTpHDpOPdi2rT7FIjvX9oQEoRV28vW+g==
X-Google-Smtp-Source: AGHT+IFWY6ZjZ54pmmCwZjzjcEHYHuEaPv0XvwL3Eflpm/wFl4W2+BYv03gcg0aI3CC8OEM/T3fJ+UI2CYpLLpEbOeM=
X-Received: by 2002:a17:90b:3852:b0:329:e729:b2a1 with SMTP id
 98e67ed59e1d1-32d440d9ff0mr2516690a91.35.1757148252335; Sat, 06 Sep 2025
 01:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
 <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com> <CANDhNCrJYMcK+dak8ASX6uoVFkNSHMf3Bn1kOXDtqNqFb7LkJQ@mail.gmail.com>
In-Reply-To: <CANDhNCrJYMcK+dak8ASX6uoVFkNSHMf3Bn1kOXDtqNqFb7LkJQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 6 Sep 2025 14:14:00 +0530
X-Gm-Features: Ac12FXyDB-xmFe72rMp4oqEaC6ssFIEBHl2K-2wenWmXDkTJZrm_JyQxx_K7VTs
Message-ID: <CA+G9fYuhDU=5b0my6yMy+ni=K_SFCRxncWJFvj0DVuLftTWYUA@mail.gmail.com>
Subject: Re: arm64/juno-r2: Kernel panic in cgroup_fj_stress.sh on next-20250904
To: John Stultz <jstultz@google.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Cgroups <cgroups@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Sept 2025 at 02:50, John Stultz <jstultz@google.com> wrote:
>
> On Fri, Sep 5, 2025 at 10:50=E2=80=AFAM John Stultz <jstultz@google.com> =
wrote:
> >
> > On Fri, Sep 5, 2025 at 6:21=E2=80=AFAM Naresh Kamboju <naresh.kamboju@l=
inaro.org> wrote:
> > >
> > > Kernel warnings and a panic were observed on Juno-r2 while running
> > > LTP controllers (cgroup_fj_stress.sh) on the Linux next-20250904 with
> > > SCHED_PROXY_EXEC=3Dy enabled build.
> > >
> > > Regression Analysis:
> > > - New regression? yes
> > > - Reproducibility? yes
> > >
> > > First seen on next-20250904
> > > Bad: next-20250904
> > > Good: next-20250822
> > >
> > > Test regression: next-20250904 juno-r2 cgroup_fj_stress.sh kernel pan=
ic
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Thank you for the testing and the report here!
> >
> > > Juno-r2:
> > >  * LTP controllers
> > >    * cgroup_fj_stress.sh
> > >
> > > Test crash:
> > > cgroup_fj_stress_net_cls_1_200_one:
> > > [  365.917504] /usr/local/bin/kirk[402]: cgroup_fj_stress_net_cls_1_2=
00_one:
> > > start (command: cgroup_fj_stress.sh net_cls 1 200 one)
> > > [  374.230110] ------------[ cut here ]------------
> > > [  374.230132] WARNING: lib/timerqueue.c:55 at
> > > timerqueue_del+0x68/0x70, CPU#5: swapper/5/0
> >
> > This looks like we are removing a timer that was already removed from t=
he queue.
> >
> > I don't see anything obvious right away in the delta that would clue
> > me into what's going on, but I'll try to reproduce this.
>
> So far I've not been able to reproduce this in my environment.  If you
> are able to reproduce this easily, could you try enabling
> CONFIG_DEBUG_OBJECTS_TIMERS to see if it shows anything?

I have been running in CI loop for these tests to reproduce and did not
find this again.

I will add this extra Kconfig CONFIG_DEBUG_OBJECTS_TIMERS
and re-run to reproduce this reported regression.

- Naresh

>
> thanks
> -john
