Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD6129E6A
	for <regressions@lists.linux.dev>; Tue, 30 Apr 2024 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714472280; cv=none; b=CVo77Y4LIwtZN6Q4/xSjFEdQSKDu0wbbj8DrDEsnSyOMPpAkn7aRfVX8/cd6jO2XOfCXgHbMb34ojogUORozgumeCwg7xAQoVRzu1fdwW58tvRKgGD7B47XxXqgWA/R0oy0X9kkPRI/POtXWZSZQb02w8L8dQnNt51NSOfC0luc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714472280; c=relaxed/simple;
	bh=DxCBfW2ZX60itdmD+i2ZLg8FWHGDeeOaWCry5xKcra0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoKa0ivu1cuq0JcKnDA+LagnWep9Ht71s3ubmqwvxPlZiHoRzRQxu8tKfjfr+qSdXEH4+0c++NKcDOLn6iEcP3gop4cEneVW3kmkIOR3BTijTJF9TISsDcS2kW79BzaN6Z7e8ArcRFguOUNptpECVxpmrFRD85GlzLEHJXDgo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I62ml88T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I62ml88T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714472277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WgfcDzbL6BdRnbQ/LMHjtoVFL3IiamXBZRn2Dk0E7Y=;
	b=I62ml88Tv9nAuJi7LeyxvalppdZZT5piDZ92KcykD1ULCoCXNPpml9UHxqxwTPlUP9aQgA
	BkSoQCHCrI2ZmNLkRmWxq3UuOK8di799Xf5/xMmBuABcnwScQ8aNlnYmXrzBV1yAzz2HoK
	iDD1c0vYd65vdFnMZQwzAd686GV1AP0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-vNU_fAJhMMGW1pxEV9z5lQ-1; Tue, 30 Apr 2024 06:17:54 -0400
X-MC-Unique: vNU_fAJhMMGW1pxEV9z5lQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a5e1e7bab9so6799566a91.2
        for <regressions@lists.linux.dev>; Tue, 30 Apr 2024 03:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714472273; x=1715077073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WgfcDzbL6BdRnbQ/LMHjtoVFL3IiamXBZRn2Dk0E7Y=;
        b=BmCY8BwAMdNqKUEtY3QUMvNdzU7s3hC1l4u5HvztVpK6c0XJSnD0YMbJlwWCdO7N2Y
         N+Nz8PaZQS+lrc3zEhNpJ1+XgKpehVZZxDBItjA7Xk7Pr1rElByUZ9CNJvgPW1YqUEWd
         sX6nqIMVc4LqBUgV3IviAAHC3F3q2VDCSOcpVCVfWOAsxuupz0jd3ZPPUIBNZ5WLOc84
         NmpoSVbd0vLx0wX3N1eEemA0I5vdi5OH2aGAVqpjScYNy3thDqMygC9oiSHEn/b6tuND
         HbKnMPaF3AlNStE4Kld4V29W1QfAdLWfu/gNoG0zXWo7DScaevqqlaxBxJXr+s6xGfZp
         X1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV01KJ8s545HAc/BgEvAKQZ2hRFHnmExQ8FnqYXfmWslRbg0di9B8/xjaWDtX0f6IWr82jC3nXsQaj1D39djNkOGeXdOYgRWtWVLLo=
X-Gm-Message-State: AOJu0YxLF8q/Okti6ynLbqXROfqb6szVhB3D6vx4G4uvLAF/VY12/oL8
	AOPcIeaMo/r63cbHquSIg3dCxsPJO0B/Mj65gO6LiWjiilcIOJnP3PstwZEqXM72TsLPObOv1xk
	q2esi14e6EZVHMiATzUH4o+EpNuuZEBbp8ev0U5WXgoX62hi0w4kt6DZvPzfp6vm2sDBkLkm3/Y
	plb11ieVygPuh1t5YtH1l6AYpqHTZOk3KGgmg=
X-Received: by 2002:a17:90b:3d86:b0:2af:4f4e:79a7 with SMTP id pq6-20020a17090b3d8600b002af4f4e79a7mr12470163pjb.30.1714472272809;
        Tue, 30 Apr 2024 03:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWSpkNXoLaxHPhUhC5NZ72tcHc7cFhFDuXAR7cTPWqMf81MdK6/Q7OPe/FNtSys3J7tuhnJJXuDUF4sBjb72Q=
X-Received: by 2002:a17:90b:3d86:b0:2af:4f4e:79a7 with SMTP id
 pq6-20020a17090b3d8600b002af4f4e79a7mr12470138pjb.30.1714472272243; Tue, 30
 Apr 2024 03:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429221706.1492418-1-naresh.kamboju@linaro.org>
In-Reply-To: <20240429221706.1492418-1-naresh.kamboju@linaro.org>
From: Davide Caratti <dcaratti@redhat.com>
Date: Tue, 30 Apr 2024 12:17:41 +0200
Message-ID: <CAKa-r6vJjeYqGZERRr=B4ykLf-efPRY3h=HU3y3QxazwZ_cMAg@mail.gmail.com>
Subject: Re: selftests: tc-testing: tdc.sh: WARNING: at kernel/locking/lockdep.c:1226
 lockdep_register_key
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, jhs@mojatatu.com, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, cpaasch@apple.com, 
	pabeni@redhat.com, xmu@redhat.com, maxim@isovalent.com, edumazet@google.com, 
	anders.roxell@linaro.org, dan.carpenter@linaro.org, arnd@arndb.de, 
	Linux Kernel Functional Testing <lkft@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello,

On Tue, Apr 30, 2024 at 12:17=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> While running selftests: tc-testing: tdc.sh the following kernel warnings=
,
> kernel Bug, kernel oops and kernel panic noticed with Linux next-20240429
> tag kernel as per the available data.
>
> This build config is from kselftest merge config[1].
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> selftests: tc-testing: tdc.sh log and crash log

the problem is created by [1]. I think that at least we need to guard
against failures to allocate sch->cpu_bstats and sch->cpu_qstats,
otherwise the dynamic key is registered but never unregistered (though
the key is freed  in the error path of of qdisc_alloc() ). But there
might be also something else; however, I can reproduce some similar
splat, will follow-up on the list.

sorry for the noise,
--=20
davide

[1] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/com=
mit/?id=3Daf0cb3fa3f9ed258d14abab0152e28a0f9593084

