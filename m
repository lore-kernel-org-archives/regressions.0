Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425D1B0412
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902919; cv=none; b=RFKkhQvPIDJFXQ9BrhvAOg6zMzzHL6xfARKmf784sNRUlQQ6prHysce0fKMdx/UW2cKyDnj1kEAabR4I3CvEx1HKJS/G3JPTL8K3m9Uut8o5zZIthnJNmalJeBQxcA08ZGxSHwk2NxjPLrQXKrV/wu6cnpnZ7KoGd8C7ktM/nNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902919; c=relaxed/simple;
	bh=tYQxCGngj9fE9ouQsSmRNK4tfs6iy3G5wdKuIJ/e2mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkLNUYND/2r5xLghGFbFy45c2PJ0mDMRD5YVlfuerxf4yJHjtPlEQ6Z48/S8PlnfGR4mNjR0vEVxd3M2I2JuNwk3TTyeNEqwLEmvD1tWGcY4jJBnhqz6BQCOe86gcU6PaVpNq/SJ61OxumWuhBGYaP0PW1OH4FGrfQxvE/uQfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQ57Wbui; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQ57Wbui"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87bfc9ff795so1394112241.2
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747902914; x=1748507714; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYQxCGngj9fE9ouQsSmRNK4tfs6iy3G5wdKuIJ/e2mY=;
        b=cQ57Wbui/PYk2AzqNWw71WH9hDQJsqlTATlMQcGfce18r8VYDXOV0XnRFFWyYxpnNA
         21iXLE9vWDlTy3+3LNjpyUafBAc/cduMPTvmQetosK/ao5ic+Pqr1sXGg7sjg7y2ygcP
         B74V+La9RQnlGt4enIXG1TxyvnC5sRyWD2ypTfSfdsyjTbXgda67PEq6GI0xX0kqtns8
         LS8Dz4ckrG0TLgMy3RsedFXx6MJp97IqFUz0B3olQvtaFL+9B1VOxCNc18FRnBb6iEBa
         KBEJxEFLa9ndakHxiyIHxnHy6GiUw+gEvPh7vxG88Hrf/IBckbg8asJv8h1ZsTetkKQJ
         q3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902914; x=1748507714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYQxCGngj9fE9ouQsSmRNK4tfs6iy3G5wdKuIJ/e2mY=;
        b=fg/sGrjcQIENbJpZWNDOTi1FS/kIv0G2lEX9jiWks6eLLEOj4AZDzZLQwIPft/v8lX
         CZ0XoSVe4/A3pBwmUmeHYpPBVMCV7lDkFsYoNP1ltefEox98VzVV6Ten4YEvztnq2/f6
         uH1+RQCU62JP7g/H5ju0VCSqOV1tQY8HTRUyygX+8/ilaBk17b5WTG51tSG+p8yMAIdG
         sfQY7vm2QaS3ESSAREOqnUNzpSSGfrNNbR3Zkcedp6EzkNF4itDnHIYkBF33l/y5zZ6m
         hs/Pdno779isCfv/GMgP7fn9u5LaiyB0oSLLlbOGuZFcPxUsv7K3FGXZKfBKeqm7s2QE
         wK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfYbSP1sYgO+IRRL0CRBpX4edVuJxn6jipGKlssDzbLtNEH5kaQHPl5IP4+1SezuITY8inVv0gt2y5Kg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuJ6r/+w0WDfLQ+KenaV6LaLFDT7YijmTTSmrim7XTSfJ1QFB3
	rf1uD07wdg8YA5RWRouqyerJgZEvzRmnhSlDeM5qR7JRfRMrw7FhfH39pMfTZwq6SzTzbPbLVIP
	SVd0mkt9nDXIsFms67IayPwHEUb3jXBN5EDsTwvcdqg==
X-Gm-Gg: ASbGncvBeJgPV/hqSrvkIl281zoz5H0FT+/KszjGYNWbGHwiV4SHMCDjsoIf1Ju3YLB
	+7eIzU+rFjLqPqpEJkT6c5c/Vhuht7f+/horSDmuaqVZZbIUQe2kNX7YA0vtfKkAA6VvTaz1QjT
	g3wtzQ28wS5PJ01hVrK+D7zoy0vYt3YbHCVTgayB9ChWfC0hqZGkW/9wZ3pQ2g1lBTPw==
X-Google-Smtp-Source: AGHT+IG1tufTo2laqv0iUxS628PFmp3liCtb2kVRmJ/1753thxyKZS6oUk0xxwo4pGk44af87cl//6xqqgtgt7qTqLs=
X-Received: by 2002:a05:6102:809b:b0:4cb:5d6c:9944 with SMTP id
 ada2fe7eead31-4dfa6ae1b10mr26679671137.3.1747902914500; Thu, 22 May 2025
 01:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
 <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
 <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com> <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
In-Reply-To: <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 14:04:59 +0530
X-Gm-Features: AX0GCFsZ82FAe40c9-JDdkvEhHBvY185zJfCoLa6DZcQDwCQ-JxPg6n64Vcx6kw
Message-ID: <CA+G9fYtM-s0cgS39wX9Go_OAXxYa4nME6h8CbhyK_-QrRvQk5w@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Rudraksha Gupta <guptarud@gmail.com>, torvalds@linux-foundation.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Ben Wolsieffer <ben.wolsieffer@hefring.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 May 2025 at 19:37, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 21, 2025 at 3:57=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.c=
om> wrote:
> >
> > This does, thanks! I'll drop this patch for now then and will assume
> > that Naresh will eventually send it. I was hoping to get this in by the
> > stable release that is set to happen during the weekend (doesn't excuse
> > my sloppiness though, sorry about that once again)
> >
> > Anyways, thanks for being patient with me as I learn. :)
>
> You're welcome! :)
>
> Let's see if Naresh says something; otherwise, I think it is OK to
> send it under your SoB after a few days (acknowledging the diff from
> Naresh).

[I was off and travelling]

Hi Miguel,

Please accept this patch from Rudraksha.

Acked-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh

>
> Thanks!
>
> Cheers,
> Miguel
