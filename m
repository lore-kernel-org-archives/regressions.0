Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2E191F91
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501981; cv=none; b=CKqNGzyA/nqNrPa6l3qdXILWVrSx8NPokqMlFCniIIYyK5U/Ba5mnHsUDKKVhQ443mQmVBVrIeLC+SrwiuteNO9mFs97dyLtAhtv9rrnhrukgxe5w3aZYiFUxU/QQhuNXjdTZ+QH/44uQMaUH7a8WnE5uPk6IdI1V2H0WMvWZ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501981; c=relaxed/simple;
	bh=tup9ty6E85TqqyX4LCy5mGsqmAz3JKnWrm9yplFxREs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsKF/P0n78fkFvslJTpaDdOcTf3dSnaOA/LPl6bJneg8/BSlANxty/zNGVx0pdaaUKlBCd0A2N9tWzS4dYuOLPP+jciP1C0ewU+wG677YfxVxFTDuTstGXKQTfP7gWnj2LfqlddWea9TkSdGEB7nZNNXzYHCjWME7gYJCs5Eq2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com; spf=none smtp.mailfrom=hefring.com; dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b=sLFqOc6Y; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hefring.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="sLFqOc6Y"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c53b9d66fdso150511985a.3
        for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1745501978; x=1746106778; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWMfkI1WRY3cYf9FnHsr+03ZRcmNsaavRSb0tETeg20=;
        b=sLFqOc6YpDwG3mn2L81IpV5u1e1dTwa5by2H6K246c5CG65UOQYTJVNjcZGzKpkb+n
         vDmUhJNNLDhBKbS+jJX2acVYdAVLt8r2i87uNViUlPAEQ65okIxdnSqtv+7xgvJHlHHw
         2B/V2vjjMPYHNLzzppcC5DlE8Cwk4SF0EQ0NT20hZmXvS53MHvYjDNUBVu7V/XRN3NYk
         nh5XcyJer9E3be/Q/DjdieSmLG/PlPHiN4V1gQ5GH2xME01hv1D8VveVhHHXIk0w3xdd
         X5Wp2nCC2/NcNgY4ihdDMpKKGuR69NwPU7ZEiccHy2/pvCxgk9lgpWkn07VVVv4TOkB7
         2w8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501978; x=1746106778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWMfkI1WRY3cYf9FnHsr+03ZRcmNsaavRSb0tETeg20=;
        b=MC9FPkDkGg6l73DwYMqMq3t3g7OiqV2bxMvR0HYzZLFRvtGXAQ2sRAOlF5SbSA3vVe
         uhRuayzhT0z38gtZlehT51Pn5TX0kpm8k4P7y703Yg+ZxWr7bQhSOSQZR6ECvS7W31mb
         UQpEuHRfYC8ZDrtgtzCWUJnm5p2iXkBusmpwStxXc8EoqXv40LttY2UOt2//S17wrx22
         C7asoN6QfspqwvYjqBHLaOQ5FQMXu8BCOy/7h+/QLsjvDpqmRSZ6PLwxtclcPVJsXCJi
         f3XYEvb+h5x5NxuAFh6/MBO8r6qnMBHzAvIcsQ7rQ8+zSr+kx5688XqnnP55V9NSAR5H
         FPMw==
X-Forwarded-Encrypted: i=1; AJvYcCVDLzUjC9KXblgJu/8vr1iZUJZU5SYuWy9M1WUoPNl592HLUOgbOEnIVOYyClNcd7DsrwVgUmpUuS1hww==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGE2aRuNWj+l6H+ZwEoWhTHFoNyyEyUfwjo05Kz3QQJNHd0pO6
	wDckPw0XbInDfFpCSegiNk7VuGnb5R54ABXtZVrfI5B16wA+9mEtdsBQE5z4ubk=
X-Gm-Gg: ASbGnctolFlUqZn0bv9bhwJj6RsBj9u8TxwtnE27c6GfFQaRazzWSzSxf+aSadtU2NK
	2XYXmQ/rRdi6ue9lsSbx5jCcwB5tgcjgU6W34gEqYj1Vo4QKY6+3Zi3v407ZjdEsfcWflmREmSh
	h4cCqEUgPF/1TyyHZOyVyXvEUM9fMtxDl1UDveNAAkeSugvVMjGXyKghZRlKqRapHBpOGBE4y4g
	NERnitowC7+XvqgyNJScKjlZjSSBe9nl6w+jUeKdc/6r8Utw8yUb+NwqfUnUc8XQjdlZAK3bmOO
	dBEs8kJFwdOeCUG3G8dZBgKOreKpismB+e4B/MbKASmEWuwaAwILwg/S3w==
X-Google-Smtp-Source: AGHT+IGBbcE518ngciGGF0+eLjyFAC+mlK6EuUeB14SDh6Nm7kNgxryaWfeo2bDtyypKwASpBUSZdQ==
X-Received: by 2002:a05:620a:1a07:b0:7c5:4c6d:7fa9 with SMTP id af79cd13be357-7c956f4aadcmr432561485a.49.1745501978313;
        Thu, 24 Apr 2025 06:39:38 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c9589cc670sm89847585a.0.2025.04.24.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:39:37 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:39:35 -0400
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
Message-ID: <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
 <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
 <aAKrq2InExQk7f_k@dell-precision-5540>
 <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>

On Sat, Apr 19, 2025 at 12:30:01AM +0200, Miguel Ojeda wrote:
> Thanks a lot for the details!
> 
> To clarify, this is for GCC kernel builds: skipping the flag is done
> for libclang under GCC builds (because `bindgen` always uses libclang,
> and `bindgen` is used by Rust to understand C headers).
> 
> So GCC will get the flag for the C side of the kernel builds, but
> libclang will not get the flag because Clang doesn't recognize it.
> Thus, if Clang vs. GCC differ in how they compute the layout of some
> type, then we would have an issue "mixing" them.
> 
> As you can imagine, GCC kernel builds with Rust enabled are a hack due
> to that, and it would be ideal to get `bindgen` to somehow be able to
> understand C headers as GCC does:
> 
>     https://github.com/rust-lang/rust-bindgen/issues/1949

-mno-fdpic disables a GCC feature that we don't want for kernel builds.
clang does not support this feature, so it always behaves as though
-mno-fdpic is passed. Therefore, it should be fine to mix the two, at
least as far as FDPIC is concerned.

Ben

