Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6547E772
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637381; cv=none; b=HsXWRwXa+KnBYZaYrXeNdmQJP8/PZ8t29Tdaq1nnknE7a9Onvq95GKXXHE51FALoiUh9xOoKm7gavPYu5Nq2shD8lckZ3oo1+wg1D7hw1pIODLRJw7PHHZeI3KcG9a1/uCrxKLwIWY/sJDqR4TMpX8VFpFLHaywEPCCAZ3pYU54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637381; c=relaxed/simple;
	bh=6qGB0m49wbcH/K4Wq1c7B1JEGzsyhRzf4Hp5H0Xn/4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKAU2jb61VaG6Q/yTQLAAJZUiiMisiARAP5Yd/NnJDINzU/RP+96QanfJ/OBr6fripCceL5b77tz7HYbDiF3Y6GAuoPZTh7T1+4etZvDbjAsSy/8S5+H9/jBZnrrJt8vceSt3upTjac/aGpAG0BBCj5MrzvBsGW66fJm7C8nVao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHOrF0v1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHOrF0v1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F3FC43390
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711637380;
	bh=6qGB0m49wbcH/K4Wq1c7B1JEGzsyhRzf4Hp5H0Xn/4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JHOrF0v1GV9HJLVgUMgzMIqjqyvHloYv691wwj2lpc4AsJ1jyQMM9HmKUiu9WlWHL
	 YpoxHypqUifqfbpFs5ZK7JRG5035Tn4hh1QZmmRE73OQ6bURXGrws/aNL40g+NSAMY
	 VlTyQCm7lbDPf5thuALbY5dph4FxHjWb2bUXO5aOWcOkJUD30Qn207e7TpGfLN6aa+
	 eMzB6/RVl/3nPXPyVFqRFdy2QJg/BK7OSFF/2IJznVoBnmxiEAzt0WvLxGZ7RoSxEi
	 mJr6ipdInBysTuDrboV+fmCSrCRGaWsJvLkqRos+Hu1B9O8Y76cNzjR/piMPc71zI7
	 dsiFPvBCSxtpA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513e6777af4so1556949e87.2
        for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 07:49:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YzWsDT8H5JkGGl33P6bVfqKA6SympDfoxW9T9m0fp1CqMBT75vB
	6dqKZiPqo3Yxo3k63lhlshFrK/Mw74TLa0zQv3nQeBNLfOwemSNGAtPLVlYnbqjbbrQeAKd0G/1
	gJe/bikUimv5Mk/RaNBYw8GDWg+M=
X-Google-Smtp-Source: AGHT+IEDh63ONB9aWaAgssdm8sLQ1IUibtUNQ0AWBDg5E8/uvEzkyxvL70Z3aOt/Yu5xdtQYrUSjyQS1RmmcXB+ZAvM=
X-Received: by 2002:a05:6512:60a:b0:513:e7a0:5aa5 with SMTP id
 b10-20020a056512060a00b00513e7a05aa5mr2576636lfe.51.1711637378936; Thu, 28
 Mar 2024 07:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
 <CAMj1kXEo-y1DfY_kBhwGU0xMkGp1PhdqGFmw6ToLePiZy4YgZQ@mail.gmail.com>
 <CAMj1kXFmgba8HyZ-yO7MsQBgOGjM10hZKWESBbfrUcjdhq0XsQ@mail.gmail.com>
 <225e9c2a-9889-4c9e-865c-9ef96bb266f3@podgorny.cz> <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
 <CAMj1kXGZLs3MdFiK9jrkmWR+YPt50L5tuCJ+rLLTjVa3Grm6tw@mail.gmail.com>
 <61148405-2036-4994-9eef-45cbe6aa9adb@podgorny.cz> <CAMj1kXHn0qp2Qq1WfoT015ezjnzHLoy7=XVE_RY+6jsHzQ+gkA@mail.gmail.com>
 <35ae3208-a0ba-43a7-ac4c-6f770b3df405@podgorny.cz> <CAMj1kXHO_R4XpQ=To1ZW_yac_sjWFPnw7pjunn0UmraFDA2wCg@mail.gmail.com>
 <92898285-e85c-4e72-a179-70fb65349978@podgorny.cz> <CAMj1kXEfeC=O2_NFteJM+L1PqgR2MiXQEcFzmeemsgdKC8s7xQ@mail.gmail.com>
 <dd6e61ac-2356-4b97-85b4-b963a045361b@podgorny.cz> <CAMj1kXGcsEhf24QO1_4Wf99z=PR1cqdxim0Ttj-TqQijZOW=+Q@mail.gmail.com>
 <5e9b5508-cbec-4b81-a2e4-4a02e7c201dc@podgorny.cz> <CAMj1kXF5TUNXVxcaY550_3JYvkGUZDRYtmPAKpbk64Ci8gpbqw@mail.gmail.com>
 <ae488ff7-97f8-4210-a1a7-98f7a5c3ffa7@podgorny.cz> <CAMj1kXEarH+vdk3SqJ8_Vcf-uF4FjTfmjepVbXQ6KciBuCK-wg@mail.gmail.com>
In-Reply-To: <CAMj1kXEarH+vdk3SqJ8_Vcf-uF4FjTfmjepVbXQ6KciBuCK-wg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 28 Mar 2024 16:49:27 +0200
X-Gmail-Original-Message-ID: <CAMj1kXESfih-V4ObfoyROyABoYNp6e9gwGH236=PfJA_AWhQsQ@mail.gmail.com>
Message-ID: <CAMj1kXESfih-V4ObfoyROyABoYNp6e9gwGH236=PfJA_AWhQsQ@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 11:41, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 28 Mar 2024 at 11:18, Radek Podgorny <radek@podgorny.cz> wrote:
> >
> > hi!
> >
> > results:
> >
> > 108 - just patch 0001 - WORKS
> > 109 - patch 0001+0002 - WORKS
> >
> > visually, i see no difference between the output of 108 and 109. :-(
> >
> > both start with a hex dump before the "normal" booting sequence.
> > unfortunately, i doesn't seem to fit to screen so the top of the dump
> > scrolls of almost immediately. i was able to only shoot the "bottom" of
> > the dump. i can make a video and try to extract frames if you also need
> > the beginning of the dump.
> >
>
> Can you drop the last two 'dump_buf()' calls and try again? But keep the call to
>
> efi_bs_call(stall, 10 * EFI_USEC_PER_SEC);
>
> which is what generates the 10s delay.
>
> The first dump is interesting because the memcpy() that is being
> brought back overwrites those contents, and I'd like to see what is
> there before in your case.
>
> Also fine just to capture it on video - I suspect it's all 0x0 anyway
> (.. in the dump)
>

After some more head scratching, I identified an issue in the original
patch that might explain the behavior you are seeing. Could you try
the below please? (and drop all the other reverts)

--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -496,6 +496,7 @@
        hdr->vid_mode   = 0xffff;

        hdr->type_of_loader = 0x21;
+       hdr->initrd_addr_max = INT_MAX;

        /* Convert unicode cmdline to ascii */
        cmdline_ptr = efi_convert_cmdline(image, &options_size);
