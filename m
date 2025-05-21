Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F664184
	for <regressions@lists.linux.dev>; Wed, 21 May 2025 07:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811381; cv=none; b=cNrHWIc4rQY3L405WSulQ7lI8BZd5k00DHVph9zFAP3FEdewsg/v+r2Hp7lpUMjl+qZs7IPah0ibl8hnOph3i/ZcR1ZFmZfs04EwO0YZa0Hwvgx8IbI6vPSKWHm/8yNY3VbnCC3He+B8MSxS15te/8KpC4CcZoBir/ZXv4WXjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811381; c=relaxed/simple;
	bh=M+QgcJjqRVEJQfA4aX9EptR04Xy9P0/WqwTgE5lgNbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j45i5ihJKr9jIQ596sDIcTwZWxJ6iEpDyfZFMUgCsDlIgflKPTH2xE6GZN1Zl3LmQ0xf1kZjPDPpVxphyo2zywEKJnCx3bQ4a7Mr3fvwVlWDLIy5mvM7TNM0FXDT2b8JF5RNrObywL3+ljWkAjpYn1KiDWmHDg7611VtTbXeZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kexvI1LL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kexvI1LL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231b7b21535so4768665ad.1
        for <regressions@lists.linux.dev>; Wed, 21 May 2025 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747811379; x=1748416179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b1jzIhFa2FhOCKHPrKMKsuUFishKw8l7iMGb9zVm7w=;
        b=kexvI1LLCGEQREQGBgP8Of+q31T2hU3iSkLXKEiDS91LMIyQvRVkTCCWVM1LmHYzud
         N1boDgtshqAEHhHc8ujJQxGUyapu/DZhyt0SjtfwYe+bKiGLV582GSxI500maRXe4ljU
         eFStVc+7v2H60ihWoONI+lEvylKNpef/RIcaaD+3qOZruXc7J8XC1okl+y8KbE9laOUr
         HNnv5OtkDXehxey6fxyYX15FbncysPIjbCiafgan7iyQMIqNN042ef4uHPxPmtdHITQu
         E3KTYgz8RmlVSczgnM8chbwAmnPPB+WFzn+fBTR9m9RIUThgZ90mbadoDb9L3eY7bfhS
         2O6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811379; x=1748416179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b1jzIhFa2FhOCKHPrKMKsuUFishKw8l7iMGb9zVm7w=;
        b=de0lARnb1/UHe630+xJrAGcVm/PpN3WtPwNSSuaK+g7qzquQF/JGe/kjq+XzZSScbc
         Ok6ufGTji8Fo+jNGAFkj22sfHWDSEx7ypEB2RDJ+y9tDAl9UqYVOhfxHd4l6Z6/rfgSP
         m6P4ooPeSAF4v9r+2K3oD9/1yS1u9ZFEeu55MIEP/MEEeRDoX7D9o1UHn3Dxq8vrUbpS
         5bYgmGjX4MIqAPFUgQsKgfm53Q7y6PgUxwZ2IqGVSyr1vHULFlZketzMXVE3v8HMapsw
         s5DramqHKhEnqB/mNgWV1dKLsQnGKg5c7TgjK2U4WXl4fwh4vIUMtrYF1RonpVpOgxPT
         LJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaGKUznw/Iozj0fU277UXWMYe5cgYWiZOXCE5J2vcbi9N6SWXbET0kD89l0igF0Et47893Q7bDsPCAWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG0ZMDbikTvHAM41lzqs7mYYBmd1q/TckNxCxa9+iygJC5CWNj
	ovY6qXJ6ppao2WXE0djyUdqsN96SxTghVAEjFggz2Juy3fT5bJjlwHfZ6S3MsUHJsw1yLwXv2St
	4/fNaamW8WSwCtiXg+y+6bLcHZAFLQlk=
X-Gm-Gg: ASbGncveuBp4Q98+HWg2MGP0NFUwuJ8pbOzSwQP8A+4ujP+y2UkTFD7+hRZEHKEW86x
	yqd+gZmy0Q9Fk3d3y/37FzckOOVoZ/A5WzR8jTfaTrmK0Q6WvVU2iOCobKTdNlnAH+P7FrIkc1L
	eGfzG1/gRABRMZ+/bGuEArGOo1FP4Bht25
X-Google-Smtp-Source: AGHT+IG7OrMSs9P/zrw+dkkGpZ5+vimnflwEOeG26XH2xajGx/3nSUoi5maDfDx2SmZ+PQsdtWRVqt79c4BQdmVcmgc=
X-Received: by 2002:a17:902:f543:b0:212:48f0:5b6f with SMTP id
 d9443c01a7336-231d45262a6mr99145265ad.9.1747811378727; Wed, 21 May 2025
 00:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
In-Reply-To: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 09:09:25 +0200
X-Gm-Features: AX0GCFsPkNFGlU8TGSg9z4gQIr36f6YCgKgoros-1ed1pfYVZLXdghRHHzY45wc
Message-ID: <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: torvalds@linux-foundation.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, arnd@arndb.de, 
	dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 12:48=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.co=
m> wrote:
>
> Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
> disables a GCC feature that we don't want for kernel builds, so let's
> skip it.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJX=
Yu7wWK51w38QUQ@mail.gmail.com/
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Thanks for the patch!

A few quick notes -- I hope these help to explain how it usually woks,
given what you said in the other thread:

  - Since you asked: in general, Linus does not take patches.
Normally, patches go through some relevant tree, and then then
eventually sent to Linus. In this case, the Rust tree would typically
be the one taking this patch. Please see the `MAINTAINERS` file.

  - You cannot generally send a patch in the name of someone else
unless they provided their Signed-off-by. Here, neither I nor Naresh
provided the Signed-off-by as far as I know. Please be careful with
that! Please read the DCO and the rest of the Submitting Patches file:
https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-=
developer-s-certificate-of-origin

  - Similarly, in general, you should be careful about adding tags
from someone else unless they provided them or there was an
understanding they meant to provide it (e.g. Tested-by). Please see
the "Tagging people requires permission" section in the same file:
https://docs.kernel.org/process/submitting-patches.html#tagging-people-requ=
ires-permission.

  - The chain of SoBs has a particular meaning. For instance, this
patch would mean (as written) that I wrote the patch, and that then
Naresh carried it, and then you carried it. And if I had written the
patch, then the Git author should have been me ("From:" would have
been added by Git). I guess you may have meant to indicate there were
several contributors -- that is typically done with e.g.
Co-developed-by or Suggested-by, depending on how they contributed.

  - There is some repeated text in the non-commit message part of the
email. Also, tags are written without empty lines between them.

  - Ideally, fixes for build errors contain the main part of the build
error message in the commit text so that it is easy to match it later
on.

What I would have suggested to do in this situation is to ping in the
other thread with a normal email (similar to the one you sent), asking
if Naresh or someone else was going to send it, and mention that
otherwise you are willing to do so (under yours or perhaps Naresh's
name).

I hope this helps!

Cheers,
Miguel
