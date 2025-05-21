Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE5118BBB9
	for <regressions@lists.linux.dev>; Wed, 21 May 2025 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836442; cv=none; b=SpJC/QxcFAuVf9IcLZCM0ioL7rD7viYwWGZf2dUdxh8v/vEyTsqWBTfIG//Yly4fw/Q1J2h4nxlOlw8D/RwQmkU6N3mJX7mmVGN6th70LpM/LVV3oswbRdcgyLSSrGjTyxipd+mERwZ5LYhq+ZpozD0ZPw+JHLUdLEmdkSIAGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836442; c=relaxed/simple;
	bh=wCs14DxQ5NqkyOeBSguPQlw1Wnbae96Ke81Jokz+gII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA5bp8Leu29y/HHlrqfT19DD8e+MmFRb4DUyIZJPgVyQgRw03HC4KyWa6R/ejBAiyvWglSW4SEDmOzsQ76uLfbeaNswbO5kN0mZa6snm2aBHTpwicBXtNasY5U6ILTI5TlIS97bwMSA8NlPl5QtN/jq1DOVDflGcn2JYK1nk2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B89/wFdc; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B89/wFdc"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30eccc61f96so757595a91.2
        for <regressions@lists.linux.dev>; Wed, 21 May 2025 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836439; x=1748441239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCs14DxQ5NqkyOeBSguPQlw1Wnbae96Ke81Jokz+gII=;
        b=B89/wFdcp/KNuEkaq9jhqLzMB4wuIFicN+NYmy90YALd7kqdTNDL9q67Ts4zG4K6n/
         9kz7DTNzC0aEpjiEA/8l51h9LE6hOxP7zhmInyU7doG/P2G3VodH9ruhw4lO2lNyxWhX
         Meq8acDgcmbx/jCBq+b4138J3AP9W54WD9ZnO80BgvcI8AdcKz5QR6wORmMspZMRFVbg
         8CuhIGV5VZLLyV5Hk5c7oxZXnQmZc47VoMsmneGZ8VUXxTdnN0NRlUjrWHoXI8l8HSZl
         h5eDAPXVqzyY6emMaBn7+4N061iUKXqC9BoVt0sSobETRHHHh/rwgAGeDeRqKMFjYhLA
         ie3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836439; x=1748441239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCs14DxQ5NqkyOeBSguPQlw1Wnbae96Ke81Jokz+gII=;
        b=YHA+K+IJKm1V/Y84wcGHep1smNnwy9m3fzMEnekFXAZW/dI3u7+/cLmB8AWQ7SJ+Bz
         kkHYAjr32OLhHXk+hn2W0aQYyonb6FijSrjGVyzmYIkfil8/+ug23XA1eJRLOjjBQ+un
         ddezkNQ+BQtqdIaAsV4ZNt+rQKrtb17IeHl4kd7SpmGh8Z2Wbr0XnULg6QUympJdRGzW
         paolx4C8lrJ0VML+cqXYSpsQjtx37HhAxABI07hQ8+Fa5mSw0n6l9Q9I7mbif/Zvsl0h
         mScZlt8CRcxCFOftP/GUlm78vRLAMoQWmc5ZQqbFxyeYX6IzvDX4Un48i87hEH4anZSW
         0s6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoC0/L7yBsxi6qMXP4AehS8u9fWUssrssEAYh9ns84dCwsgJNOedsGYf2IEIlngmZ0AlU9b7X8BEQ79g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2iU4Ao12b0/+rxY2S7SWHzravJSHNKgfGjX8enBZipWGPy4yR
	qxiQo4uprJ97YJEfoY8rDfbVH62+TIx+UMNxbnSDdupaBZz7Sx/92aslMXE3U02H5dAVTJDkqhq
	BzthvP+l4uTolekTOP0EmPSzfvuXnUEs=
X-Gm-Gg: ASbGnctUsA3Nnt9DQvn2LatKE+cJyYtT7dLyK4h0WnhCQZ/I2YfZ+ghAgKQbeXptG0K
	092fqzKN0vZ4n/dstAipUCkCXPZs/wpjdDkaeAaZ2HGcIOE+UNXWNSTc6s7vNbLCEJStLMwRwaC
	5CC3ULSQ/PlAQjYE+WNz2oGRpnC9I/yBeY
X-Google-Smtp-Source: AGHT+IF6aBM/50Jwx88vE8L8XntLzVmxeGWByLSHx68fUNc0gFsjGteE5FCLep+weivc24FSmszHPWH/N29VR+FdsN4=
X-Received: by 2002:a17:90b:1b04:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-30e7d5bdb2bmr12445110a91.3.1747836439087; Wed, 21 May 2025
 07:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
 <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com> <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com>
In-Reply-To: <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 16:07:07 +0200
X-Gm-Features: AX0GCFtcjHzj-d0hFEXFvN-nr4E6i5NNd72l4twkSGnegqafCiAQwJElREpdn5I
Message-ID: <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>, Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: torvalds@linux-foundation.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Wed, May 21, 2025 at 3:57=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> This does, thanks! I'll drop this patch for now then and will assume
> that Naresh will eventually send it. I was hoping to get this in by the
> stable release that is set to happen during the weekend (doesn't excuse
> my sloppiness though, sorry about that once again)
>
> Anyways, thanks for being patient with me as I learn. :)

You're welcome! :)

Let's see if Naresh says something; otherwise, I think it is OK to
send it under your SoB after a few days (acknowledging the diff from
Naresh).

Thanks!

Cheers,
Miguel
