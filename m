Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01082F43
	for <regressions@lists.linux.dev>; Fri, 18 Apr 2025 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745005489; cv=none; b=KjWeG8LRNB1/fYHicXCBFMEGOXODHWbxv5WmgFeKtxKjFGlbtce3UpJ8JFME9eUYnZixxrA0RqrECyEV2dp5Fi13kSGdeJd9n8FP3AGLUBIDKOQjUwNrxiNQVXDy+XvloiOG9+9hODWK+6JyqrziylPd2DlW08NP6sWOghBI/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745005489; c=relaxed/simple;
	bh=VmITldUAVN4yeDbRisnT/KKRuBjKNTaek+ixSS4e5/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTgQ4DmrEvNEIuk0yqv9rB4dZscVHqpNVNe8Q3vnDx31JVpTCFzTuwbKeUWXdD4EsvdjLBTYLPw5MtyPGU5hRxLzUzbnln6Srd9ZbxhJpDNFBNG25iG8U5QzwIYzPSBSRsnhvLfbY0glS9zR+c/MuVxwqTFgcqNDw3i3kg2QZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com; spf=none smtp.mailfrom=hefring.com; dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b=nd79sbYg; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hefring.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="nd79sbYg"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c922169051so84761685a.0
        for <regressions@lists.linux.dev>; Fri, 18 Apr 2025 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1745005486; x=1745610286; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLauaaAIMDgGRmgJvUInjJwX+d3UVwdMW/GukaI+OmY=;
        b=nd79sbYg5NN0kO0ndnA29j/P33uT0uxsdaWquijIPs2Qjie3azER+pwzCFDK9RPepV
         wxuEo9iH7GSK/L9Q2R/MDGzOj81/hOalSrrnuthbUpTptpR+txsYUlPNZtjPOcWsMlyM
         Gs/nAhx4b7y//pjphVW/8fflUk2VQuhPWXBF6yagDWB0MGFMs2aCdOmBzcbRMUePrGzu
         VfvJHFaBDvCzHd5rVd6wIbT7EqCniE+xARMkxklfNXPSPzdadBcg2pq+souQUIJuRWu+
         7KIEaM1yX5/IE+EcTBCa2+JYBQ+TGSRB/e1+I8LR/NIuMG9VVLrur/vyC7QutiknE9VM
         h5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745005486; x=1745610286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLauaaAIMDgGRmgJvUInjJwX+d3UVwdMW/GukaI+OmY=;
        b=pW0SyaujVqSKynTN08W/CiROu9k0oPo3WTiDIvqJyExI+6MUz3cZzuSdH06L7KbIlM
         knXKW9O8F8e+/LTGSJBBJ53HRkqYbk1Pm1BZbFhC75ZCRXqFXB8U9pYqpKC/B9UTqAch
         zmUPo31TbkVBqpuFfNy0o1J2SAHtKspu64B4XiNLuVKWBEFh4kSkUeKqap+AWwQzhmnJ
         2zETjNT2w2EG/WasUs5YLrGieenX8zKz5P7CdZOFHJ6Ko5z4OKT43rBKmFl5E/NofN+G
         P/RogNCRueMGkt/IsYuPjv0G+RWYdi5hAGOTeUn9nY3i4MbVUo9aAp3LfkOyjgm5iYUb
         wkJA==
X-Forwarded-Encrypted: i=1; AJvYcCXpzk99Njn4RanvJqwMG8iGthN0L1BKbCVRdTWBlAY9+tBhvod+HIrScNoioYnJxfaqx+qiEF+2NsRl+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD/0vJVjfqQpti7L7t1iQODBVrkFEbO2K3LVfOLnyZ8Dgzy3z1
	GZKa5efJtpQAvxnr9C8Jz4FOKlP8ztQiXHzp8TN1ERJ9Le2rLhgsUb9a2gjyKj0=
X-Gm-Gg: ASbGncswqzPh30uYdxhtfTR5YsS9uAY3gOXma9JwJ/ywSEDpeZXcKOhiwVRfi5klavK
	SZ/+apeLqVjLOQ7CCXDrRw9zZU/DjZPnXxgkmpPEKFr/m8C550bU8jusUlPbTTpKbqksxOACiuE
	0VeM0I4NyS5h9DbyA/EffFSYAjWiT91Gg6wVHjjeqQiELkvnAHv3yPOy6wWKagRD1rQjc87BI25
	GSkzRXqkkfo1xOEzH4XyDc9ELNu761HxX/KxNz+Zw+D5Oe8oTsb+ZHrSicczD49EcyJ6mY/3h4n
	z+30dfl/2J4tIFOTrVI3EvnpxbE/ZlkxH8TieoHYtqyZSNZgA7LImGrHBw==
X-Google-Smtp-Source: AGHT+IHi1qEGGO/9pcvHTp0Xydqxo04Oz9IXipqF7+K166+yoLclI0eNGI7rSM4ss05GvLdt3ykMpw==
X-Received: by 2002:a05:620a:1923:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7c927f55148mr672289585a.8.1745005486577;
        Fri, 18 Apr 2025 12:44:46 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac131asm138758985a.56.2025.04.18.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:44:46 -0700 (PDT)
Date: Fri, 18 Apr 2025 15:44:43 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Christian Schrrefl <chrisi.schrefl@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
	laura.nao@collabora.com, linux-kernel@vger.kernel.org,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	rust-for-linux@vger.kernel.org, torvalds@linux-foundation.org,
	Nick Clifton <nickc@redhat.com>,
	Richard Earnshaw <richard.earnshaw@arm.com>,
	Ramana Radhakrishnan <ramanara@nvidia.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
Message-ID: <aAKrq2InExQk7f_k@dell-precision-5540>
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
 <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>

On Tue, Apr 15, 2025 at 05:38:54PM +0200, Miguel Ojeda wrote:
> On Tue, Apr 15, 2025 at 1:40 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > On Tue, 8 Apr 2025 at 00:07, Miguel Ojeda <ojeda@kernel.org> wrote:
> > >
> > > On Mon, 07 Apr 2025 22:58:02 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > Regressions on arm build with config rustgcc-lkftconfig-kselftest on the
> > > > Linux mainline and next failed with CONFIG_RUST=y enabled.
> > >
> > > > Bad: next-20250327
> > > > Good: next-20250326
> > >
> > > > Unable to generate bindings: clang diagnosed error: error: unknown
> > > > argument: '-mno-fdpic'
> > >
> > > I assume this is the arm support, i.e. commit ccb8ce526807 ("ARM: 9441/1:
> > > rust: Enable Rust support for ARMv7").
> > >
> > > Clang does not seem to support `-mno-fdpic`, thus you probably need to add it to
> > > `bindgen_skip_c_flags` in `rust/Makefile` so that it gets skipped when the C
> > > compiler is GCC.
> > >
> > > If you do so, please double-check if the flag could potentially alter the ABI in
> > > a way that `bindgen` would generate the wrong bindings.
> >
> > I tested this idea and it works but I don't know enough about
> > rust to double-check if the flag could potentially alter the
> > ABI in a way that `bindgen` would generate the wrong bindings.
> 
> Yeah, it would be nice to have someone knowledgeable about the
> arch/GCC/flag confirm or not -- I don't think Rust knowledge is
> needed, i.e. it is mostly about how GCC behaves with/without the flag
> and vs. Clang (since `bindgen` uses libclang to parse code).
> 
> The original commit adding it to arm (and similar ones for sh and xtensa) says:
> 
>     When building with an arm-*-uclinuxfdpiceabi toolchain, the FDPIC ABI is
>     enabled by default but should not be used to build the kernel.
> 
> So it sounds like it is only an issue for particular toolchains/targets anyway?
> 
> Cc'ing Ben who introduced it, and the arm port GCC maintainers in case
> they may be able to tell us more -- thanks in advance, and sorry for
> any potential noise!

FDPIC is only relevant with no-MMU targets, and then only for userspace.
When configured for the arm-*-uclinuxfdpiceabi target, GCC enables FDPIC
by default to facilitate compiling userspace programs. FDPIC is never
used for the kernel, and we pass -mno-fdpic when building the kernel to
override the default and make sure FDPIC is disabled.

Therefore, it is perfectly safe to omit that flag for kernel builds with
Clang.

Ben
