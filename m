Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A919D089
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480217; cv=none; b=ciAzVyKDz21qwnKMFfUyY5x9++JBCsdE9ttQVaQ9uDZdWGkxbWEbxGz58s9K7iTM0SSUAHPpeSBYTN1Qna8AvMdEKI8esnGyXoe11UR7+hLJd3ObAtCW1ykTnHEPtp0HD/wuNqTuEOGY71tLNIJBDsNim1l9bNxxntHT8gr3TUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480217; c=relaxed/simple;
	bh=i8O+uZUxJvitzxO+GEB6MrzAKW3i24r0zpb4JuO31xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WoIroccM8KsTv2CugFmFZhH894maIXVjUKg8LXQCLhkYfWleGTfMVI/+IN1W1hGrJyKPb9c7+PWcrf2w9KHz5OjyhgQG/doJ/hwYR560OkJnFwV2nVxCXGnbIBX6jTfcWOmyNW/n99J1RsOc64GXK8D0VdKeGql+GFFZfluspNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CikF0TVB; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CikF0TVB"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e9ba45d67fso21798937b3.1
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730480213; x=1731085013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxE7WaVgo5r0HZcP1X6U835BE06QJIdzvrF7o7xI5VI=;
        b=CikF0TVBPL60Wn89PiWq9CCw7IBNep1t+5jCGIT78oAtaiDqyP4yM4YUiBauylaD+Y
         3ihmHsOU1bnKWMIJRVm9JvziAuL7NifWYX0zxyeOzp6ge9hLVvpSm4AfzQyV3T5HkkvE
         +By/HlaFWYwcPb0fcJyXWTdE8KyiPrw61W73zYXROT8vE3ejVRTYZv2f1mMqkLFWYDsa
         22x/CpY7pTeMJx01zqgzgnnecV5OyQw26pScODRQaZORjnYUF8dEVf5eY0rLd3w4xPKv
         rG8gIMIhoGll3knYpDkMdJbzrnChgm2MM//NYVNV6nTI3Su3J8SDG1/335+aiNwG/KPd
         s4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730480213; x=1731085013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxE7WaVgo5r0HZcP1X6U835BE06QJIdzvrF7o7xI5VI=;
        b=ZKHIcN+5lpcQiTaIX4HAngmVrMlgb1ct62XonsmjOqMVbFEiOBuKgAicAqciUz03uR
         T90sEhL3F5ITqjfm6bPXnxxMvS0EdqFJm9iulNrE9/cuYvueaIleXsLYgBLjLN3gA/ne
         UMxUayoTmRr5+XUlkYU0EHmv1FukbAJxn+xernOJ3Ma9SKjvNL2L2OSdbJSuvDk/7AxS
         j+lkwf6gQQNz1A0uX0bjJPXUlRgrBf2NW56PZpaLADiBRQ7D9KnexzK3nMzXMQfXWdQg
         luzDXjXO6PyRjYyAbXe45Db17wxbvvWitjEck8lwNy+qNDUeFpfLs9a7UifKKnauyiAr
         gk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdy4qdzb9Qg+ClJdBetWuU3DKV8ddyeMPhS04KbORcmMc53/YqAwrwvNHTqzd40oknTtF/oLQgrp86kg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGGkeFvYGBTcyrsZUmdmyB3gAWbdk7DCOrSYRbO9CP4OB+0lmN
	aXnels2ufa5jx6TSdswePCtpNUgTSXZAckuPsg3O9JKje5N6R56AGuw1lYWGIZjg3C4dUl6lhAA
	cDxCgMSJSTif5NEcUNBOUMchrHJG4y4AVcoSp
X-Google-Smtp-Source: AGHT+IFrUTWzgyjlHFLv35YIhawUguqiFZlN8JkVX36bMb7nh64mC/bvCf2Gq6Oq2P3WorBR5lRH5khSJFZMf6kJNg8=
X-Received: by 2002:a05:690c:1e:b0:6e7:e76e:5852 with SMTP id
 00721157ae682-6ea3b96aaa6mr155834947b3.32.1730480213140; Fri, 01 Nov 2024
 09:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com>
In-Reply-To: <20241101095620.2526421-1-aliceryhl@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2024 12:56:42 -0400
Message-ID: <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Alice Ryhl <aliceryhl@google.com>
Cc: naresh.kamboju@linaro.org, casey@schaufler-ca.com, 
	anders.roxell@linaro.org, arnd@arndb.de, brauner@kernel.org, 
	dan.carpenter@linaro.org, kees@kernel.org, linux-kernel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, ojeda@kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 5:56=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> This brings the Rust SecurityCtx abstraction [1] up to date with the new
> API where context+len is replaced with an lsm_context [2] struct.
>
> Link: https://lore.kernel.org/r/20240915-alice-file-v10-5-88484f7a3dcf@go=
ogle.com [1]
> Link: https://lore.kernel.org/r/20241023212158.18718-3-casey@schaufler-ca=
.com [2]
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/r/CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEz=
JazDsdk9o5zw@mail.gmail.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/security.c |  8 ++++----
>  rust/kernel/security.rs | 38 +++++++++++++++++---------------------
>  2 files changed, 21 insertions(+), 25 deletions(-)

Thanks Alice.  Would you like me to pull this in via the LSM tree with
the associated LSM changes, or would you prefer to do this some other
way?

I'm going to merge this into lsm/dev for now so that we fix the issue
in linux-next, but I'm happy to drop it or do something else, let me
know.

--=20
paul-moore.com
