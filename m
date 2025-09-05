Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F64427B4E8
	for <regressions@lists.linux.dev>; Fri,  5 Sep 2025 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757107225; cv=none; b=sGZ2+FlXNe5fnUZK7O5acQ19zTb6waTzK71903HF6U9fJJMJE3zt1vNrcZoFM0N/UbQySrQpwAyHjwFv9p+gQz6LEF+AVZ3B03gpXRjJPS6dwe5UoGqPOSyj9p9rLnBUxipL1n38eQ1Q3xpxwnic4fHDK/aGE09RCa7QoBU5330=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757107225; c=relaxed/simple;
	bh=1CyIY4Gge20GP7y0cDU45m2jcj75ZJgT0UYbOpjMvYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2x+M23dtV5fKBZMZo65SfI/s8bw5775TpdSJX/kzcLhL+u6oABiqIICmZFxIytVd41gFlpGtPZjy65OPpCJgrUgUG35ekTemwqm3kK3agEItlAbf9VNpuplR8+/Bc9SRjrTI1uEYV85KzeljWACMgCVXw0F8t+q0DPJ+BDl+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f2nHk78p; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f2nHk78p"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f76277413so3137640e87.3
        for <regressions@lists.linux.dev>; Fri, 05 Sep 2025 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757107222; x=1757712022; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihoNevlLzJDBSuy8DxcqIRmMmQ3q65NAy+tYYX30mhs=;
        b=f2nHk78phHkzepZpjRW3HZbgtXpDuVpDT9WsK0QeFVpJm/gLjcyw6jVVJFtejuOqxA
         f0dHZZWGXcYQPs4grR6/E+oJE4b44YmHYooiWV1H8l14S7kdj86x4BxNeP0VxgBsqdrU
         lb38HSxN6b37dtobqL7WNCegFX/2a7U+LuPpM3AfOau+Pq+EYrJ0xS4oRWT7C4ELWaPG
         WUx7Vpj7+ylY8qb7LgTLkWbHXkp9dnAJyqAAJhTuuy1f0qxBnzU09vTaKeJzx0/5bWIs
         kkfG9I8+KUOchSxmI/cPw0UaHziKKF1s2JYheOHIg0Vr2XoAfwPDSiJzA0/ODf5eRrsr
         f2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757107222; x=1757712022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihoNevlLzJDBSuy8DxcqIRmMmQ3q65NAy+tYYX30mhs=;
        b=tAm21vONPuXbjKzz6Y+P5xMtuw95O8gb3kyQ93kIvgjJ6zHsYZ8WGcIeVmhvk1VDlM
         Nhf47HdDjazMr2cohil+oMFyvkESGvWiTKNBX2tnqiMueffjI3hK8AvMrOtMw3K2VW7f
         s+AuLKBoHIw6EjKDgF9Xx4EAwCQD3y3Y+06lUY81BGZqar0tO4Zl6TSIpuRyyK+mebX1
         MNM80bGb5dt0+bPzT2vEdWkxfqXO18e3GMTchnf7Y0Yhz8XpxHYCiKjLDlAp7Olj4OFk
         telQfgYHc5fZNLr7Fq21CN0z+BTKbSdQi39ipa/YE3whym3hniCUWN8sC65fFdSbKdab
         Nzaw==
X-Forwarded-Encrypted: i=1; AJvYcCXi+gpcLsFQIxtbB9Yk1wZGEhOAPZxwtwOKMT+AaCuZIpYWXwvxJ+qVJtO/rBCT26Y0rnb4EqyZEzajAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMS2lMHP4qCLGT+fekBgY7QQY8deJA+gbg6FXjoPxc906oAmxV
	5a17VXCzThOQBGf0hxYT5epfGeMxJ0wAqV80ZIlGTjUa1ob3Wi9Dzp7jS4ayS+mKmUpgZpnXEHS
	DXfe1jrNz16+t2+tFhp+q6Mih1eSChFJgMEWO+jc=
X-Gm-Gg: ASbGncvDl6CbrwjGVNi13n1ZUili9ZojBQUYI6uELQ3x3kzgwC/aMccEnf3J/7WF83f
	XxbwKPrxvoevag9q2kB4CZvZB3F+ceptP2nXm7AUMyPQQtcHfarZOb3yM0KBt+b9rcAK2UbS5iR
	p8ZvNemTmNtnkAqnELsae/gM87wErHztaj0gM3QZBBuVocQxMNCrrdR6JFHsFi5DLtdtGKpn7Uo
	R+9PF1hWqLlQmfQBQTTPXJiNXWxi6L5LjFYQ7tq2tb8QajAQE5H0A==
X-Google-Smtp-Source: AGHT+IGklKSxmgtyLJoi1vvHN7sLHpD+0Iy8PrXyLbJxGTq/1I6kUc4ziYI23n3kTAxDik0wCpIxXBb5i2BdIOMmD6k=
X-Received: by 2002:a05:6512:3b12:b0:55f:6831:6ee7 with SMTP id
 2adb3069b0e04-562601b5384mr78383e87.21.1757107221283; Fri, 05 Sep 2025
 14:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
 <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com>
In-Reply-To: <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 5 Sep 2025 14:20:09 -0700
X-Gm-Features: Ac12FXyJR8KmvN8T2fwKhwhjrwRXLtrixZllcL7-1u48pK2bWIjS9VPSJc01V20
Message-ID: <CANDhNCrJYMcK+dak8ASX6uoVFkNSHMf3Bn1kOXDtqNqFb7LkJQ@mail.gmail.com>
Subject: Re: arm64/juno-r2: Kernel panic in cgroup_fj_stress.sh on next-20250904
To: Naresh Kamboju <naresh.kamboju@linaro.org>
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

On Fri, Sep 5, 2025 at 10:50=E2=80=AFAM John Stultz <jstultz@google.com> wr=
ote:
>
> On Fri, Sep 5, 2025 at 6:21=E2=80=AFAM Naresh Kamboju <naresh.kamboju@lin=
aro.org> wrote:
> >
> > Kernel warnings and a panic were observed on Juno-r2 while running
> > LTP controllers (cgroup_fj_stress.sh) on the Linux next-20250904 with
> > SCHED_PROXY_EXEC=3Dy enabled build.
> >
> > Regression Analysis:
> > - New regression? yes
> > - Reproducibility? yes
> >
> > First seen on next-20250904
> > Bad: next-20250904
> > Good: next-20250822
> >
> > Test regression: next-20250904 juno-r2 cgroup_fj_stress.sh kernel panic
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Thank you for the testing and the report here!
>
> > Juno-r2:
> >  * LTP controllers
> >    * cgroup_fj_stress.sh
> >
> > Test crash:
> > cgroup_fj_stress_net_cls_1_200_one:
> > [  365.917504] /usr/local/bin/kirk[402]: cgroup_fj_stress_net_cls_1_200=
_one:
> > start (command: cgroup_fj_stress.sh net_cls 1 200 one)
> > [  374.230110] ------------[ cut here ]------------
> > [  374.230132] WARNING: lib/timerqueue.c:55 at
> > timerqueue_del+0x68/0x70, CPU#5: swapper/5/0
>
> This looks like we are removing a timer that was already removed from the=
 queue.
>
> I don't see anything obvious right away in the delta that would clue
> me into what's going on, but I'll try to reproduce this.

So far I've not been able to reproduce this in my environment.  If you
are able to reproduce this easily, could you try enabling
CONFIG_DEBUG_OBJECTS_TIMERS to see if it shows anything?

thanks
-john
