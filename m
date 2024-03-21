Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A085231
	for <regressions@lists.linux.dev>; Thu, 21 Mar 2024 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711061302; cv=none; b=V4SJGonnk1AuXYDXOwm55eDRQ3H/44cpHfWjylweQFUASIrU/UoyDhlIRLZ4CGfBwoCNRD3e7FLW3w+SYuJslFfXtE77Wk2vsXg61rZG+8YlSZ0HNobcazJX1ZrEsP+rjlZncs/8bf5LihZn9jXpzzVt52Fv9PllGZfPRtfPNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711061302; c=relaxed/simple;
	bh=8kZQaLxa0VikRd55GghvL73ntNDipBA2PLPwjJcF8O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNDcfr7KQXdLFi0eqcKIFcNN25YHaeNCE5+PePqHF6wF/XdscVl6wHl02gTzzX181M4senUVu6s22uI7+7lnflP5WByHniMDVk4m3Eb/EmjCf/2idMGo80FUF40SuLILM55CFIS/yGwTEnieswDUw4UaeSqa6Azt1gp+7wmRymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9kUQWHU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9kUQWHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C2DC433B1
	for <regressions@lists.linux.dev>; Thu, 21 Mar 2024 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711061302;
	bh=8kZQaLxa0VikRd55GghvL73ntNDipBA2PLPwjJcF8O0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V9kUQWHUKrAxIDxKddw6QS53ZHLQ6X5EYKqO5x7O1t7DEKuxHMXMh6JCkM2F4qCts
	 YdIRzCqNRpMqefFTHj/9fTlxvASCuXh0Ayg0j5XHlF/OpKZUmsyPogMln+W0aLVa5d
	 SQVQZg2SXI834AJTH97UhGNjxCCUx9vZa9PXldDWMhimfumYd4qqF4aofD0QocHC7P
	 KlRHApAQFTB2VVaNbBTOfxM84xa8antNJDqyK9YAhr/bXAQis24xj0NpgKcI34Uma7
	 r6iOdFrjEY6GOaYXwt/31XSHvMMWOt5asDXifnesPwqoY4QLTjazUsnVlJEXaCzHo3
	 VgbaYExkvtApA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513da1c1f26so1937275e87.3
        for <regressions@lists.linux.dev>; Thu, 21 Mar 2024 15:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUuGtCuAicFv99QZJIYLc10XWukcLLFvlVQxvGpsZlnv3MDt234VoGRKbNrpCk+KgkcZyansnzPsG+ynHKj6QL8c0c3qEroEKIxak=
X-Gm-Message-State: AOJu0Yyx2+T6JsOCudGMNYiN9eM80MEW4qIX3q7SpkPeRF+1TUxTFsU/
	p46U22ZHxnMXFxlykSkVx6p5fiAy8DcOHfvF+tJKuzSWjBoDw2usfL4RktPQpcZworyu1viJGmW
	AuYTI3wPsKJa0TJPggUdbS6zLLqE=
X-Google-Smtp-Source: AGHT+IEkCE0TynYKmXJrH9D+6ZeTFav9F1+QTT/OoQMMonJCMsI6pzVreSsRQjPGTG1b43KSouEEZp1/wKs3HUzoxhg=
X-Received: by 2002:a05:6512:34c4:b0:515:940f:b7af with SMTP id
 w4-20020a05651234c400b00515940fb7afmr391674lfr.52.1711061300349; Thu, 21 Mar
 2024 15:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240321150510.GI8211@craftyguy.net>
In-Reply-To: <20240321150510.GI8211@craftyguy.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 21 Mar 2024 23:48:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGzH4TiwvSF3bZsJpuuWf04Ri_852fUMTdH8pLRaH3+Yg@mail.gmail.com>
Message-ID: <CAMj1kXGzH4TiwvSF3bZsJpuuWf04Ri_852fUMTdH8pLRaH3+Yg@mail.gmail.com>
Subject: Re: x86_64 32-bit EFI mixed mode boot broken
To: Clayton Craft <clayton@craftyguy.net>, Hans de Goede <hdegoede@redhat.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

(cc Hans)

On Thu, 21 Mar 2024 at 23:05, Clayton Craft <clayton@craftyguy.net> wrote:
>
> I've been chasing a problem with 32-bit EFI mixed mode booting on two different
> (x86_64) Intel Bay Trail platforms, where the system reboots or hangs seemingly
> very early somewhere before or after loading the kernel. I've not been able to
> get any output from the kernel or stub over efifb when the issue happens[0], and
> do not have serial console access on these systems.
>
> v6.8 fails for me, and presumably so does everything back to v6.2. v6.1 is able
> to boot OK on these platforms with mixed mode, and it looks like there are a lot
> of changes from 6.1..6.2 for EFI/mixed mode booting.

v6.1 just received some EFI related backports, so please check the
latest v6.1.y as well.

> I did managed to bisect the
> issue to:
>
>         commit e2ab9eab324cdf240de89741e4a1aa79919f0196
>         Author: Ard Biesheuvel <ardb@kernel.org>
>         Date:   Tue Nov 22 17:10:02 2022 +0100
>
>             x86/boot/compressed: Move 32-bit entrypoint code into .text section
>
> However I'm not sure how to proceed from here, or if my bisect is all that
> useful since the commit seems to be in the middle of a bunch of changes I do not
> understand. I've been using systemd-boot to test this (both the full bootloader
> and UKI w/ the sd-boot stub). Is 32-bit mixed mode on x86_64 working for others?
>

I usually test on 32-bit OVMF built with LOAD_X64_ON_IA32_ENABLE,
which allows the use of the compat entry point. This is different from
the EFI handover protocol, and I am not sure which one you are using.

I have never had any reports, or noticed any issues myself. Last time
I tried (some weeks ago) it was working for me.
CC'ing Hans who may have more data points.
