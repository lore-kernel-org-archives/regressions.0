Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0793C50A77
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711618929; cv=none; b=YulmRfWWiK2n3gwd10KE2L3BnjulhQAdt3VvY8rMiY7fFSZpJThVlL9oleQyUjuDUoEE3ObwYGzoxHhb/Y/iARxAHYgq7xKC19/TBvVRzmvm64F5YWzPsu5CZvM/xpPaufrXL3Y3jWxgnXDNz2Anyz53WhqvUwDjHvU6fMCP6r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711618929; c=relaxed/simple;
	bh=F8xSZGVolxj8kW5cqviuU5nzDyihYHKBYTzHoUpbjl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mp/92ozfbFBvJwLJWeMUVsRp5A4aKwh8e8PlmP+sV/7Xi1SFVi0+Y4tHKW/7u9+9t1LRUtYoly/MfsUJmFYqYVt3U+WYtDH0vDvwXpOcqJz3C9o9EY6iAg+EvDxFQwa9olcXWa+mo4irCEleHJTHUaX6NSvr69xegqOhLzsxs4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5HSsk44; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5HSsk44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE58C43394
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711618928;
	bh=F8xSZGVolxj8kW5cqviuU5nzDyihYHKBYTzHoUpbjl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l5HSsk44rgyivelZ6+XvwtJwdKivEznKclgbqjeGftbGE0p3VI7Lm9C5utJ3oRQXk
	 wuuVIDUpPMlVHEXwtNmc2QCj58MyzEBdYLSeweZAItNtm5TLMLfGns1nKg3fWgkJ7i
	 doUKwakJX59DMDNa2xWlwlc565po0tCDyztE8xJwmdUC4cvVu1cxcH2P1hGbe0jl8J
	 Ds1vXjFq/RQYvfA/dIZEvWgIoaEqslKApAJKkjxbiJi8Aen8wXGFpVk2lA3TyUVt2z
	 ju+Elwgk8DUASIGEFhiipUpizHq3xPDh4mkfjZApU+SFYaz4d83kne27Ot3vpjkuX2
	 nwqk/i5bDN7TQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d68651e253so10339201fa.0
        for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 02:42:08 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz24crRoeq4vcKPrLUkdEbKqX4ghXGm+PtKknSE53Fy3lR3vVOY
	VtDuPOkgK0ZEnlIQJYonR2mmGqDSbT+3hjLZ5X1tYFKUJRekAiayOE2bWwU7PCJLE/7mZ3NfTzR
	D7xhvjsMymtHgHwL0J+TuLIzgnJA=
X-Google-Smtp-Source: AGHT+IFhaQsERWtUWlPzbtwxUVk+yc1ujfxMXQ21i7qMlG85NM/Wz7cAsT1rEASeBTbqqXcP3CnXqF2H3aZo+gqAa4Q=
X-Received: by 2002:a2e:9301:0:b0:2d6:fc0b:f122 with SMTP id
 e1-20020a2e9301000000b002d6fc0bf122mr1797550ljh.18.1711618926917; Thu, 28 Mar
 2024 02:42:06 -0700 (PDT)
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
 <ae488ff7-97f8-4210-a1a7-98f7a5c3ffa7@podgorny.cz>
In-Reply-To: <ae488ff7-97f8-4210-a1a7-98f7a5c3ffa7@podgorny.cz>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 28 Mar 2024 11:41:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEarH+vdk3SqJ8_Vcf-uF4FjTfmjepVbXQ6KciBuCK-wg@mail.gmail.com>
Message-ID: <CAMj1kXEarH+vdk3SqJ8_Vcf-uF4FjTfmjepVbXQ6KciBuCK-wg@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 11:18, Radek Podgorny <radek@podgorny.cz> wrote:
>
> hi!
>
> results:
>
> 108 - just patch 0001 - WORKS
> 109 - patch 0001+0002 - WORKS
>
> visually, i see no difference between the output of 108 and 109. :-(
>
> both start with a hex dump before the "normal" booting sequence.
> unfortunately, i doesn't seem to fit to screen so the top of the dump
> scrolls of almost immediately. i was able to only shoot the "bottom" of
> the dump. i can make a video and try to extract frames if you also need
> the beginning of the dump.
>

Can you drop the last two 'dump_buf()' calls and try again? But keep the call to

efi_bs_call(stall, 10 * EFI_USEC_PER_SEC);

which is what generates the 10s delay.

The first dump is interesting because the memcpy() that is being
brought back overwrites those contents, and I'd like to see what is
there before in your case.

Also fine just to capture it on video - I suspect it's all 0x0 anyway
(.. in the dump)



>
> On 3/25/24 5:24 PM, Ard Biesheuvel wrote:
> > On Mon, 25 Mar 2024 at 16:56, Radek Podgorny <radek@podgorny.cz> wrote:
> >>
> >> hi!
> >>
> >> patch 106 - does NOT work - result same as with patch 105 (Initramfs
> >> unpacking failed: broken padding
> >> patch 107 - WORKS - result same asi with patch 100 (full revert)
> >>
> >
> >
> > OK, we're making progress!
> >
> > Please try the attached patches (try 0001 first and then 0001+0002)
> > instead of 107, and capture the output of the combination that
> > produces a working boot. There should be some diagnostic data on the
> > screen followed by a 10s delay.
