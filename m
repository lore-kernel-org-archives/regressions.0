Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528A414A18
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 18:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360838; cv=pass; b=ikTJHN8M9J+j1PTnj5H9lv6KI/Cn9DlydjKrZNI4Fs/Om/SVR9qdXvVB6XVVm765gzrOXgNQ7gWIEixuAhYeX4+qeA4tfFbAu/RyDhbQxBSFvYu5K3FRW/PdeZPL6Zgkm6ays9eh3u0DR/uXUuClwh3EnRBNAjsj1wb8o45/kQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360838; c=relaxed/simple;
	bh=dr60ISvk84gw7E2mdn+ZAgXT0Fcp3MJN+kcAT8jJdSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwW8LiOeYHtUw7oD5LpUsFk9saT+0Pfg96943gLuQKJhe4vzbBQl81EB30ozIc5FAd8rl8XrVxkSfk2lVrfdHDu/hEl6VvEsmpqvJY35nkQwekqDhHVgxuxczLB5a3vxOJS46wQNGuA5zTcPvMTikcvTu5KiNnTjE9rg6fZ9YQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ+EnwYk; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ+EnwYk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so6214754a12.3
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 11:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783360836; cv=none;
        d=google.com; s=arc-20260327;
        b=b50vOb9cPd8GTtqHHXhu4w9u6j8WSQDtSb5X6ssjE27blhyB6mhra+UQ/KvOIjnSDn
         z2lzYMSJuQFV4Gq+NowLusqw5dI6E3gotnroD2sBnZGR1uWAguQ0MaT1puN0j/VmaIE0
         RhiXk+Z6q/xbgrUfC9qf8o4kn0/ObQyUlC8t10782z7ZF10dSPyVB+lELxsGZZ9AAOK5
         JrEg7gUrMaBWqqFSWjdcokaCN031i91gPj8qhsNbQdBssGGlQjd47mO+TaOuG1WbbrVR
         /TanQKDhg/EC7ZYZ7HGB659fDSNdZHECKCHIylRAD2vGX5jzzE+H2iJGdB9LGUNEq61W
         Z7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dr60ISvk84gw7E2mdn+ZAgXT0Fcp3MJN+kcAT8jJdSE=;
        fh=vT6Hcylh2hMS3h/sSkeHCZBgXqoh2aIfDjVGIjIRtbM=;
        b=rZEBTP1+8JF0bHI1bSG77/Xkw22jJyhU+ijohDx4YjTGyeLOa2VeHR/TRfxkQDwwKK
         g3GBwdwyRnVjDjmQRo+i8w8g96HxJgsIt6iXBtqgSXxaNe41PqSd8BT43yV81Efu/Cl2
         i/SWLKyPeO4oXsYSK3FWI2K9HsMPbNgR9QLkYU5P5E6b3+SoAkLH/ZFAbcQsxtI7mVHO
         YUbeTkELO/9ZJnBeQ5twc7H/almgNpoNUSX+o8Jbp1KPtPvuET6b5Dcm2qAbAW8ZFwf4
         YbfRkll95YPkLfA24iiZahLnCyD0eR2RIJ10NTKA7Ixd/oexucHwxsYpxgYt+bhK4udf
         pE5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360836; x=1783965636; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dr60ISvk84gw7E2mdn+ZAgXT0Fcp3MJN+kcAT8jJdSE=;
        b=UQ+EnwYkkALkfaI0JR02Vz3nclW0Kb0BX9nZzP6N6SOFQ/wd6TmWdshBL/+LZCCUto
         bOeq/rxJwlsr6SzhC5Ab4E2iPlU4lSokWqCs3WuqRxnKAo404txMrgDqal899JcNMR40
         54eTmpc1PCi8belOFESMUSlzXZ7l67xWt67y2Jeex9ADF6UmFOR88x1tj+Cccvq0MqLJ
         YQ/re8KVzGtd4i82JvEoyPe/gnQKVSzQ6Z2CELVyGjAtBRMrfMdSloE5JMyezOVisDjo
         BsVgKdUn7XmM+70whcoiAVCMCP/Xy0SsV0J9Qr79uXa6kr83YbmfTFQENOL3uasgeLrt
         4AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360836; x=1783965636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dr60ISvk84gw7E2mdn+ZAgXT0Fcp3MJN+kcAT8jJdSE=;
        b=LGHZ2y7FdA4fbhmzESVpFfdkZQw3xtI3aDpXtBBp269YKJmKtZM8d/nIUZzK24Rwv1
         6FY/BCXIjPrggPq9g8zt1hFoZ1q7uiCi3y4oysMlL5E83NQ8y0YuRl8bC4b/ym27jJ1D
         6QogFVI6gTHVgGxZxPA0TISYz/622q+wEVEny0H1F4B9GSg5dX0bSYmMi1cZluGLztt3
         pQm7sMWF8nyFp15xSpOa4Y+FnAAWOQ5EEjyvBVB6CWg+F5tRCaULLq1vMBUvCMgsMoFO
         JPV5TIFpqV3SLXa7z453KMIZ30BtX6vMSbyZZbNPfS78nqtNciwNfDAvmvRk08kC6BZ3
         nx7g==
X-Forwarded-Encrypted: i=1; AHgh+RrTOmyDfJeSHIamAH4bY3y13JFJ3Xj4mhXSrw2RcwyCoX2EOrLvSoXa0CThzEQAdwPfTzLzoUPvKcu57A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywne+ztGq4gA3sHPUIdB1hZz+1Es56Iw+Z081DJ3xON13uy7uoy
	+9G/KhHA0ixITWhdgkAuF7RtXBAtKdWuLbVXeiDIpjtOCwtwj/Jrv+jcB660Rj1IhMtdrMjzuqk
	c7GpBY0i2JrFXYj0fj3wJAxmElH+p++k=
X-Gm-Gg: AfdE7cnRaVHCYJTp7UkS7x/bYQTuWgV15keT1XGdan1eyI2vk2UfaLiGIvulpljABg4
	bwBJ8EB273AYJxkG7XYRY6IIuld25wEtgoNAMZA4ZEXAUM8qgknaP1DJBGCVCPuRaXuvbhAkQl3
	toYdJ5KtTABmcdReheqaxvGn4ED0/63kDsX87Cndpfo2L2wxecRoxNwgk3PfPRx1UKlfc4oufXT
	AoDem90VNKsbI5yEcQ0PEOYj9c5zyOw3AQSpPx+JfhbTk1sqsDqcniGvKcwfs4acMHxxMDEGtWF
	tpcVwcsbWUtjP6+xCe/EkkWlZ0mm2cc=
X-Received: by 2002:a05:6402:321e:b0:698:1504:e3d9 with SMTP id
 4fb4d7f45d1cf-69a85bd8accmr1044410a12.29.1783360835438; Mon, 06 Jul 2026
 11:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518-procfs-lockfix-part1-v1-1-5c3d20e0ac33@google.com>
 <20260706170735.2941493-1-linmag7@gmail.com> <CAG48ez0ebrMy8QGKLuz0Qwao_Eiav6e5pAJ5f6GrUPJLRkwNnw@mail.gmail.com>
In-Reply-To: <CAG48ez0ebrMy8QGKLuz0Qwao_Eiav6e5pAJ5f6GrUPJLRkwNnw@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 6 Jul 2026 20:00:23 +0200
X-Gm-Features: AVVi8CcS3SKBXiRqnUEVp14psIAYY_ciJjhgFTNlSKDvmnRbNTK-HfNc6gtZ-qI
Message-ID: <CA+=Fv5R=mUW_p_AFFr-588F_b1hB=7RhMbtODya-gby=_fjBgg@mail.gmail.com>
Subject: Re: [PATCH] proc: protect ptrace_may_access() with exec_update_lock
 (part 1)
To: Jann Horn <jannh@google.com>
Cc: arjan@linux.intel.com, brauner@kernel.org, ebiederm@xmission.com, 
	jack@suse.cz, jake@lwn.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hi Jann,

>
> and that is wrong because previously, the ptrace_may_access() check
> relied on "error" still being "error = -EACCES" from the
> initialization at the top of the function, but now it is 0 from
> down_read_killable(), so now a ptrace permission check failure causes
> us to return with 0 without actually having called nd_jump_link(),
> which I think means we end up staying in /proc/$pid/ns?
>
> Sigh, I will send a fix.


Thanks for looking into this. That explanation makes sense, and it matches
what I was seeing from strace: /proc/<pid>/ns/pid could be opened, but the
NS_* ioctls then failed with ENOTTY and strace disabled pidns translation.

I'll retest the strace pidns-translation tests once your fix is available.

Thanks,
Magnus
