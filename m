Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB7405F2
	for <regressions@lists.linux.dev>; Fri, 15 Mar 2024 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710516848; cv=none; b=vC1rxddevFftUFFg5pOQYh73QIKyQv8FFlfJ/DL1zMIc4SowvqcxI6H7+OPmv198VmSq8nl4xMgqDMcpiKZST/oTOtzy6CPtosaHEqYIsTsULDr7VT4AGk4oMDdzIunHyjpWdftuW6aAlX0oy+V92eOxbQAym7dy9n8lPoybGP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710516848; c=relaxed/simple;
	bh=iX+K8eUt9o/U11c9IgO1wi35l31v3eJabjYDZkAsezw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtdXxbG2DSCT2BNjWwgK733f6sQ8vYurjB2+EnseafZ9ywZxXhNyzYZbCCZge5k0Y7KA8CgpU9dB4sCl5dHY0TqLGHRu6zYBjTkxR1Vm4t//dDIbrerlYPsYxIy4HFXeFV6OVWj1C41CzA0wKrcm4zSH+QNKHqPxmZKIcWAuRrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ha6gVUVT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ha6gVUVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC45BC43394
	for <regressions@lists.linux.dev>; Fri, 15 Mar 2024 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710516847;
	bh=iX+K8eUt9o/U11c9IgO1wi35l31v3eJabjYDZkAsezw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ha6gVUVTMGFntQa1xKK6lahNgpjZOcp58BBSDuzPRHwtP4274S1TrK88S+WTBmGGf
	 I1xflxJpPDi4vxhoITuSkhQ5VOKpizRd2lRos76Qfo3A6ZKwBLLK26lCQzMUAb3nqP
	 v6Acwldtx7RbnFDMWhtsf3BHWtPL+vL5ejkS2YDvFnvmcwNjDxHyg2CXdlsc7Xha97
	 SJquc+yRRsUHaVIdzHJOLxAyK2kTVxc0XGlbGnoG9FSTy63vG453ZxgGq9MTGD7nNF
	 /2HhFeUK5m/hygI49fXI4mF/YI2GyIoumpTDF0zv1e5ov5PedHa3i768NZvM3QletN
	 oUMCkEp3FFyZw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so26403281fa.3
        for <regressions@lists.linux.dev>; Fri, 15 Mar 2024 08:34:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWprTxgs9mJHHTDskG2uqdYgC+qgXY2WuA/QNo3ZpNx9D11HTmh9A3yfTHRyOkd35lCpPM+hk6DS8pE0qBWw9KniCQDalQmYZf9H+A=
X-Gm-Message-State: AOJu0Yzb7MH/yslFaLyBD2zRBUpAjCN+bkNMa+/6PBP3Q/dzNE0d6z3f
	ibnwUk9rxJ91EjpY/YQmX5yJAeSMtR2dG6hhBfQql6YFeXSLt7Rzr2et3RrYCgv5UKumYJWcgnN
	XzCCZQfPEmJm7k+LFsLd6p2JA70M=
X-Google-Smtp-Source: AGHT+IGFpxavl901L1RrvIOvAJF6Nzop/EfdOiv7vPfaAxGVFejM7iTagrS2FXemuSiUK9VCG9KsVYjQueNaelFe41g=
X-Received: by 2002:a05:651c:10c9:b0:2d4:7503:13a7 with SMTP id
 l9-20020a05651c10c900b002d4750313a7mr3847314ljn.14.1710516846062; Fri, 15 Mar
 2024 08:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
 <CAMj1kXF7gaaARdyN=bVuXtJb_S=-_ewAavXHgN4DS36jxK8r6A@mail.gmail.com>
 <CAMj1kXEo-y1DfY_kBhwGU0xMkGp1PhdqGFmw6ToLePiZy4YgZQ@mail.gmail.com>
 <CAMj1kXFmgba8HyZ-yO7MsQBgOGjM10hZKWESBbfrUcjdhq0XsQ@mail.gmail.com> <225e9c2a-9889-4c9e-865c-9ef96bb266f3@podgorny.cz>
In-Reply-To: <225e9c2a-9889-4c9e-865c-9ef96bb266f3@podgorny.cz>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 15 Mar 2024 16:33:54 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
Message-ID: <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Mar 2024 at 15:12, Radek Podgorny <radek@podgorny.cz> wrote:
>
> hi ard, thanks for the effort!
>
> so, your first recommended patch (the memset thing), applied to current
> mainline (6.8) DOES NOT resolve the issue.
>
> the second recommendation, a revert patch, applied to the same mainline
> tree, indeed DOES resolve the problem.
>
> just to be sure, i'm attaching the revert patch.
>

Actually, that is not the patch I had in mind.

Please revert

x86/efi: Drop EFI stub .bss from .data section

commit fa244085025f4a8fb38ec67af635aed04297758d in v6.6

(or apply the changes below by hand if that is easier for you)

--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -47,6 +47,7 @@ SECTIONS
                _data = . ;
                *(.data)
                *(.data.*)
+               *(.bss.efistub)

                /* Add 4 bytes of extra space for a CRC-32 checksum */
                . = ALIGN(. + 4, 0x200);

--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -108,6 +108,13 @@
 # https://bugs.llvm.org/show_bug.cgi?id=46480
 STUBCOPY_FLAGS-y               += --remove-section=.note.gnu.property

+STUBCOPY_FLAGS-$(CONFIG_X86)   += --rename-section .bss=.bss.efistub,load,alloc
 STUBCOPY_RELOC-$(CONFIG_X86_32)        := R_386_32
 STUBCOPY_RELOC-$(CONFIG_X86_64)        := R_X86_64_64
