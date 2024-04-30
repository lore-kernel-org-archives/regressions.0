Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2617727
	for <regressions@lists.linux.dev>; Tue, 30 Apr 2024 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473072; cv=none; b=Kt0RsNFZcudIIz6X8vLwkwEvAPTqeOugb52dldnT2TsWkG4TfDVEBwoowFNkwtBfJBZvZcv94oTQiuz8KhPOVj2eZw7uW5Z5w+EBnraMq6DnlZjWXfrbkVwgV6YmXdRUF0pwyBbRElAdSIc1AUA9xo4VRoEI3SubVwn4WSi5tlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473072; c=relaxed/simple;
	bh=fq9kl7HC1onkFs25GDO0h+u78xvNx/nppVe2nqgDwLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=na2CXumxcJ6syADosOWJTOwn04+9WcUCAQGlSZKgmh6ivbHFWOUdOKpU5b8bo2DhK6qSYn+cC4YX0UBs6SfJRXI+tDI6prYwq5h2L1o8tTIAIRzysor69hP7o+1mtijzBrSvZbFW/rZXlv2q5ljovF8i8nuBD+MUWhUPD3DfVEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uX4o+AD0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uX4o+AD0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5727ce5b804so12391a12.0
        for <regressions@lists.linux.dev>; Tue, 30 Apr 2024 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714473068; x=1715077868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwW47iggG3BwAgDVmMpwtAGhvg781bYiNMy8bvB5pCk=;
        b=uX4o+AD0g/plHC4g65F0RS7Ko2SRrPRrgugejgzhC+c4xQ2XuDiSCT9e71HRe7QP5a
         Inp9nO51DK71c11x1sDYC7Vtrj11USE/ZqG71FGOwfhVHSIhXejNLLaH5mhUBvVci5Vw
         MzcZBCFj8A4fAD8PdvxbxJeTLXlJIdFUvKVgx964A2gBsGB45WVglr85T6h55LZcBDiA
         hJ2Sv5E4LeZoNY+63nS3xucqJUcxugR0eU6RU/REofTz7sZ8A4RQZlJmV9VtLTDhDjpU
         2QFym9pOWwxIzWXe/ENMFv6eVGg2HMITp9aolWTAfm9dO3wE8k3VceXj/hPBsHa89GP4
         aCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473068; x=1715077868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwW47iggG3BwAgDVmMpwtAGhvg781bYiNMy8bvB5pCk=;
        b=BLJCStRo4GChcizq8QADoKBFEXEDtBmPP2emvJy4itHXZfZMpZA0+m0GFv1cgDxnpp
         0rrerNY8DiXHC/5MtEQ4Vk4E1Eo+0C0c1XId3ccEYI8Xt3wDApoCN9zAaGUZqIKKqdqt
         p5ZkP1oBoWFoe0zFN8z1Ykrf+wsga+B/FBKTh2lr1lnLz+gYQBCWtvBtxFPw6Rjntv6w
         mjLJ2M7LNMxOI2k7l1z38ns/WgH3FbAhMMbvIC0Mj+SAK5IKG0waZrGl9IEA9K8upgDm
         5a8dpcQI2Kzph15BEWg3LWF+adnH6mRHB2mHgbzf4lsnD0YMGtrPh+4R+qdsIRGZo6ZP
         bcSw==
X-Forwarded-Encrypted: i=1; AJvYcCVr2wiCZ0c63xw/hzYoH6Jme7ZiEGZsqFvikM450Jl9uj6l0hELvpu75kC5TY03hAuTgjidJbyLWq1G5P5Lv3xHhlQArJkmxHABEzc=
X-Gm-Message-State: AOJu0YwqZ8lpywc0cq4ZlSOV4Bh958a4CjiV27wfPqLJoJ1uzfKgZaaO
	NYP8LoQ62YgJXzpJCgSpiFlD2gAd83x1fFGqUU/IHY0IODc2lMNWp3nj8H53UbYqGUMGFd/vFu4
	KtvjbbCvblObXNZaX4KbaE5IMty76W/S1wsCL
X-Google-Smtp-Source: AGHT+IECkVB2ejmKLRzAYSu/bpt95HY9NGBzyzWpXw0MNO2BKj2tO+28C3FXFOwKzHJZrv12YBLZM3JWoyd5mni2jbE=
X-Received: by 2002:a05:6402:174c:b0:572:7d63:d7ee with SMTP id
 v12-20020a056402174c00b005727d63d7eemr153109edx.4.1714473067350; Tue, 30 Apr
 2024 03:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429221706.1492418-1-naresh.kamboju@linaro.org> <CAKa-r6vJjeYqGZERRr=B4ykLf-efPRY3h=HU3y3QxazwZ_cMAg@mail.gmail.com>
In-Reply-To: <CAKa-r6vJjeYqGZERRr=B4ykLf-efPRY3h=HU3y3QxazwZ_cMAg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 30 Apr 2024 12:30:56 +0200
Message-ID: <CANn89iJ4go0oXSjRaxkdxsUFPCK8kcb8YPt+0d7isK9ZsFrpww@mail.gmail.com>
Subject: Re: selftests: tc-testing: tdc.sh: WARNING: at kernel/locking/lockdep.c:1226
 lockdep_register_key
To: Davide Caratti <dcaratti@redhat.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, jhs@mojatatu.com, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, cpaasch@apple.com, pabeni@redhat.com, xmu@redhat.com, 
	maxim@isovalent.com, anders.roxell@linaro.org, dan.carpenter@linaro.org, 
	arnd@arndb.de, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 12:17=E2=80=AFPM Davide Caratti <dcaratti@redhat.co=
m> wrote:
>
> hello,
>
> On Tue, Apr 30, 2024 at 12:17=E2=80=AFAM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > While running selftests: tc-testing: tdc.sh the following kernel warnin=
gs,
> > kernel Bug, kernel oops and kernel panic noticed with Linux next-202404=
29
> > tag kernel as per the available data.
> >
> > This build config is from kselftest merge config[1].
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > selftests: tc-testing: tdc.sh log and crash log
>
> the problem is created by [1]. I think that at least we need to guard
> against failures to allocate sch->cpu_bstats and sch->cpu_qstats,
> otherwise the dynamic key is registered but never unregistered (though
> the key is freed  in the error path of of qdisc_alloc() ). But there
> might be also something else; however, I can reproduce some similar
> splat, will follow-up on the list.
>
> sorry for the noise,
> --
> davide
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/c=
ommit/?id=3Daf0cb3fa3f9ed258d14abab0152e28a0f9593084
>

I just had  5 or 6 syzbot reports about this issue.

I tested the following fix.

diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index 31dfd6c7405b01e22fe1b8c80944e2bed7d30ddc..d3f6006b563ccd8827b7af362ce=
9dceaa78f8841
100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -982,6 +982,7 @@ struct Qdisc *qdisc_alloc(struct netdev_queue *dev_queu=
e,

        return sch;
 errout1:
+       lockdep_unregister_key(&sch->root_lock_key);
        kfree(sch);
 errout:
        return ERR_PTR(err);
