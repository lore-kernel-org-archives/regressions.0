Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E5F222566
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758061004; cv=none; b=cwA30VMzVnAklQkOuJGRM63rDyuR3ARy4nhKAP2e3lvfkYmRozNeX1EaBoUqW89+/GRAbpWphsD85eH+OYbpuVWbDfUInAnFEgmbh6IgtaIwwhJdj5f8iGudwQn0tKK3GRYqrpcE2c8Kr2kFI6EAm9lR0BkQxcwePPyk90z7W9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758061004; c=relaxed/simple;
	bh=ZhrtNX2kW4+SEm0NDR3oatPjuXJvSmAGowa5Ma02sfQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jQx5QARNO3SYu1/HrIN8JfxiVGJGnpi5y/xfpwfhK4cLLXaBeok6Wxs5xf9UVNcohQ1B+qjMJAT8jani1fECga8ke8FybAIHqlXlmOBf9BK3Mpmucy7IuDAKHyew3HgMx8Ke60T/lDHAzxvQigfQwwsXDS3ldb+gBOfdXNkE5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQf9ZidK; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQf9ZidK"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3318dd36a8fso3051003fac.1
        for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758061002; x=1758665802; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ykbi9ORR6F/chC/kV2ctSfLFRdnZlKnXwUjsJoavaTU=;
        b=QQf9ZidKqLYHdhlt0jmajRZLu59Gr1/+vN+ZRa/qVzsY198IUPWFZitLqu7mT1tAGO
         RNPPCxI9ScmHpA8rms4JQ3E3vBhGc2ECyMoD8Uoa+VEYHMpxhN54hazakc+Z4hlSsUBr
         DYhkU9qhm0S24XlBnVcYKSWIf9NiW1ISi5LvF1n+e69RjcwQOfGVhYjm+e0S7zdYClVt
         w6DL/bmKFe+1KpiWgN5cHGnPHPRi6ROC4LvmLJmGIwYs307YxPN6g+pXWHfp8zD3ORIw
         H/ojeEa0om6kwIxPkPuED3Icdh/GZLrriJmemtogVwqiBwQPTGiV14thPLDnxzXXFXKU
         ngIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758061002; x=1758665802;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykbi9ORR6F/chC/kV2ctSfLFRdnZlKnXwUjsJoavaTU=;
        b=m0FdFRKwz4Q3tyQEjr0kSsM66oFMA5kp7Bs6iTyahTZJ/yZpU6MyrQeNQshSyqPp/D
         qPK5tJ6AVSuP65xc2DAnstr5GwTD+ubBjwMWd5+FfopEAqoBFurOyYC4wuZzE6fMwFuV
         kqxHJkJtGXk4AvVcHiWD5r8shZ5yx702Hr9r0t+tCb/931A1g8dAaRg9W8W9bsNyUVep
         bGVVtyJVJlbshK4lYfnwFNJsFAAJ7Rxj6EWLfIQ1vMQMYWb6cht7JaBXoXvLPhHJGMnz
         7YLFJ9cglwmdmPK4BsUzXOOmomd1ah9uhHn7m9olBwt8B3YvoOZsmqhm7Zdnnv5GNLRX
         /9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAoocpIPPUBRN+plQlwOaLgUht+Kjlf9w6o/z+Mx9dbBScqneW3HhPOPI7KEGUFOlFYe8bM7C6zJ8iCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlAmePFsh9UZPxq9DXQbHSMqKKy4XRov2J8TKRRV6/FPeonE8M
	Z97YDwabJkSbmjwLlCmLzGzskWvcPfh13DNtQAaqvr99sJB29xmhU6Zs
X-Gm-Gg: ASbGnctbxA7RFS5w/VWexIeYtGS4ZFUIkREUJkLMZV1wLk0g7PcmmFWLBvpMbgU9/YR
	hpUWS92qwYIdVvYOgachI66r6CXerq5R2Ev7Ukn2xoiQyouqxF6zukzMwCtDrRzdva1lG+FOGM+
	b7Lf5TV/w4WpsJvfhGf/r1PrPf5ISv9VxiDeIo7BMLA/oODD/H+qEvNmcPtDDpflMaVWOz9dMxz
	Dz1UfOsALJO3FiF+XohFWIXMmTDieOv/ilDE6jfIuuYKvU4EEP47XAEU2pUy6oJGSXx8eQZRLEc
	6g/uAx6ZmWcqlOLpn4sJtjHAICIAaP1G87MYIZ1keXuR2emfRqqyqWP2Ge08JGX/aVM3o420xE9
	9aRw3xndzcBzbGJmAlHW+ExbbagkeemtdaHMKpWfrWWG1C20s9WhLh8sI8qw8N0BNShAVSMTuw0
	SYzNxCOzrfBHCgOyJXz2qyOJ3ZCfoXSgQiyJs=
X-Google-Smtp-Source: AGHT+IEZnSDUvYgihKJtLaN2Xpm1odOGPMiQ/3sbr28jrHO6rgLxPXvbdax1sAYKsoitj5HevBF6BQ==
X-Received: by 2002:a05:6870:b251:b0:2d6:6688:a625 with SMTP id 586e51a60fabf-335c014cba9mr29867fac.37.1758061002296;
        Tue, 16 Sep 2025 15:16:42 -0700 (PDT)
Received: from [10.0.11.20] (57-132-132-155.dyn.grandenetworks.net. [57.132.132.155])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7598664d715sm1707318a34.0.2025.09.16.15.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 15:16:41 -0700 (PDT)
Message-ID: <c36676c1640cefad7f8066a98be9b9e99d233bef.camel@gmail.com>
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
From: brian.scott.sampson@gmail.com
To: Kuniyuki Iwashima <kuni1840@gmail.com>, christian@heusel.eu
Cc: davem@davemloft.net, difrost.kernel@gmail.com, dnaim@cachyos.org, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, kuniyu@amazon.com, 
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 netdev@vger.kernel.org, 	pabeni@redhat.com, regressions@lists.linux.dev
Date: Tue, 16 Sep 2025 17:16:40 -0500
In-Reply-To: <20250611164339.2828069-1-kuni1840@gmail.com>
References: <58be003a-c956-494b-be04-09a5d2c411b9@heusel.eu>
	 <20250611164339.2828069-1-kuni1840@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> Thanks for the report.
>=20
> Could you test the diff below ?
>=20
> look like some programs start listen()ing before setting
> SO_PASSCRED or SO_PASSPIDFD and there's a small race window.
>=20
> ---8<---
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index fd6b5e17f6c4..87439d7f965d 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -1971,7 +1971,8 @@ static void unix_maybe_add_creds(struct sk_buff
> *skb, const struct sock *sk,
> =C2=A0	if (UNIXCB(skb).pid)
> =C2=A0		return;
> =C2=A0
> -	if (unix_may_passcred(sk) || unix_may_passcred(other)) {
> +	if (unix_may_passcred(sk) || unix_may_passcred(other) ||
> +	=C2=A0=C2=A0=C2=A0 !other->sk_socket) {
> =C2=A0		UNIXCB(skb).pid =3D get_pid(task_tgid(current));
> =C2=A0		current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
> =C2=A0	}
> ---8<---
Just came across this when troubleshooting a resume from suspend issue
where I'm get a black screen after suspend. Initially saw this with my
distribution's(Linux 6.16.7-2-cachyos) kernel, and confirmed the issue
in the latest version of the vanilla mainline kernel. Bisection is also
pointing to commit 3f84d577b79d2fce8221244f2509734940609ca6.=20

This patch appears to be already applied in the mainline kernel, so
this might be something different. I'm new to mailing lists, so wasn't
sure if I should report this issue here or start a new email chain.

--=20
 Brian Sampson <brian.scott.sampson@gmail.com>
