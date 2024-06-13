Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7D14A62F
	for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303012; cv=none; b=kH3hGQGh9TrimoJFJexDeiWpwA2BQL0Ce/eTg1dKhIqWYRqCLX80FN9nNs99YoXgvibclz0Ww11cA4VjM410/wqbEFcVJ4X4vSvhQwJZBmfxhQ4YFgCmo3wS2YKpixjpTVbw36kPG84dQFM3j5KbAaJNQkY1AEhuQ9/hU3BITJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303012; c=relaxed/simple;
	bh=krCnTrtnkHB1D6bVOwKkRyMFqhSVLnQUJePCdLAPTDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ti4uT2uo+/WnEaFqmarCb/aU7T4NRAVD5CaBY8oeEcH2I9X4pAkCs8N/240N+29/ai30v0nUeVS+QK3hCwcaRxJFvYPhm9Gzfh5R1BzPWeLb0QB4UYSX4seQXdGuFtqqNFTcafEDTHmleAcRenGAKQsfHJ6DnquZ0DHALSzvwsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dwUuAyT3; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dwUuAyT3"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfdff9771f8so1527057276.1
        for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1718303010; x=1718907810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7FnJEUeHYST8KdquXXOOwJt3IXf3k8psfyOLW+siSs=;
        b=dwUuAyT35+qoHzMfOZG7Xck/J3FnvCDgmcc5zLUE9FA1qOVZ0VybnjX5zuqyT3K7rP
         aUc+bhUa9fwwsZuN+qe868qQk6+TY/Eh2Wv/cAZvj4Me/fCb5oOAGxhsrkQoX0IyZRCU
         z331op21B9ibEL6wlR1jDpSGgN33nNzzYR8SchbVcn7sORBgPojnDH35ixHESea0CQT+
         NeO4xUXeqSO+7loUm+RdzexBYtP9hAOBdgC4ibBlh916UZDJW5HzEOpB2RNxDg1fs9KQ
         rX67VswfMJ8qONLRdb6XRCv+g20zTLB0mx1eMhHVzW5FOuEdlj3oblwdLOQiIcUdYFEa
         BI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303010; x=1718907810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7FnJEUeHYST8KdquXXOOwJt3IXf3k8psfyOLW+siSs=;
        b=MswCKYCEky87p3mqo5snl0uYXA3hOehDtQETnJ3+cdY4B8KvH0xRKSvOly6II6Bg7d
         J2uvcUZZM6Nj9JpIDRMeLk2o4aLuYG/EzyznA15Ao6w8uOGB20bRzlTBRnLDrEENCyg9
         LHhvrQWEAstVHIPE73IbftcgZUCqtNm2ecchAkYl8WbZ31r1j8oLLCJaLV2it03zihgD
         BYfC14iyEiqgRDsrNbgl8MtVqUcHPqu9h+OiHBGLHlUmxs00kmr8u10ThxCARcltv+tL
         NWQaabPWYHFqoIFBAYQTmsOzbeRBq0QtUNI/UL6E+YgzUeFQt+Z3PAJuZhchcnUs86WS
         boZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcD/D/B4rYipduPEAHQUuDMY9/0VVAUVkgT41cWXdsKd//AnhwwmhxAfa/ouwpywXVFtNDdCvAnmCi1PS3TyqqEX31ciuRm3KvgcU=
X-Gm-Message-State: AOJu0YxQBvqkNmIGB1MSJ/5XCu82ZUnP0quf/MDeqxE9YZi5t0RcrGuF
	I/FsrQBVgSOFg1tKcnOU8KfkbZVFT2Ihe+k+QeGx3uebQe02Vf08+Le15Aif2nFcHutSniwJh3P
	NaYGd3HcM5cJjuBmgbmTkDq54uO2LvrjcWp9N
X-Google-Smtp-Source: AGHT+IE4Ltjey1yaGfz53sQ/9WLShdZ82+JIBb7XxCn7Eqt0EFUMoYYVjqNU2UFmX1J77aFxmDQczyuNhRm+3bZd5xw=
X-Received: by 2002:a25:dbcb:0:b0:dfa:584e:c661 with SMTP id
 3f1490d57ef6-dff153c3883mr320940276.34.1718303009863; Thu, 13 Jun 2024
 11:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvWXuWyd3NiX3WwRyorRiDRbxGmRW_7aVnBVKUVA_TaGg@mail.gmail.com>
 <CAHC9VhSeNGo4fPY0H5eM_fFsPSQ18xWUYMvyHBChEysXk-+00Q@mail.gmail.com>
In-Reply-To: <CAHC9VhSeNGo4fPY0H5eM_fFsPSQ18xWUYMvyHBChEysXk-+00Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Jun 2024 14:23:19 -0400
Message-ID: <CAHC9VhRg3efo2J5VsxxskFW0ntotwswvLmn7cWEMmSTkEC4QFg@mail.gmail.com>
Subject: Re: security: ima_policy.c:427:17: error: too many arguments to
 function 'ima_filter_rule_init'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, John Johansen <john.johansen@canonical.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 1:36=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Thu, Jun 13, 2024 at 8:43=E2=80=AFAM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > The arm and arm64 kselftests builds started failing on Linux next-20240=
613 tag.
> > Please find the build log and related links below.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Thank you, the same error was reported by the kernel test robot
> overnight.  I'm going to look at it today, I suspect it is a conflict
> between the LSM and IMA/EVM branches.  FWIW, I compiled and booted a
> kernel using the LSM changes yesterday without problem.

Nevermind, it turns out the patch is bad :( ... more on the LSM list shortl=
y.

> > Build error:
> > --------
> > security/integrity/ima/ima_policy.c: In function 'ima_lsm_copy_rule':
> > security/integrity/ima/ima_policy.c:427:17: error: too many arguments
> > to function 'ima_filter_rule_init'
> >   427 |                 ima_filter_rule_init(nentry->lsm[i].type, Audit=
_equal,
> >       |                 ^~~~~~~~~~~~~~~~~~~~

--=20
paul-moore.com
