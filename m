Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CAA286A8
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727810133; cv=none; b=RkXgGCkQQGSnXNyKjdVDE2yn5EMBA8k9TrnIOQ5wfiLimw1ZpFYJXhnP7rAnCBbvuo7gyofRdkhTdMGBvKoGMWriwGeKmm1jbFe0fjcnGEAb6QTBdUbSZLVXO0CZm0SL4ONIC/d9r/+pS9GdmE38xSr5R9PB+hN0qYbT6md7SwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727810133; c=relaxed/simple;
	bh=oHX9oLhS2fcLUzguZRgRlHOmYwopH0LeGht+u7rjoVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PY5zo0dgeA2BWFmpAPC52LHJXaikPgnl0ORH4bxIUQG8WWnW8btnwBvSgX3x+PGwEWKnNLnhweXIWujmkY34nmIjSVbvyQo5zPN0YtlzNmLTUPBs5Gu4vX2hsf+yyuiLreyoXTerS/9vV4hrgm8uy7V9WGwsqCEevP421G9B7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y62n4TIc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y62n4TIc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e09ff2d890so4974587a91.0
        for <regressions@lists.linux.dev>; Tue, 01 Oct 2024 12:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727810130; x=1728414930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROw0OxXZu/qRMTETvniaDIW4ULnJVrS+jSpbp/URjhs=;
        b=Y62n4TIcXHDwHc0QzzaCSyLRR+QgUVot+QNGIvWLDKsVTQKEWoaujeSikf4LT5xJBz
         1LOvJJu8HD6UALk1Y2AHRBJ6wcMNMnLA2SZZ16+a+MpwchKIdm58XRWGzb/vLuT4cUe0
         pNuyEQpq9X7ROI+D4k4Aa032g0GXv11G5i6AEHjfHDj4z6tP+Pik4hrI5UL9PFBBdEq7
         29f3Um1ervVbv8Zl7oisWtiV3RQ9kyNPrvZpMvqWD/39zrc63Mz3OgT0xt/kDSBbVyFR
         HJ02DjDa8AVWNBjCDonLPRJ5TN3GliiH+mwfArlvuVD5ii0KTmBj2BraJlC3o48zLLh0
         lFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727810130; x=1728414930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROw0OxXZu/qRMTETvniaDIW4ULnJVrS+jSpbp/URjhs=;
        b=K6jycaoU8H5ccTXlU1fUjYyNlsjHiLCTcvMcGRouL+m8MFFnmQ85fyZMI+IqsUI8JB
         6HMXjuf8e5Fjnym9P+CYIpb04uBrAG4IHHiecnWOsGR31RVNO/Ex4mjHuYAO9m5aTAFr
         K9bKpelWm6y0gOZqLKTTWgtTZy6fmA5FrMW5BnRhZ5++UOQk0MHrYD1Ytz4TujrD1HnE
         QW7UimZ/dAviQUTVfR6ODo8cOwV7pFGt3k1t/MyHuArzk7Rzobbantc6kWDc44GnqavO
         zBbHh0dqseYMTJJf5HnF2zEy3ozWoQcSq1JhVMTlTJRBZ0zVOFiXT36K3oz64shq5eJB
         nsHA==
X-Gm-Message-State: AOJu0YzNWraLLMgScXIRBzTwr/GrmCyzH0pd1+QCgYb6CKcpKax8P+th
	Nj7YlZ5iGWMPAxC0HR4CRQqwNLQJfM0JVCqA04wp+UN+USCYspaEYzBzCzUiWSL2WlkW5ZU4Ivp
	9FNTeksy+BCZavUJGKsFRrSIOSkD8+Ws/ytA=
X-Google-Smtp-Source: AGHT+IEZYZ9JNe7sHu4GBFJ6hLXR9WIV/8R2Jz2qqX/MxHVuDJ0OhPAc3NQ6vGOJ6Z7qTWLgyUXL2bSD0g0wad8+krg=
X-Received: by 2002:a17:90a:bf17:b0:2e1:89aa:65b7 with SMTP id
 98e67ed59e1d1-2e189aa680dmr223483a91.9.1727810130020; Tue, 01 Oct 2024
 12:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8196cf54-5783-4905-af00-45a869537f7c@leemhuis.info>
 <ZvvonHPqrAqSHhgV@casper.infradead.org> <b77aa757-4ea2-4c0a-8ba9-3685f944aa34@leemhuis.info>
In-Reply-To: <b77aa757-4ea2-4c0a-8ba9-3685f944aa34@leemhuis.info>
From: =?UTF-8?Q?Krzysztof_Ma=C5=82ysa?= <varqox@gmail.com>
Date: Tue, 1 Oct 2024 21:15:04 +0200
Message-ID: <CACw1X3iPMW1+cw8Pz_CG_9KM=Z9XycRPbzF0WDD1nxV1TDn2gQ@mail.gmail.com>
Subject: Re: [regression] getdents() does not list entries created after
 opening the directory
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: yangerkun <yangerkun@huawei.com>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 1 pa=C5=BA 2024 o 14:49 Linux regression tracking (Thorsten Leemhuis)
<regressions@leemhuis.info> napisa=C5=82(a):
>
> On 01.10.24 14:18, Matthew Wilcox wrote:
> > On Tue, Oct 01, 2024 at 01:29:09PM +0200, Linux regression tracking (Th=
orsten Leemhuis) wrote:
> >>>     DIR* dir =3D opendir("/tmp/dirent-problems-test-dir");
> >>>
> >>>     fd =3D creat("/tmp/dirent-problems-test-dir/after", 0644);
> >
> > "If a file is removed from or added to the directory after the most
> > recent call to opendir() or rewinddir(), whether a subsequent call to
> > readdir() returns an entry for that file is unspecified."
> >
> > https://pubs.opengroup.org/onlinepubs/007904975/functions/readdir.html
> >
> > That said, if there's an easy fix here, it'd be a nice improvement to
> > QoI to do it, but the test-case as written is incorrect.
>
> Many thx Willy!
>
> Which leads to a question:
>
> Krzysztof, how did you find the problem? Was there a practical use case
> (some software or workload) with this behavior that broke and made your
> write that test-case? Or is that a test-program older and part of your
> CI tests or something like that?
>
> Ciao, Thorsten

I have a unit test (
https://github.com/varqox/sim-project/blob/889bcee60af56fa28613aaf52d27f3dd=
2c32a079/subprojects/simlib/test/directory.cc
) in my project=E2=80=99s test suite where I create a temporary directory,
populate it with files and then list its contents using the handle
obtained during creation of the directory. And it started to list the
directory empty, since this patch was introduced.

While listing the temporary dir one is using is unlikely in this case,
we will see if any issue in other software will emerge after the 6.11
will be released as LTS kernel.

Thanks,
Krzysztof
