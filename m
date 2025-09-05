Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A682741C3
	for <regressions@lists.linux.dev>; Fri,  5 Sep 2025 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094664; cv=none; b=TIts6n/4O5lkZ+fRJrsMyOga/nvBnEGegNfLrjzR7cpcgbyvMbqrAD64Pr8FeNoFPxfPBg1p0k4VI+Jh0jGHkIBM79mYRX/o+7T1+p+RRKDMFy1QFh5P/JK735cCFBCBtucoydLFrb8euA9/HtDByZYtlvB10z+uYKrc8nsaX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094664; c=relaxed/simple;
	bh=xnZs4CJraYZQ5wDbYLO6uLnEPPN/QIdzXCOFwkslhQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9Bm8FOI0X9Wc2LSXgAW5Vb7pfXJJn5FbOQje3Qqtep3Bj4qDX2IkSZaDORqvebOsogel8CdkeXNWzHA6T8skIKR4aDbectHfnm0PgG5JmvftoBSRlRZpWXS5zaJ/YSqei7B5+rD+G9vvW5vts5r0q1g2kTbCIK3wdJ5ieDAMpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QTxen2cQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QTxen2cQ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f720ffe34so3150188e87.1
        for <regressions@lists.linux.dev>; Fri, 05 Sep 2025 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757094661; x=1757699461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaXyfPMqwoi89bLGQQm9R1wibinvU7q12XwB+QMftqw=;
        b=QTxen2cQtXcta4f5gO4T5f3+Wzl2l0lhgTG1YnD5Qai2/Vg1CxXKzqF2PEyQWpiNMT
         c8Go0Iw2A6YGddhJ/yaAgUJ+2p5kVx8FOAbeuvkgGocfIoqfsR9ZtvZFwEhih5hFcDr8
         b4ogcZ0m+nTMAyzM9c3JSzVuCOEpP1EScX2Q3vZfxqds+yOFDe947+gy5L0G/Z5Pwiel
         WZ35uxCPFduKufMSGl0331ITfMsifrbP8IcpQcXzbajFMEQMRwkIF2j2G+Uha30sMcR9
         gTZXJBFsrGqMJfLfYUTYiBEuU7FREgNlLQyGdcpyTb/D8IrWuhCxhW7xQvfS8zYN6WV7
         +wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757094661; x=1757699461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaXyfPMqwoi89bLGQQm9R1wibinvU7q12XwB+QMftqw=;
        b=ED7+7vvSiLIWY5tYxG9+QZ1sO61rUThBTKsw7u/XRYzONSywZfNXTWRmKrhbIrdMmL
         jBe8seluWbgk826qLPoxtrRJlLvcKOYVsm7qkoizVvkQEDQyp1FXNJL2+oelIWYK8qQT
         gdf9wxJwsewhflNZDdriTqJdRlsiGcDwl3TQ187htY9Aizxr75eSZAjzQXehfcKiCuYZ
         wv9E/CFumh2Ty8nMn0f+9olmt2TaywQ3NyDhGY+e9bHtUKR37JLI+DOvjnoKl05Q7PZ6
         y63m+aM4Lc0r+oo3GHXKaNF17T3frQn19dMHa/jd7zb27OSDxmW3K2+vRqY920rbreXU
         IIog==
X-Forwarded-Encrypted: i=1; AJvYcCWT3vT+tD6ix3K1u/13je9QW3ipjDvN4TupzN3z7RuDyAKm960kGjYKJ7ExJmOp3DwtHBQ91qCT3hCicw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeSJ17cEE1xUGKM4LaRV0mxo6dDIrIAiJo2ngXnBNSWziZk5/9
	HFMAsEHapS8zxUg+S3aAYwAv125j+ag1u3xPbPiRlQoI/+7wFum3xOdAl/4ESPZYKTkGhIlZvdz
	11//Zxc30YcsVrfoBhYN3P9T7wGT5h/9e9at134I=
X-Gm-Gg: ASbGncuHVKkqCq//VpzJg+7wsgS35pLxZwN4NFchxGhvE23KQyphVBsvLqZGTrHY+F9
	5jrTrkobRle6izL64GZuhdLXglA0o3Feusq74jM/4IYMvsggeenJKU7T8DGtQr97aIeS9I4+sMl
	RukHE/vmYQy0Aec3Vl3zMJBHtckj7Ztc2kGEt06cQQVPIc7smvgY+TOkbP8eSiHxI0ndiFVPGC2
	x5w/AMbet2kYlIcby1y4Ou54oEqVyBw4F/6cByBwtU=
X-Google-Smtp-Source: AGHT+IHovfJi9UxsADA1y41PVTn87JQTAj3Hx1c4SPMGqx4uQRvjNmPj9yRmM3NVbenXyWcNvhGxjH9edA0XcuveD74=
X-Received: by 2002:a05:6512:b8f:b0:55f:4ac2:a59a with SMTP id
 2adb3069b0e04-560995d4d53mr1317878e87.22.1757094660686; Fri, 05 Sep 2025
 10:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
In-Reply-To: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 5 Sep 2025 10:50:48 -0700
X-Gm-Features: Ac12FXzVJdbZI6etdAi_p7uTw8KZ7iah-8DwGxTzPcTMM_M3HAoZ1BASAyToy4g
Message-ID: <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com>
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

On Fri, Sep 5, 2025 at 6:21=E2=80=AFAM Naresh Kamboju <naresh.kamboju@linar=
o.org> wrote:
>
> Kernel warnings and a panic were observed on Juno-r2 while running
> LTP controllers (cgroup_fj_stress.sh) on the Linux next-20250904 with
> SCHED_PROXY_EXEC=3Dy enabled build.
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> First seen on next-20250904
> Bad: next-20250904
> Good: next-20250822
>
> Test regression: next-20250904 juno-r2 cgroup_fj_stress.sh kernel panic
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thank you for the testing and the report here!

> Juno-r2:
>  * LTP controllers
>    * cgroup_fj_stress.sh
>
> Test crash:
> cgroup_fj_stress_net_cls_1_200_one:
> [  365.917504] /usr/local/bin/kirk[402]: cgroup_fj_stress_net_cls_1_200_o=
ne:
> start (command: cgroup_fj_stress.sh net_cls 1 200 one)
> [  374.230110] ------------[ cut here ]------------
> [  374.230132] WARNING: lib/timerqueue.c:55 at
> timerqueue_del+0x68/0x70, CPU#5: swapper/5/0

This looks like we are removing a timer that was already removed from the q=
ueue.

I don't see anything obvious right away in the delta that would clue
me into what's going on, but I'll try to reproduce this.

thanks
-john
