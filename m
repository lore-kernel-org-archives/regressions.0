Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF8288CB3
	for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717260; cv=none; b=JNYPTPA+Ct41KKrqDs9kiO8m8L5kw2SlTxhMeebgzvGGS7n1wnsdpenazBWr2BvPHjVSJlxrxi/IoSUsSACclrG5GXsQ8k18PUHeX3ZQiaGUVhf6HHd9ebDSvca2Bn8Y8ZYS0u5Et/94bTNPlW0GEhHh5PwcdEnYdeaU+mp+puE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717260; c=relaxed/simple;
	bh=ZJ7OpKdka1F7ZBFYQVrdJ8oxYihNjUeS07C9hmUDydA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWIk2G2Npk7Q4q0FiXD/RyhDNTQGHmeoi/m9ogwN9hTyM179D4P/gOGF57RCU0sWU++smeCpJB+q5afvj88FylGGyktRHVtdgoXAp9fowIf5kLjsuwA5PMWQTWW7Prou8x8WTUn/VKxSVfjhyYXB+A2+3yRHTVisKMQkB7F3TXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvUPBBla; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvUPBBla"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c4ecf86e8bso126643137.2
        for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744717256; x=1745322056; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5wyWC2vD7HP03u0+k9/k2OZ1y4kWaoLC9/4tNgnhE0=;
        b=xvUPBBla2nAlipbHjzyrAymFFKAwTQ/zBvwu100vrbXGygByDSc0ih+iQXdAvh16EP
         UVb1+l15VDA1OQnT5UqYse8Hzc/UMpSxDIU1tO0PTsZrthGRghqoMbfjgfrj0ju7nYJ6
         7BNjiRKQZpqXGcmUblgV4z7+ic1rMv3tKvnFYklVJrJI2bBPJ8YonWJVG/ptXjIk86pi
         McAxaxbXiaDhrGzUwoT1QaBBu4G+xz4tMJO3JIwBAeJL/81lYjAfyng3AJl/nA91A3MC
         bhQHeHfhIg0H3Nz4vfujW3L2JKpUW0qc/qiXUaOmkeoDuaNh2X8DE8GafKw1JJEffLBi
         4rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744717256; x=1745322056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5wyWC2vD7HP03u0+k9/k2OZ1y4kWaoLC9/4tNgnhE0=;
        b=L4eCR6KeDGtMxwBaWC8GS6rGGISi1lXhhov4ZG5rt6bj1Fl9l96ClrfCkzEWyiEzRI
         w+2NvWOPpjWG/NPhJyhzxczBg8QRIFCo9gxZeLCH13ptTcsrwH7kaUqIOfNz7/zonzGV
         zQFV/a6QpqnIlOXOrzLEazHC7uAt6HbW7WDj9FHoyQFC/4s0/UV7AGJu6MLD5bsXt9AQ
         Z50th3IsZgfZccSAtfp9ABZTzDUgQPWhFqawz76VUe7vkg6TlkcS4HW1WnXbB1syKZ8o
         E5cu9plB53KDMSe6F/j0ETsrvmeFD6xSs8hcaeIZ6Yr0yLfHZeNXx98EhguPlE3TdftN
         79tw==
X-Forwarded-Encrypted: i=1; AJvYcCXNf3nulIBUluQ4xqulUCvLzt/5YeN8qr6ZAQytN7ZrkOF4+zzHzaBOpOoroIpzgdY+ABgRWF309qToRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ0t5wfzJ8UIPEG2nqxbB/LgrwbBQJ26FMNT22Rb5/c2TA+K/T
	YfoqBce5Va5hjmnq0dF0+q+0p+uhN+KWA/9DvdZKiIKfKmVR+eRF1aQqiYQtEIfc4xjt0la7Czf
	vIWKLRQD5mxY0i4zC9wO4pTesH5hx4UpKeW8tBw==
X-Gm-Gg: ASbGncsKbmpMXKX18pP4TBSI1vd6TkMmtXq48xY3Zo/SPDAzKGLat5P4uYYjdtMv6qo
	ZpD6NsvYHIqwubF6U4qJFVsyOfNVGUkyBAAiqb22FsFciPWcllzvdiY8nFdXivtcipY5p+J+fBa
	GmRI7E3Z+TiYMttW3KSjrS3tTXpfq9fKmGUDn73dSJGgtZJv3t+A4f4KA=
X-Google-Smtp-Source: AGHT+IE+NNVE88iDUwAaQ7r8ENal9D9/Spnw5Z3aSwELhPsIBbz/10RGMoWuKFkC1AOSsqEBVzUhDU6ew73aGrw3MS8=
X-Received: by 2002:a05:6102:dce:b0:4bb:eb4a:f9ef with SMTP id
 ada2fe7eead31-4c9e4eb963emr10663742137.4.1744717255872; Tue, 15 Apr 2025
 04:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
In-Reply-To: <20250407183716.796891-1-ojeda@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Apr 2025 17:10:44 +0530
X-Gm-Features: ATxdqUHRgjnjW4n6eMFjqJplHcq4SMBMewSYmPqnuxbGTAXBMTStlZNMQ3l7DSk
Message-ID: <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <ojeda@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

Hey Christian, Miguel,

On Tue, 8 Apr 2025 at 00:07, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> On Mon, 07 Apr 2025 22:58:02 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Regressions on arm build with config rustgcc-lkftconfig-kselftest on the
> > Linux mainline and next failed with CONFIG_RUST=y enabled.
>
> > Bad: next-20250327
> > Good: next-20250326
>
> > Unable to generate bindings: clang diagnosed error: error: unknown
> > argument: '-mno-fdpic'
>
> I assume this is the arm support, i.e. commit ccb8ce526807 ("ARM: 9441/1:
> rust: Enable Rust support for ARMv7").
>
> Clang does not seem to support `-mno-fdpic`, thus you probably need to add it to
> `bindgen_skip_c_flags` in `rust/Makefile` so that it gets skipped when the C
> compiler is GCC.
>
> If you do so, please double-check if the flag could potentially alter the ABI in
> a way that `bindgen` would generate the wrong bindings.

I tested this idea and it works but I don't know enough about
rust to double-check if the flag could potentially alter the
ABI in a way that `bindgen` would generate the wrong bindings.

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..f207ba0ed466 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -273,7 +273,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387
-mpreferred-stack-boundary=% \
  -fzero-call-used-regs=% -fno-stack-clash-protection \
  -fno-inline-functions-called-once -fsanitize=bounds-strict \
  -fstrict-flex-arrays=% -fmin-function-alignment=% \
- -fzero-init-padding-bits=% \
+ -fzero-init-padding-bits=% -mno-fdpic \
  --param=% --param asan-%

 # Derived from `scripts/Makefile.clang`.

- Naresh

>
> I hope that helps!
>
> Cheers,
> Miguel
