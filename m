Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA80E158DD9
	for <regressions@lists.linux.dev>; Thu,  6 Mar 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741271778; cv=none; b=rm3olKrwYXOjTJw0gBjmcoH5ZCv8govrrAmnPDWxidDCC69POOoCrjLzsJYjkvsrmtRMuY+8J6gYqEMTD4WgeF7UusOjkAARESAk1TMEZn/GUOq9o8bNAAgP0jt1upDJ3YIq4SK5m6MVFCaxoqYqpzxWsMBSIEfkNvSV3YCMVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741271778; c=relaxed/simple;
	bh=H7oFNdopRgl2HPaJYtQHLhv+qaMaXrXXIX0+HSbgGPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyi8H8g2ghYF3EZ2Fvt5cPPiPhm4DsGYe3ztExoxpDBoy/+Ox2tAztQrP42zoF15wx1+ore7oBnlUtYy3buCOjAETxPl9sA8SKNUd01SG5kDq/4YmWdMF0nUBeOoNNcV7ijKbDkF+HhU4igGK1VFk6T+vDPo+nfLN6DFCZrGTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGQpGsdz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGQpGsdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D63C4CEE4
	for <regressions@lists.linux.dev>; Thu,  6 Mar 2025 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741271777;
	bh=H7oFNdopRgl2HPaJYtQHLhv+qaMaXrXXIX0+HSbgGPc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uGQpGsdzyEW7OoLlYIiJI6tthh4TH0dcBaSJd/YuvdzCBaflxHop+uhhjirjpMMm8
	 UuRO6nasYWvOTZB9JrKuuBIvF+3mIadfUzPPo8NN5y4keqjhQgxlNiA7didETeHoXm
	 m+1IE6aEr6pterl9mRq1bixwGZ0waNdJdqPGuB5DvTaxyhcq4P53Qw894Q/OfVOaKd
	 FikOKIbp+vfntaNI4Wz6CXLaLl6lVMOOy+3bi0vhkMB9l11c4I+J3CkTjHbMcxkg68
	 ufId39svf+vqOlIfi2chvVAEeuasyNV4olnmu2/0aj2CJR5xA215c/CO9Uaovt7hIN
	 nokYtDyPXCqEw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bb2fdbb09so7056461fa.2
        for <regressions@lists.linux.dev>; Thu, 06 Mar 2025 06:36:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUI3NmYOtqUFlbhjE88mbebua6lVnWZaIfGK6io0MFgxFWCxmUG6KrN1RVOerb1F+qXBVYlwCvySpMaEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+SKuThOFIYJT4SW41QskQSb4gdXP4tZ0tWP+tAf0kocbX9OZA
	2HfjHnnUtPW8TpRQdjtGIn5lLe459RnIeGjj3m+yIORBI1iMT10TwYRBktm9zgN1hjWtfJYp3RN
	CuWg6PUthwQKIP95s1UqNUTGwdIQ=
X-Google-Smtp-Source: AGHT+IErOrZT+xh6GBDFJk2wRcsqQoRS+LS9kInediAFo+3NOK1mIscAfIserypXieFgp5QlSgQ4sr7Eyoa1NMWom8U=
X-Received: by 2002:a05:651c:2105:b0:30b:c328:3c9f with SMTP id
 38308e7fff4ca-30bd7a9628cmr26407211fa.20.1741271775501; Thu, 06 Mar 2025
 06:36:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503041549.35913.ulrich.gemkow@ikr.uni-stuttgart.de>
In-Reply-To: <202503041549.35913.ulrich.gemkow@ikr.uni-stuttgart.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 6 Mar 2025 15:36:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH-CDaQ0UFuwHWC2ERRmvo7tS+jcZcue00yReyAi5sVXg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr41Zpfi_in6v-675nAeI4VY8FG3df3K_kjOA1GQzJ47aobC-1Ebwvp0Qo
Message-ID: <CAMj1kXH-CDaQ0UFuwHWC2ERRmvo7tS+jcZcue00yReyAi5sVXg@mail.gmail.com>
Subject: Re: Regression for PXE boot from patch "Remove the 'bugger off'
 message" in stable 6.6.18
To: Ulrich Gemkow <ulrich.gemkow@ikr.uni-stuttgart.de>, "H. Peter Anvin" <hpa@zytor.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

(cc Peter)

On Tue, 4 Mar 2025 at 15:49, Ulrich Gemkow
<ulrich.gemkow@ikr.uni-stuttgart.de> wrote:
>
> Hello,
>
> starting with stable kernel 6.6.18 we have problems with PXE booting.
> A bisect shows that the following patch is guilty:
>
>   From 768171d7ebbce005210e1cf8456f043304805c15 Mon Sep 17 00:00:00 2001
>   From: Ard Biesheuvel <ardb@kernel.org>
>   Date: Tue, 12 Sep 2023 09:00:55 +0000
>   Subject: x86/boot: Remove the 'bugger off' message
>
>   Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>   Signed-off-by: Ingo Molnar <mingo@kernel.org>
>   Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
>   Link: https://lore.kernel.org/r/20230912090051.4014114-21-ardb@google.com
>
> With this patch applied PXE starts, requests the kernel and the initrd.
> Without showing anything on the console, the boot process stops.
> It seems, that the kernel crashes very early.
>
> With stable kernel 6.6.17 PXE boot works without problems.
>
> Reverting this single patch (which is part of a larger set of
> patches) solved the problem for us, PXE boot is working again.
>
> We use the packages syslinux-efi and syslinux-common from Debian 12.
> The used boot files are /efi64/syslinux.efi and /ldlinux.e64.
>

I managed to track this down to a bug in syslinux, fixed by the hunk
below. The problem is that syslinux violates the x86 boot protocol,
which stipulates that the setup header (starting at 0x1f1 bytes into
the bzImage) must be copied into a zeroed boot_params structure, but
it also copies the preceding bytes, which could be any value, as they
overlap with the PE/COFF header or other header data. This produces a
command line pointer with garbage in the top 32 bits, resulting in an
early crash.

In your case, you might be able to work around this by removing the
padding value (=0xffffffff) from arch/x86/boot/setup.ld, given that
you are building with CONFIG_EFI_STUB disabled. However, this still
requires fixing on the syslinux side.



[syslinux base commit 05ac953c23f90b2328d393f7eecde96e41aed067]

--- a/efi/main.c
+++ b/efi/main.c
@@ -1139,10 +1139,14 @@
        bp = (struct boot_params *)(UINTN)addr;

        memset((void *)bp, 0x0, BOOT_PARAM_BLKSIZE);
-       /* Copy the first two sectors to boot_params */
-       memcpy((char *)bp, kernel_buf, 2 * 512);
        hdr = (struct linux_header *)bp;

+        /* Copy the setup header to boot_params */
+        memcpy(&hdr->setup_sects,
+              &((struct linux_header *)kernel_buf)->setup_sects,
+              sizeof(struct linux_header) -
+              offsetof(struct linux_header, setup_sects));
+
        setup_sz = (hdr->setup_sects + 1) * 512;
        if (hdr->version >= 0x20a) {
                pref_address = hdr->pref_address;
--- a/com32/include/syslinux/linux.h
+++ b/com32/include/syslinux/linux.h
@@ -116,6 +116,7 @@ struct linux_header {
     uint64_t pref_address;
     uint32_t init_size;
     uint32_t handover_offset;
+    uint32_t kernel_info_offset;
 } __packed;

 struct screen_info {
