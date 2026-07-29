Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF0931326F
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292589; cv=none; b=dr8XkDc9ZyQvSZH6HQSh9nau26EeQKhz5hAje7nlPdfb3IW8cDu0OKh/VUWJtW6bsaFpc0EgzF49ZsntwoftJ7qNYWio4a41Ufres8M2udPG2qvGNfu2/A71sj5oUdcXom17RioQMOH0w3+yl6/8lt6OjXCm9NxoXpykQPbYxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292589; c=relaxed/simple;
	bh=aMtYYfhYERME9KhULUnK6J5JCQwQ2EthKtQBUzr6fBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBqvU27Pm80dMBTvCsB0ZCuYu5afwhR9l4uF4tE7XnzKQn+4LftzLu3HfdUkUCBPu49ZJscal/l3xnt/wkk6hQOjEmpangl1K07AUUP/2btROMIWcSYcoWmIk44UUbHbgIQ8b2ofwPmSZniwaEasLGeYm53IastipJjz3iTYdEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iINSordA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iINSordA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47362928f65so412716f8f.2
        for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 19:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785292587; x=1785897387; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMtYYfhYERME9KhULUnK6J5JCQwQ2EthKtQBUzr6fBw=;
        b=iINSordA8f0okV/ix14L0BaOJRDV+rIsBNZa7MsQKD0HKKgsh+UouwKbT/HRUmMH28
         jjdMRcTxokpX5kot2vj1F5F+hG66vd9qtBrozo1bbAoD4lrno1yuY7Y5P6m5Wn2CvAxf
         GU/dY7w10PrY/H/7W6qRiDuOTpNHhnweVnH/yzS2Qkq8SlF5suGlbKyE3VvaaO4pij3l
         7Etv4NZQ4Fu+fyxm3RvzLimjt61Uf9iMICpkfhqL1vxmyKNwvtqLEiAlnZbioU/lDW6P
         +Y7owPpSzAwd63KrgPbGwRaPSUr7HPE5ljHYXI4cPD+lkp3/VTAspg37yFYykpfH+5cy
         opyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292587; x=1785897387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMtYYfhYERME9KhULUnK6J5JCQwQ2EthKtQBUzr6fBw=;
        b=ad4i2GBoFBueCV57lkC7TbwKwhyO6F19GBhzv5N/qE+RUrHt2PW+P95FS71xnOIcVA
         qA48k5SwGS8Bpcx+laRYKdYeHXKX+PQmwRhfRNo2BBQAcmqat7pRyR9Ou63BoFdq1Q2A
         +1HNHZ8h5XVuxRqdpmeRDm9D7HYxAlQZ+hhKnne/Ls8S/+mNRqKdjygW5WskAeA5OqDx
         mQh/8keQLHVQBllte9LaDo1Yyj6W+QtuQZxhM4cr16xqd4tpUa0T4bEiXemODBodQbP0
         KK1+2SQ0U3psrSu9mZpwGgDtkQGV1WF78Qj52B6WeIuaV30I2GLJQV7qV2vng1+X6l7P
         tXtw==
X-Forwarded-Encrypted: i=1; AHgh+RpilP+zGFyMoCscEiJO3AwgUYbVJcsJoB+VF8Y43TE2lzyy3K2qcNdc4/AcSNFDQ/Fig0fYslvOzMgzDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5nqdltLbPPL6FccCW3MK72QJ8ZLaCE7v8JuiRNnLp4cwPOmAk
	w8STt4UAiamoVSB6TrasQNtn83C1BR4cXUC8496AFXoZJTfu2ng9C8ec
X-Gm-Gg: AR+sD101/BP9UZUvRWIivaKNjccIbMLyyBJUaBtdGXHw4Y+Jhs5gDRSY/tYzmlnssRl
	vV1wVulJvzqCFsdIhvTgAN6aARPUApOWYu6LH8Q2Bjs97jTMKt5k1W8w8EngdYFaI84GnI+JOkX
	UH0EbPRQxqOI+Qhf3O/auAe2+uwO/SEcTvNd7sJcdEsbnjFg4RU+BJGx992SR1JSyuK/yD9XPd8
	nZc9IHR5n1t/eMn2guJreeo+cW3HxQkEBKCP+Lnjoa11B4CoNdiC1GgaIusuQugMcvmDoRI7osB
	sy1eQ+w3k7pS1jv4DNElqpfsAIx6gL9n/QHfNR0Tzz+M0ZDWhGM8TD+XNzPNNMPf8MDl1mAc7rJ
	EshSdxUowr3INnRBtDdxzxKAVwieEbRaoOifsAW3EyfDQt7ArhNaYk2BWO3knNpskQYnYhEH20S
	dDriTtcdmW0lwEHoN9FdjMESC0lKH9xJKCdOi1CGvu1YMTMl5kuZJqg71eVKqLJrvhw0Cg0Iww
X-Received: by 2002:a05:6000:22c4:b0:47f:9266:7cbf with SMTP id ffacd0b85a97d-47fb1ed729fmr5347599f8f.20.1785292586645;
        Tue, 28 Jul 2026 19:36:26 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f295sm3784213f8f.22.2026.07.28.19.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:36:26 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: christian.loehle@arm.com,
	joseph.salisbury@oracle.com,
	rafael@kernel.org
Cc: rafael.j.wysocki@intel.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [REGRESSION] sched/idle: Sysbench threads regression after f4c31b07b136
Date: Wed, 29 Jul 2026 10:36:15 +0800
Message-ID: <20260729022930.318742-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <774c3a68-6a6b-4e2e-a347-03e36953b750@arm.com>
References: <f5946a8a-43be-49d4-a827-25149112b21f@oracle.com>
 <774c3a68-6a6b-4e2e-a347-03e36953b750@arm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Zhan Xusheng <zhanxusheng1024@gmail.com>=0D

On Tue, Jul 28, 2026 at 09:30:39 +0100, Christian Loehle wrote:=0D
> Interesting, so your guests (no cpuidle) need the tick stopped at every=0D
> idle entry to not regress, i.e. the below?=0D
> Is there anything obvious that shows why that would be? Maybe in the=0D
> hypervisor behaviour?=0D
=0D
I think it lines up with the got_tick heuristic rather than anything=0D
hypervisor-specific in the guest kernel path.=0D
=0D
do_idle() resets got_tick to false at the top of every idle episode and=0D
passes it as stop_tick, so the first idle iteration always calls=0D
idle_call_stop_or_retain_tick(false); tick_nohz_idle_enter() hasn't stopped=
=0D
the tick at that point, so that takes the retain branch. Only after the=0D
tick fires once (got_tick becomes true) does a later iteration stop it.=0D
So with f4c31b the no-driver path leaves the periodic tick armed at the=0D
start of every idle episode, whereas the old code stopped it=0D
unconditionally.=0D
=0D
That also explains the test results: forcing (false) keeps the retain and=0D
still regresses, while (true) / the direct tick_nohz_idle_stop_tick()=0D
restores the old always-stop and recovers.=0D
=0D
The hypervisor is then where the consequence shows up: a guest that leaves=
=0D
its tick running keeps a ~1/HZ timer pending, so the host sees an imminent=
=0D
timer and keeps waking/scheduling the vCPU instead of letting it idle. That=
=0D
is at least consistent with the shapes - the x86 shape at HZ=3D1000 regress=
ed=0D
more (-29%) than the arm shape at HZ=3D250 (-10%), i.e. more retained ticks=
,=0D
more interference. For the no-driver bare halt there is no governor/state=0D
selection that a retained tick could help, so stopping unconditionally is=0D
strictly better.=0D
=0D
Thanks,=0D
Zhan Xusheng=0D
