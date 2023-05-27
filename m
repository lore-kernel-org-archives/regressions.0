Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4038113AC0
	for <regressions@lists.linux.dev>; Sat, 27 May 2023 18:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C76C4339E
	for <regressions@lists.linux.dev>; Sat, 27 May 2023 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685210646;
	bh=+2DbhJhzR6mabBBjwgNw5rSlRJnUbBZQeef15wiBopk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KnIH/6iU5kII/kEi9oJ2yNbjTux0io/0dOabQH7bxSWUDCQ/43I79+L/uQmWKzHFw
	 B+Zy6nsl/biVr6mGuJRtUiUgEUvIObjF7s2wkHVepOOS7rmS7+tbaECaWe7EKAdas8
	 2eNxkC0rvKI5FKvqK2Tk860u4csWFATn4t/IId3GFdpUkAiuvKg0eo4TFDr7gxt0C1
	 OBWzC9l8wlXcwt5l2guw9ZNygNwUBLPx79smWL/KlOs5n92wbI26X96g51c1BgGk0m
	 ua3zRGzTK7LAqNuT21GHZv9PWj4ywbsQO8BXEkmIcc8lk2E3edho7KG1Gm3u9saA2j
	 jwRuCoemDa3PA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2af31dc49f9so19849321fa.0
        for <regressions@lists.linux.dev>; Sat, 27 May 2023 11:04:06 -0700 (PDT)
X-Gm-Message-State: AC+VfDxvS+kGaKfFvzZSZVqWV3xUWg13WFY20ztyh30HO6fs+yTmi+0o
	o0KTEIESYlcHe1r22lFnhgFKJqyTU3FzuyC75Eg=
X-Google-Smtp-Source: ACHHUZ62gtGyVvIL18p9bdIMl4rfAggAX1oGiuWv0zEoKosgsTxXBGc6Z9d2SNfEvQBXlLkSso7H31J6LCQDa8Uc8ro=
X-Received: by 2002:a2e:9ed9:0:b0:2ac:7d3b:6312 with SMTP id
 h25-20020a2e9ed9000000b002ac7d3b6312mr2273060ljk.22.1685210644828; Sat, 27
 May 2023 11:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <efd6f2d4-547c-1378-1faa-53c044dbd297@gmail.com>
 <CAG8fp8SaHi0X-tZHnji_93wBADp1_=brjauWCVXuLaG7iP0p=A@mail.gmail.com> <CAG8fp8QXoEkndCzyaYZmg6+ZrszKOfh_YSi0o2_weV7y1_xYkQ@mail.gmail.com>
In-Reply-To: <CAG8fp8QXoEkndCzyaYZmg6+ZrszKOfh_YSi0o2_weV7y1_xYkQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 27 May 2023 20:03:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGjkKK-oHm64Y9P-AbYQWd9jnEdsNucRbY_-7mgJ_4yAA@mail.gmail.com>
Message-ID: <CAMj1kXGjkKK-oHm64Y9P-AbYQWd9jnEdsNucRbY_-7mgJ_4yAA@mail.gmail.com>
Subject: Re: mix of ACPICA regression and EFISTUB regression (Was: kernel >=
 v6.2 no longer boots on Apple's Virtualization.framework (x86_64); likely to
 be related to ACPICA)
To: Akihiro Suda <suda.kyoto@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-efi@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux x86 <x86@kernel.org>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, 
	Linux ACPICA <acpica-devel@lists.linuxfoundation.org>, 
	Linux Stable <stable@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Robert Moore <robert.moore@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 May 2023 at 20:00, Akihiro Suda <suda.kyoto@gmail.com> wrote:
>
> [Resending as a plain text email]
>
> Turned out that this is a mixture of an ACPICA issue and an EFISTUB issue.
>
> Kernel v6.2 can boot by reverting the *both* of the following two commits:
> - 5c62d5aab8752e5ee7bfbe75ed6060db1c787f98 "ACPICA: Events: Support
> fixed PCIe wake event"
> - e346bebbd36b1576a3335331fed61bb48c6d8823 "efi: libstub: Always
> enable initrd command line loader and bump version"
>
> Kernel v6.3 can boot by just reverting e346bebb, as 5c62d5a has been
> already reverted in 8e41e0a575664d26bb87e012c39435c4c3914ed9.
> The situation is the same for v6.4-rc3 too.
>
> Note that in my test I let Virtualization.framework directly load
> bzImage without GRUB (akin to `qemu-system-x86_64 -kernel bzImage`).
> Apparently, reverting e346bebb is not necessary for loading bzImage via GRUB.
>

Are you using OVMF? Which versions of qemu and OVMF are you using?
