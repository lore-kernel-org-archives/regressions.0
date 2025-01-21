Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC61F3FFD
	for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737481569; cv=none; b=bW7DEiWEghgKE8AGUwj7Cm7rUkBopxgD96nCU4KzpzygUXexh7q+qu78PtnJxu5z0pMpabLMht0Dbta7hOkQZW+SkjyEZS331q8DNYwUjxePejeKintXoNRzG8opRHXxfHT34uKrrFgylbFMPoA5Wkhad317rPoalf/kk6GtP3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737481569; c=relaxed/simple;
	bh=uolMWjkRwog15wLHtUnNAgJ2+dDra/fTMVYKCdY/71I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PArzrVEj5THcG/O2n297w2EG215McepGFHyxJuSLtbaeA84JVjyYUbR/y4cgxkdl5w+GJ/fK7zpWNa1HWWWk01HcdrlI8ltQIA5jaUmFH/B/q6a+7sqHakNaYhB+ljF/TEn6h7Aex+wYxBwYIfBFEXdxDbt5amo9nkSLT7gWBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vSM5XTgd; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vSM5XTgd"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467896541e1so4901cf.0
        for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737481567; x=1738086367; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx8WAbX+Bf/ENrO43oH1TTXYHStkZFkZKs48Y9wFiVw=;
        b=vSM5XTgdLlb8w6cnaHSfvUOq4ES0Y4weRL5b+f4kt/Lqrk1gvljzvr/1+rA9a3jdDp
         ekolyOH+C1tWhgkh9UHX/IRFHEujpOx+c5/JEiwgl4aYo/m+9ZQG9Z6BLBM2gAjT5Ly1
         r3jZzVI3Tct4w5kc5pDw+9aDOUw8WUztcmd9COMf9iX4fmME8fiN+tGv5wGDYWtp7Xvl
         K68m0xKG7OltreCa3+q+WRGsWD8EXzgYsv/L74Z8/OK8gYTOwK//ctfBWhuWmsyAfRph
         p4YCB1h+jsFdy8rXqAwG/ngmd95sy05M94nYYpdkOlfbwtdbVo/4AwRD1Z6Wtm7KEHqC
         /9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481567; x=1738086367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx8WAbX+Bf/ENrO43oH1TTXYHStkZFkZKs48Y9wFiVw=;
        b=UQRzG9PSRB7Vd856YnfoPr0oe1z9vNNayEzIQB2rJOUxYj3ibgk6oX1uCmWgVzZwaa
         WHJXf3adkjEsJ+AuWEvGQ9w5m8gt/kXTnDQLWMAOcshICe1Fohdw/H9SegVyglfBBwOk
         fdczy1YSTkSY61u4ZnSDgFKR/HKHBQJQhLzJUhQjZz2FhFTsg4cItp65YEuR0vqU5/UP
         egW35ydqyQCFI8hOIlpW5SRmNi8YUmuQBjsFKVj8Jk4uKbpQrgD/B3CIn49Fvy61DCPW
         rBzds6RwbNW+u1Vs33MbCBtb9cQQ9we+5u3PnfPLaLpiYLcaSWDFDn5zieOw1oq4Vvoy
         tDhA==
X-Forwarded-Encrypted: i=1; AJvYcCVCuOCW9bptRfAihnABTtSIzGHXG1BQfJR4vu+pQ/h7KQrTO200Pkw3kd5riOHWdipuIjlaKptv4es/jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAtZLBf2vk7OeDGgkGNBRc1BFvpofTEvukjD98if7NwB7tK8ui
	qWlqNEAiqY4Y/5v6j6dP3IraLct/X0avxSmGj7kzijU3+Wv3AOy+f2SdhKD8dVzgKSLx0Y38xo6
	urbXWXodZXEiGEMKrwIpP+WcG4sVYnrA/zA/it/hhmCkCP4hBWQ==
X-Gm-Gg: ASbGnctwSDKoTxxMSaFDs7zI8rlfW0sA2v6++/49/pMnTgSj/tK/wp1+m/3oQ2mc8/V
	oovQD2vju4/nsCBRgaE/Vhm7Gb5oyqWky2NH1FctpwL6DBCL78ypT+fdM1YpBmRnc6O2HZBLMpR
	JZm/va1A==
X-Google-Smtp-Source: AGHT+IGd0/Z0rV2uyahLRAJzwEWM90n2xUjYQM8Nd/X2t9nhAEmY/ceslLrJI2CjEt53OBeRuRBjrcmowYTHlHU3kK4=
X-Received: by 2002:ac8:5f4b:0:b0:46c:70b1:c5e4 with SMTP id
 d75a77b69052e-46e21081d40mr11291001cf.3.1737481566464; Tue, 21 Jan 2025
 09:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120212839.1675696-1-arnd@kernel.org>
In-Reply-To: <20250120212839.1675696-1-arnd@kernel.org>
From: Rong Xu <xur@google.com>
Date: Tue, 21 Jan 2025 09:45:54 -0800
X-Gm-Features: AWEUYZmEwIAZYDGYiWvXqx4GdOYlgecHA034aBbe62gbYaNi1kci1k83ZczQ4hI
Message-ID: <CAF1bQ=QFxE8AvnpOeSjSeL1buxDDACKVNufLjw99cQir0pyS_Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC, DO NOT APPLY] vmlinux.lds: revert link speed regression
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, regressions@lists.linux.dev, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 1:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I noticed a regression in the time it takes to fully link some randconfig
> kernels and bisected this to commit 0043ecea2399 ("vmlinux.lds.h: Adjust
> symbol ordering in text output section"), which (among other changes) mov=
es
> .text.unlikely ahead of .text.
>
> Partially reverting this makes the final link over six times faster again=
,
> back to what it was in linux-6.12:
>
>                 linux-6.12      linux-6.13
> ld.lld v20      1.2s            1.2s
> ld.bfd v2.36    3.2s            5.2s
> ld.bfd v2.39    59s             388s
>
> According to the commit description, that revert is not allowed here
> because with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION, the .text.unlikely
> section name conflicts with the function-section names. On the other
> hand, the excessive link time happens both with and without that
> option, so the order could be conditional.

Yes. The order could be conditional. As a matter of fact, the first
version was conditional.
I changed it based on the reviewer comments to reduce conditions for
more maintainable code.
I would like to work from the ld.bfd side to see if we can fix the problem.

-Rong

>
> I did not try to bisect the linker beyond trying multiple versions
> I had installed already, and it does feel like the behavior of recent
> versions (tested 2.39 and 2.42 with identical results) is broken in
> some form that earlier versions were not. According to 'perf', most
> of the time is spent in elf_link_adjust_relocs() and ext64l_r_offset().
>
> I also did not try to narrow the problem down to specific kernel
> configuration options, but from my first impression it does appear
> to be rare, and unrelated to the Propeller options added in 6.13.
>
> Cc: regressions@lists.linux.dev
> Cc: Han Shen <shenhan@google.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Fixes: 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in text outpu=
t section")
> Link: https://pastebin.com/raw/sWpbkapL (config)
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index 54504013c749..61fa047023b5 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -588,10 +588,10 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PRO=
PELLER_CLANG)
>                 *(.text.asan.* .text.tsan.*)                            \
>                 *(.text.unknown .text.unknown.*)                        \
>                 TEXT_SPLIT                                              \
> -               TEXT_UNLIKELY                                           \
>                 . =3D ALIGN(PAGE_SIZE);                                  =
 \
>                 TEXT_HOT                                                \
>                 *(TEXT_MAIN .text.fixup)                                \
> +               TEXT_UNLIKELY                                           \
>                 NOINSTR_TEXT                                            \
>                 *(.ref.text)
>
> --
> 2.39.5
>
