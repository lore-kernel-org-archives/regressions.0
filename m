Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE19F20A5D3
	for <regressions@lists.linux.dev>; Fri, 18 Apr 2025 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015416; cv=none; b=sbs5T3jqMH7eKTO4KhXhtk2kGD0taiXKLwkj/ZtpLwlQEkLuyHfbBt0TY5APjWt3PVXwiDuubEEZlaX+SO8JUagrgiPXp+ZWtatgvvTZVuHJYYZA0RIb95x8DVz4j4qSi1y8e/P/p8vUk6zW6Xt8DVwQhuoJ6XRTGGyZHaOiXy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015416; c=relaxed/simple;
	bh=zkoZNkcg8xsjJ7WQXbeltGuC11SYz+mHZwZh4tJ2mXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdzkYxIx45q0lcgUGmMHB413cMkbHEuf1f5pT7r1gUCswggJSzlG4+uD+SKXBWxtaT5Xch4mVCJyLkghG+1bepICQ594F85jDh3ddPIC7kpzzAj8T+upoLyoqm0CY7TzHRtlf7tIFQw2N+GXA7fdimmzbF53M+TIaTou0+MbYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWHkgLyX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWHkgLyX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7373aa99e2cso201565b3a.0
        for <regressions@lists.linux.dev>; Fri, 18 Apr 2025 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745015414; x=1745620214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mpl3W4dIB2fYN/5rZ3qoigNWiCJKGydTdscNJ2zvlFI=;
        b=IWHkgLyX5f+cYou+nonUujvFXCFMSTozO/NQLniZQbRpWU+f/pqpjJYtSz2GhlBV+g
         DG2A8p/AT7k1BQf+zt1QMrTO5VfmQtcK2ZjZacN0qInosFNNbb4jKYOAqLlTcdUQnF7p
         ptLDb9aHK5IbtodyMkDzzBZk0M2LqpQzsOdOKAWZ8GvJ5r0qY8mv8dHCz8mBY+/9AMgQ
         fgQzZR0b5tKBTzeKhdcZ+m3GVpZU82q9yBfxKvZO/HI0o5Sauh4xhrE/15oQdNJnKikY
         mI2t3aqGW/C5onw1V5Bko/jscIYaYPKcy+cIObhElCxnKZUDI08WWIDVgGMBB2j23qPW
         1Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745015414; x=1745620214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mpl3W4dIB2fYN/5rZ3qoigNWiCJKGydTdscNJ2zvlFI=;
        b=aNO7bdJJOF8xlDQ6Xd2XokzIouFi68W38gpAXIUr5HzAwtoLQYlHsihAZd5iIVROl7
         f8nfcqtxHHrYw7Zmk3hTCnemZSuk3Qd7y8W3Rb/Rl5fvp/XgbHrw+s4xntTY+bbQW4k5
         WycXwVRfp5hr5eAZ+gy99F96Q4+a8PHLrtg0IHn+MK+aNQGpfUiAldaGfgSoYxkRTzmV
         8+sG+Sf1g1QK9mS9bKstBik5MYqOwRWtQDWTlcMxnDtTZw4pmlISeNT1JZOAHyKO+hUc
         heCRV+RgSQ2SJ8J9dL0/2FX1YmsHbODX3NugDuefKVBya2D0YSSDEAJyeuHd2QlGR4hY
         jFJw==
X-Forwarded-Encrypted: i=1; AJvYcCX9zXVc/MQYBmdgNYtp9KAq+M+BuhWlrWfvMISPcCwVl/pAvQGiFUCfbdQ7YY1Uz+/kiRAgwwJivd4p8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn60+EEBSmpdkyKv2NGqtBV4FExb8vrVRxytnTdGq1SoLn6wCC
	6RGH+EO6QUMHs3Q360rSuXFqTdXqrCm6B/5Y+3SMufOkRRmgHP5m3EGi0S0HDYFQcoY2TvR5EZr
	XjSNj0aYgxa6Txbn+CrYMFzv+P6I=
X-Gm-Gg: ASbGncsqOFKKRebQ8lUyfYARediax7W0G5lsUhQ4fIWPcuvte3xkxfdn1EhPnMQDiqf
	gw/ruoaz65S16vSJwxbgIrKQvYnYc78k8th4waXk+GPRxG94Cg6i2V/D6ajAYlIlBLfQ7j27b6a
	NxI0nmMO+SPmUJ+4czzmmqlA==
X-Google-Smtp-Source: AGHT+IFn8FiE8jazdZ6wyVZ45DOV0C3nC7qTp20z9exYfm7HJ2BvJ9N8pN3jaM48vWusyZfaTNpZMquqz7M51hKOKcY=
X-Received: by 2002:a17:90b:38cc:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-3087bb3f2c3mr2159127a91.2.1745015413940; Fri, 18 Apr 2025
 15:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org> <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com> <aAKrq2InExQk7f_k@dell-precision-5540>
In-Reply-To: <aAKrq2InExQk7f_k@dell-precision-5540>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 00:30:01 +0200
X-Gm-Features: ATxdqUGpBpE_G6Uu2qNpTDVaVBlF8fn-vW8cLwwPBuctelO67ZKLVYcatHIb9lE
Message-ID: <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, arnd@arndb.de, 
	dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org, Nick Clifton <nickc@redhat.com>, 
	Richard Earnshaw <richard.earnshaw@arm.com>, Ramana Radhakrishnan <ramanara@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 9:44=E2=80=AFPM Ben Wolsieffer
<ben.wolsieffer@hefring.com> wrote:
>
> FDPIC is only relevant with no-MMU targets, and then only for userspace.
> When configured for the arm-*-uclinuxfdpiceabi target, GCC enables FDPIC
> by default to facilitate compiling userspace programs. FDPIC is never
> used for the kernel, and we pass -mno-fdpic when building the kernel to
> override the default and make sure FDPIC is disabled.
>
> Therefore, it is perfectly safe to omit that flag for kernel builds with
> Clang.

Thanks a lot for the details!

To clarify, this is for GCC kernel builds: skipping the flag is done
for libclang under GCC builds (because `bindgen` always uses libclang,
and `bindgen` is used by Rust to understand C headers).

So GCC will get the flag for the C side of the kernel builds, but
libclang will not get the flag because Clang doesn't recognize it.
Thus, if Clang vs. GCC differ in how they compute the layout of some
type, then we would have an issue "mixing" them.

As you can imagine, GCC kernel builds with Rust enabled are a hack due
to that, and it would be ideal to get `bindgen` to somehow be able to
understand C headers as GCC does:

    https://github.com/rust-lang/rust-bindgen/issues/1949

Cheers,
Miguel
