Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A141236
	for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 18:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707762986; cv=none; b=nbHDzgMkGzMBtoRV9YBhQgyEtTu5WyUGfbByKxT4yASpg70K6BdjLaLGLvggV/NZDPW69wYkdmPz3sawUW7+GEUvG5wm9/zoLtP7pSzD0nULjkgc2UaGHxEjp5nLLoBEwxdY4l6lrxw1umjlGBRvE8+vksnZWH7UnSpON9dzw/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707762986; c=relaxed/simple;
	bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BHlTgL9s/GDSbLdXhCnrSlolHfEMnEaM/5A5+bZtTy8qnnI+6w3ifed8a/g9V/hcdJl3BATi+37V4edIoWG2UreQBsw9mXpkPmjnS/kM3Lrx4axccY3sch9zfpUqe8490CS7/XNqmW583nGlttOSLNOZvFTouV3K8gqf6iqtlHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GR2skxZ0; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GR2skxZ0"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7d2e21181c1so1783221241.3
        for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 10:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707762984; x=1708367784; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
        b=GR2skxZ0nqx2HOpfBOdzYX2uFuTSNR50YhESlD9JhyBjgmVhkQzpDA5aRH4/O+jxtS
         NoLS5euiR0lHtZSe8bdsI5SH7IFo+krxCHkwx5oSnw/k91jYRUF259YcUi1Ql8IqRcjm
         x0rZQm/DUUUMx4v2UHIdtboWV/sNkL+TpakaXaYwh5CNi4APfNQ0POdYVcKeklWoQM32
         dTKX0fuPeGNgEjLI2EewVXu2pochilOkmVY0nm4rtcodxXrbNM4Xl+Ju/CSQ1/qOq8Et
         QYQb8H+gsN7zRgu/6uCDP9lUH2N2dtwoEjHoi06N4HdLMDQL+IWoC36dhF1OhqW8fhJi
         Rh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707762984; x=1708367784;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
        b=l7Io84HD9KWEeBM/TNbhfgdLFORi2UqcsAkXaEcRSwUhiH2PfoQfizzYMCnv9NYhDm
         bKLkEc11RYlqhvmNOlQSwxXOX0obf+PxPwKwlQ/hI8q6rqjPtN81GgIlJmzKO9emxWYf
         7o5+6bMrhzR0dUiQVqvkcocFn1JQAwb9NwJJOW/nZ29hxGpxoiDBeIOI9+peZqqbuMxv
         uqs2AcV14fzBb022/pMS4dyg65/5ibrqJNTUm9/CyGirHG7CQr9fhoFEfLqCq7GwbxLD
         nuVpJ+E+c8aRV4ZFyljXNGjYQ0HrjtEP9I5GJp9TBNzaIQ42ZRQY7ZHkvDrA9DrrB30V
         a/YQ==
X-Gm-Message-State: AOJu0Yw9jLNjepxr+50LUneqajlcdm2cYZU5lIuw2X2sJiC7wPervMW6
	YrL45bMDNib8C4CswdBpfGcFNBB30GlUV6XRMeSmfCpXNAhgUrmI4a4Q3QP4wzI+kJtMQ8iwijo
	yx8FAJlPZn5hFICHX7i04m2+pl8pFqbG/TZ9/qQ==
X-Google-Smtp-Source: AGHT+IEGZANl6emZY1UqGcSik514xyBzWU+XBPYnRHQZC/PhIexcuWbWZ04L9aeTVXS9UkOAD0ILzGf2zegYmfLzUl4=
X-Received: by 2002:a67:e445:0:b0:46d:19df:f3b2 with SMTP id
 n5-20020a67e445000000b0046d19dff3b2mr6250849vsm.7.1707762984219; Mon, 12 Feb
 2024 10:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 Feb 2024 00:06:12 +0530
Message-ID: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
Subject: Powerpc: ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Geoff Levand <geoff@infradead.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

I encountered the following build warnings/errors while compiling the powerpc
kernel on Linux next-20240208 .. next-20240212 tag with clang toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

powerpc64le-linux-gnu-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
make[3]: Target '__default' not remade because of errors.

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cFkli5H02fikrpga6PluAWLAMa/


--
Linaro LKFT
https://lkft.linaro.org
