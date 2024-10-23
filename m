Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D39146018
	for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729692568; cv=none; b=PAa84STIwOs7MguZFolqDfWere5aBhhJGjr26DHqJ1WDPasjetQ+akT25lX9hHpnhqynAJcS989TGcVWci4MRn4Ai9CAeWzm5JYnMlmNnxURWEBLOglF9vUM1CwtBqB8mpvSW3Aou/jKCTPbMidB31RY4l01OY/novDcg3lsVpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729692568; c=relaxed/simple;
	bh=6AOKjYCCdpV7w43HWjOXv1p+7JwFslskOOtol4WHSk8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bJgE/wlimYdziE7/XBiwDfRHqgoYJc3KjWg4MjmQaIvUAGr/QEUtyclPEDydEN36DAzJbbKNUPTUCbIgqgJbEts3eVH2XpgwmpzYbPzbD83KL7HzB/b4La82rxMvs8itJvcaHJw+Y5AflUzc8ESv7yZSAQK05wwtLrLsSWKN2Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juvKi2re; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juvKi2re"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4a742ea907fso610348137.0
        for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729692565; x=1730297365; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rXlFApdQ/yxNEtQHJ/FByPIiwHHbdQVp4Wj+r/wBYws=;
        b=juvKi2reEjpm/PsFEIOOgG1L0flQrc59ttfFsG+0/VzosanOXihoaHVzltLjxpl68B
         wU7b167U/z4Vjd53TsCNGgaYqJQvqZ7UToiOQ4SydJigpqldYX2cHcKjPJy22r1AQpvT
         e96RnCxuHKVpt+Qa9V1omJRjHQXqizOWovVWqnYLjkeDkhSkSmRi3SuNBuIgdKnMD9JL
         KdfO2MF3XhUQ6DpVqV63Z3X/+AeXM7GUQ/zJIqz0yrWAv7YD6ZfUDylRsKwh/ddAjr0t
         wxCyVc/xUfTyUY+H7MCQucdse51hAq/o2x0cCOYKqVeBm23UCWssbLlPmgk0QmweuG1N
         cB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729692565; x=1730297365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXlFApdQ/yxNEtQHJ/FByPIiwHHbdQVp4Wj+r/wBYws=;
        b=OiW+h7WT6MXFHW/pkygueENaIRgOZ/3PchhvmEw65nNmrGSGFBoyPbM8lY3XGSkX3B
         jddDuRTmEzL/3zV2UBmhlOpRa1vA1hiA0BroMUJToXktDzNIBYP2BqQecm/9PShzDbDZ
         vLm/pA9U79u4NLv5wmRGrYnCYxt/5kZe1zHTrGfLV1d6K7/IuzBEGd4Wi2JkJma5vBcN
         lnBzq4gHp1GkDgO8O8gAhqbHKBJn3f1cRJsNaFjGTStQXTqI4cCyrYw6kHMnaOEY/y8u
         5xezgMokR3HYrrpah5/N2MvlPJs0hntmLEEYe02iwxOy92hQUMWCVm93t272nxkBvV6S
         sBFA==
X-Forwarded-Encrypted: i=1; AJvYcCVFlmkv5JsYqah9gW2/x13MnEjU8Lc2WOOzItoICDG1AxnQ0YO2P66/mAEEsFVJgr9M9ZkI3w3/hOzLMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHSsAnTV9/yP3RldGQ9xpztmcBam8hAJ04IBSdvredEcFEKrG/
	gE/7HSJ9WcEb/jo0mjpE0ENyCv2UDiM4CMwE5bHurQpaTyO0rqOgaCAFonPW7iS0N+70/up2EmD
	axGo1GOwQ++W5GimpfzZ2Ibd46ytyhWiuBvRTsw==
X-Google-Smtp-Source: AGHT+IFmh33RgaiUOP+HVY4VUrT5C3eUPjEyz6YTWVUUNNttulktEFsUofYMpaZ2+7uhkX9mpbDW6JcWTu41epLTQ/k=
X-Received: by 2002:a05:6122:32cc:b0:50d:5e21:ef39 with SMTP id
 71dfb90a1353d-50fd01be5bamr3352330e0c.1.1729692565154; Wed, 23 Oct 2024
 07:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 23 Oct 2024 19:39:13 +0530
Message-ID: <CA+G9fYuVefYJx9JsVx1Wz5pV1jKCp9eCPtwZD+FVhdk841q1Zw@mail.gmail.com>
Subject: drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to
 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an unaligned
 pointer access [-Werror,-Walign-mismatch]
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, kobak@nvidia.com, 
	"rafael.j.wysocki" <rafael.j.wysocki@intel.com>, Ard Biesheuvel <ardb@kernel.org>, rui.zhang@intel.com, 
	mochs@nvidia.com, Dan Carpenter <dan.carpenter@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following build regressions are noticed on x86 due to following
Warnings and errors with clang-19 and clang-nightly,
The builds with gcc-13 do PASS.

Started happening on next-20241023.
Good:  next-20241022
Bad:    next-20241023

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
=E2=80=94-------
drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to
4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an
unaligned pointer access [-Werror,-Walign-mismatch]
  156 |                         (void *)efi_pa_va_lookup(&th->guid,
handler_info->handler_address);
      |                                                  ^
drivers/acpi/prmt.c:159:21: error: passing 1-byte aligned argument to
4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an
unaligned pointer access [-Werror,-Walign-mismatch]
  159 |                         efi_pa_va_lookup(&th->guid,
handler_info->static_data_buffer_address);
      |                                          ^
drivers/acpi/prmt.c:162:21: error: passing 1-byte aligned argument to
4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an
unaligned pointer access [-Werror,-Walign-mismatch]
  162 |                         efi_pa_va_lookup(&th->guid,
handler_info->acpi_param_buffer_address);
      |                                          ^
3 errors generated.

Suspecting commit:
  ACPI: PRM: Find EFI_MEMORY_RUNTIME block for PRM handler and context
    Commit id: 088984c8d54c0053fc4ae606981291d741c5924b

Build Links:
=E2=80=94---
build error link:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIm4ZOkWenPJ71UOZG=
57R0jXE/

Metadata:
=E2=80=94----
Git_describe: next-20241023
Git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
Git_sha: ceab669fdf7b7510b4e4997b33d6f66e433a96db
Build_name: clang-nightly-lkftconfig
Compiler: clang-nightly
Config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIm4ZOkWen=
PJ71UOZG57R0jXE/config
Download_url:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIm4ZOkWenPJ71UOZG=
57R0jXE/

--
Linaro LKFT
https://lkft.linaro.org
