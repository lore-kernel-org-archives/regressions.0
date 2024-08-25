Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1580B224DC
	for <regressions@lists.linux.dev>; Sun, 25 Aug 2024 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724603083; cv=none; b=A2m2fdP/nXQ5CgY3nEdon6QrlQFvPWxL2Guq2eDAjjuBLl/PGJft/e0Nkrc5TkEXSjRudB8jYi/aUFhYePdeSV17ktZqtsI3sNpQfnj+IBv7brI0K33hlpy4KXY1o9hkA1BSxTBYkjs5en5wBpcAkFF0n8UhFTx7iB6pST2Gios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724603083; c=relaxed/simple;
	bh=KJ+Z50j8sUoBHy3hhy960h2rh2ePf4Ly0jSUPqKdGDM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OMEdP4Xo8zRZ5eRHTmoIR9II4omZiq8i8OV7rAB741IhjEDJv9AxaoxK0vMbbbhJTpy8SHgkIuoExwZQ2ZFESxMgO9JfgsYEI0D811+jir8oc9IT+sZgCSg/kDN/lvNrMf+Qjq8arPqL4RYgMBIB+8W38QX6kf7QGmfBL+u5xhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhx4lEa/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhx4lEa/"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f4f8742138so23342461fa.0
        for <regressions@lists.linux.dev>; Sun, 25 Aug 2024 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724603080; x=1725207880; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6XomT4xNhYnUhlhJpfg6DQnFwYDy19uzJG9jCJSIOE=;
        b=nhx4lEa/0ewnmSKyQmedynWQgNJxCAA/htMwoHrrzwBl7URq6dHYde2pHtF3ONcGEk
         +cNSkA2i3jkNbJOWW7WSXDqyVZFcxag7QKg8p6LqTcmpjz1Y13OCAhFOQ/iYVli4wPiT
         Lv9fEIoe3fB82qijDR82m7erAA+NpwxhaVQGDRWHseWQ6KolwDJ/P7zOpcCpsS81SG8e
         ce393hKZQ/dy23he3v5YwuVhPyOFIYdCgHmc2jlMOp6Z9e51t+UWU5HkdstI8DdSNeMr
         7DNA2888w6Qw2DrXG5Ue3OxFk9mxc+uXeP981R/WvLz4oSvjf/j7ZXtGfqE1QedUjqBi
         kIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724603080; x=1725207880;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6XomT4xNhYnUhlhJpfg6DQnFwYDy19uzJG9jCJSIOE=;
        b=C6NaezueKg/unelF56y+3XmfLsXA02RElZROYsMfDeiREk+ODt8r0RJR11PouVqP6G
         fSk1ihY2WGY0Qb5ENt4xMMV2gSQhp2EfA/kbLJCAXZ0iWSe6ObJG3w0Vc+lYa3hcei/K
         UFCQ9zT8wWX3VXRWXht2RASVH/yiYu1dOIB9Tt/Yy3aGIvdR6v9Jus3iIcA2ISnrHjlm
         nFbwuznm96QUYlD48Ndhtgl4DQVDRYIs38SSSCyvgqKq6gQFOK3QPsdCerlh3oCzh86Z
         sYM2GdTa3yRkq6GQevMnPIEa7n+JzMmhPxJrd9EGIMXKYHw8Yy/jUrXvG9g0VHTVpoCV
         AL2g==
X-Forwarded-Encrypted: i=1; AJvYcCVc6hEsk3FPMagnORQIcbGgflVpFIGxq38MYHd/HSFcuOtezACEavRsjRunL7V6jGncAtXYbfmP7LVnWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNCZpfkRoNoy1VzNXFcjAcrRM5YebYNiyHKX9gH2SFmhFdRkdF
	QHJcJKPoF8fCbpViVKy18ueVvKBKURR/EihWzQxOq61sht0lomU9
X-Google-Smtp-Source: AGHT+IHTCz6agKZpn/0TM6H5VB1xS4o1qPHzlO6+ruqCMC63cLFJxFAOns8FPsvm6zqLp2Zk54MvFg==
X-Received: by 2002:a05:651c:211a:b0:2ef:2006:bfb1 with SMTP id 38308e7fff4ca-2f4f9dced35mr48808711fa.15.1724603079772;
        Sun, 25 Aug 2024 09:24:39 -0700 (PDT)
Received: from smtpclient.apple (89-73-96-21.dynamic.chello.pl. [89.73.96.21])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4048acb0bsm10663581fa.125.2024.08.25.09.24.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2024 09:24:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <oophwj3aj2fnfi57ebzjuc536iltilmcpoucyms6nfk2alwvtr@pdj4cn4rvpdn>
Date: Sun, 25 Aug 2024 18:24:28 +0200
Cc: Nhat Pham <nphamcs@gmail.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Yosry Ahmed <yosryahmed@google.com>,
 Linux-MM <linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D1B8F1F-2C41-4CCD-A5D7-41CF412F99DE@gmail.com>
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
 <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
 <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
 <A512FD59-63DF-48D3-BCB3-83DF8505E7E0@gmail.com>
 <oophwj3aj2fnfi57ebzjuc536iltilmcpoucyms6nfk2alwvtr@pdj4cn4rvpdn>
To: Pedro Falcato <pedro.falcato@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)



> Wiadomo=C5=9B=C4=87 napisana przez Pedro Falcato =
<pedro.falcato@gmail.com> w dniu 25.08.2024, o godz. 17:05:
>=20
> Also, could you try a memtest86 on your machine, to shake out =
potential hardware problems?


I found less time consuming way to trigger issue: 12c24t cross compile =
of llvm with =E2=80=9Eonly 16G=E2=80=9D of ram - as this triggers many =
heavy swappings (top swap usage gets 8-9G out of 16G swap part)

With such setup - on 6.9.12 - i=E2=80=99m getting not available system =
(due cpu soft lockup) just in 1..3h
(usually first or second compile iteration; i wrote simple scrip =
compiling in loop + counting interations)

Then i switched back to 6.8.2 and=E2=80=A6. decided interrupt successful =
test after 14 iterations (it was 19h of non-stop compiling with heavy =
swapping)
(sure - i can still keep test going - but builder is also needed for my =
normal development)

So summarising:
-on 6.9+ just 1..3h seems enough to provoke issue
-on 6.8.2 so far never in past + currently can=E2=80=99t provoke issue =
(last day in 19h test window nor 5 full distro builds nor last 2 weeks =
of development)

By above i personally don=E2=80=99t believe issue is in hw (ram)


  =20=
