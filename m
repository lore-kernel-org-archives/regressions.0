Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151A26AFB
	for <regressions@lists.linux.dev>; Sun, 25 May 2025 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748195282; cv=none; b=XqN4vJJOs9hu/cslAkSTgb1TIOtExHNU8OBovNWzY9JfIZJieROqdc4NLD5pXaKig5pYJqn/QKUF3qIu7e4o9HnMvAbTHwU6Ocm5smvam052PaIgwnkGkiE8Q3ATjODIL2pjGeJClyOb1cFN7ILXsN6987dlOzCDMc0Cgn1Lp84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748195282; c=relaxed/simple;
	bh=JcHqCmsSFPDcJJiAaYbKb37QS/ul6o9rxhbcf1SM+lI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJgMB+YrkQ93wXpC4ySRlFkx+3SK647kKIBtCROHzcgQUHGRpb6PQjfvPcAqb6xJKyrVx3o2/WDiKoWVp5KOCMVuSxlRWoTsd0lTkZQuuWxgkWe3fZ6so/FqyAEV/bK3oHpHMbjqNYCXDjeDlRCNY6kgNVeeo4+gdx6aua28smo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBrs8qms; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBrs8qms"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-440685d6afcso19882795e9.0
        for <regressions@lists.linux.dev>; Sun, 25 May 2025 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748195279; x=1748800079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ0Oi+AEZGLioKq4Pf1ZIIAp9uKpwWAvvG0QNpbXWLg=;
        b=MBrs8qmsRUchuqGJYjhYBxcgpuGobRjSLWE2IIs0AIqdhYZtEyjihTSNBchjUul/73
         8/i7V9wQCwUQs2CLJZr36sr91dIs5HepG/bPsut47maLVadXf/mbctXs3+hXuwfR0+vE
         xtr5Nymo5u1R6AeGr473DQh0uSbfW9fS1L8/DQj9YL0QqfVnyNWrLL4SVhNla8Xl/OLW
         2yNZ3/GbTNzeQcdbiAo39XQVlQrPpAdA/CEwLJpG7rExcHdecxyjCfgKBKtKJgTbUn5S
         7FPI3cGNdoDGpbL7hAllpns5fHFp9jQpBr4x6XvvUShlKbjThn221g0jjrVVCvI6cJUL
         tMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748195279; x=1748800079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQ0Oi+AEZGLioKq4Pf1ZIIAp9uKpwWAvvG0QNpbXWLg=;
        b=aNJ8fP/OfH31+SrDe1nHrt5HtDDeN5kAtIkyTffKpEXrqdU06MA3J8iZiPF79afdQp
         qmJpSqAC0OFDhKH0ADeEQWJmtyymwmSpwS/TsviW1rfVPz5a5bQkSOZinCqFoUTU4Lo/
         OizxXcCt7SAvUGjEGSmwn+6o4FXLLApkl6zHSAbZnCh2tIqh168tBYiB/C1pWZe1WmkY
         cBqb8EtA+OMKKoLqJpc2uB31aXY9mqmAhIFyTsxpSsOwEUA/y9KIfVWqWPuVM8pvS4nA
         r1J71uEAmCTRei+4u8Fzf3ZEIc46dRBoxFNGByHiG0uUROv0lEOiSGEFY8VJyW80PRkK
         dr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPjl7dHEglRvygymPeog9b2f6jghX/6jHet7y6ebvzMShtEVcS/5p42WXpLOvjaJnJ7YbXlCei09ZCVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuvO3jwrk2hCLN29KGYT0beK5LcsMquoJjUJhboFEFM4BJy7yk
	F/2TE+d86v3iC6MsS85dUonEWnxMAPqMMlC9Csdj2E6NnHqoTy001phOfOwgBg==
X-Gm-Gg: ASbGnctn+u8MJZoEWDQcM7cdU1p1ES4W/R9Naz6bv8e+21Hvi5wjXNrxTsF7jwBKWYa
	CEkEpCnnJDDJtq06AKqtUiTu01M0sKZaKxLRZkPa5wPoJ1mY3+hka2/3Z320hbhPfmXzUoT5E5V
	1t5McQrdFfxZ+Vco5S9uFNt1xgcWM8X5WArJJ3PQ5oumaq1BuAxeuMlynIfD7svCk8zhL/4tAOf
	mIOEoMGA2TEnjyecxgI4tfkwwbgNsVrmqMYypdd1SXgYZ91gfSXebUzLH5NcG/U7j6wJrRFMjf5
	MbqtES3c1ce5zbwlhKt7f4BvcLMDR4m6+5vGYPbi9XMHlNgobcqDaP8+dKiqhPYh5iEuWKOUqlk
	TT9yyafePL4Xuzwa7Ck8/OC3I
X-Google-Smtp-Source: AGHT+IGMx9RwnjN3gFTwm6NsJ1bSuN/SbYAqvI26NGXWUD2ifOyK8sgp8xRzjOdZXEkYm0U7HSgMUQ==
X-Received: by 2002:a05:600c:3b8a:b0:442:f485:6fa4 with SMTP id 5b1f17b1804b1-44c95aad94fmr57860655e9.31.1748195278969;
        Sun, 25 May 2025 10:47:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cce08411sm5300031f8f.51.2025.05.25.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 10:47:58 -0700 (PDT)
Date: Sun, 25 May 2025 18:47:57 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, linux-bcache@vger.kernel.org, open list
 <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, Linux
 Regressions <regressions@lists.linux.dev>, Dan Carpenter
 <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: riscv gcc-13 allyesconfig error the frame size of 2064 bytes is
 larger than 2048 bytes [-Werror=frame-larger-than=]
Message-ID: <20250525184757.23c5e5d2@pumpkin>
In-Reply-To: <zbifzd2fa3epywbhfznfr24mmacsndkwlengq3cqcgply5it5v@33zajtzvjetj>
References: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
	<6tgxbull5sqlxbpiw3jafxtio2a3kc53yh27td4g2otb6kae5t@lr6wjawp6vfa>
	<CA+G9fYsjBXvm9NNKRbVo_7heX1537K8yOjH7OaSEQhGRmkLvgA@mail.gmail.com>
	<6247de76-d1f5-4357-83bd-4dd9268f44aa@app.fastmail.com>
	<7tsvzu2mubrpclr75yezqj7ncuzebpsgqskbehhjy6gll73rez@5cj7griclubx>
	<566aefc9-7cad-4eb8-8eb0-8640d745efa2@app.fastmail.com>
	<hplrd5gufo2feylgs4ieufticwemeteaaoilo2jllgauclua2c@o4erpizekm5y>
	<692e313d-ea31-45c0-8c66-36b25c9d955d@app.fastmail.com>
	<20250525181842.2e2c47fd@pumpkin>
	<zbifzd2fa3epywbhfznfr24mmacsndkwlengq3cqcgply5it5v@33zajtzvjetj>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 25 May 2025 13:36:16 -0400
Kent Overstreet <kent.overstreet@linux.dev> wrote:

> +cc Steve
...
> > I've a cunning plan to do a proper static analysis of stack usage.
> > It is a 'simple' matter of getting objtool to output all calls with
> > the stack offset.
> > Indirect calls need the function hashes from fine-ibt, but also need
> > clang to support 'hash seeds' to disambiguate all the void (*)(void *)
> > functions.
> > That'll first barf at all recursion, and then, I expect, show a massive
> > stack use inside snprintf() in some error path.  
> 
> I suspect recursion will make the results you get with that approach
> useless.

Recursion is an issue, but the kernel really doesn't support recursion.
So you actually want to know the possible recursion loops anyway.
I suspect (hope) most will be the 'recurses only once' type.
If not they need some other bound.

> We already have "trace max stack", but that only checks at process exit,
> so it doesn't tell you much.
> 
> We could do better with tracing - just inject a trampoline that checks
> the current stack usage against the maximum stack usage we've seen, and
> emits a trace event with a stack trace if it's greater.

Both those only tells you the stack you've used.
The static analysis will show you the stack 'you might use'.
Which is really much more important.

I did this for an embedded system a long time ago.
The outcome was that we didn't have enough memory to allocate the
'worst case' stacks!

	David


