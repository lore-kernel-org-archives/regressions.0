Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D0FBF6
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 21:45:16 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1688075114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75LIyOY6AijewOlIqwSrq2BC/yOybE4HkxwuTKoOGUo=;
	b=SeEF1PIuFbYRaLxbOKiA/FGfPJTUTsvRrL+bKdxf6Hq6f3ikd0xh9LtzJnwpNzTHhqdVeU
	qa+e6tZqnBia6KH58YlIMcbU7GsTFjznm2W03sgevPE1qgP0d/WWZYl1Nky6RNWUKbiXJJ
	o0wtgdtsn24NuXhvl0ZJjJyvHGf++s7OgjT0jLGO0g76oYRk4Oq3lgTVVCY2uAlz/rLZ2B
	6sa2VMx3YJVeDrMXoc5RNGAaz6zRXut3T6OVuCj/39iOdJKjGw13qR/kelF4xJtLcPD3Jz
	9Or2xd8wTdNQUNBajY/PN9/MSadLoz52PGFFabremXiCOPme/B7pMlvxjXP6OQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1688075114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75LIyOY6AijewOlIqwSrq2BC/yOybE4HkxwuTKoOGUo=;
	b=YeeoZVXw2ImFfqjK7uAVdS+NDUxpZMWNyqanwHQXxkiM6OowOu2qNxIe2YsXup0tu8EHGc
	ZvA8TF/bL23pBEDQ==
To: Ard Biesheuvel <ardb@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, =?utf-8?Q?Nikl=C4=81vs_Ko=C4=BCes?=
 =?utf-8?Q?=C5=86ikovs?=
 <pinkflames.linux@gmail.com>, linux-efi@vger.kernel.org, x86@kernel.org,
 regressions@lists.linux.dev
Subject: Re: x86/efi: Make efi_set_virtual_address_map IBT safe
In-Reply-To: <CAMj1kXG0GZ8K4kVux3zQ6TXGoeQ8bwHq7JXbx-YXFbLSbD-6Gg@mail.gmail.com>
References: <87jzvm12q0.ffs@tglx>
 <CAMj1kXG0GZ8K4kVux3zQ6TXGoeQ8bwHq7JXbx-YXFbLSbD-6Gg@mail.gmail.com>
Date: Thu, 29 Jun 2023 23:45:13 +0200
Message-ID: <878rc20wpi.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29 2023 at 23:42, Ard Biesheuvel wrote:
> On Thu, 29 Jun 2023 at 21:35, Thomas Gleixner <tglx@linutronix.de> wrote:
>> Nikl=C4=81vs reported a boot regression on an Alderlake machine and bise=
cted it
>> to commit 9df9d2f0471b ("init: Invoke arch_cpu_finalize_init() earlier").
>>
>> By moving the invocation of arch_cpu_finalize_init() further down he
>> identified that efi_enter_virtual_mode() is the function which causes
>> the boot hang.
>>
>> The main difference of the earlier invocation is that the boot CPU is
>> already fully initialized and mitigations and alternatives are applied.
>>
>> But the only really interesting change turned out to be IBT, which is
>> now enabled before efi_enter_virtual_mode(). "ibt=3Doff" on the kernel
>> command line cured the problem.
>>
>> Inspection of the involved calls in efi_enter_virtual_mode() unearthed t=
hat
>> efi_set_virtual_address_map() is the only place in the kernel which invo=
kes
>> an EFI call without the IBT safe wrapper. This went obviously unnoticed =
so
>> far as IBT was enabled later.
>>
>> Use arch_efi_call_virt() instead of efi_call() to cure that.
>>
>> Fixes: fe379fa4d199 ("x86/ibt: Disable IBT around firmware")
>> Fixes: 9df9d2f0471b ("init: Invoke arch_cpu_finalize_init() earlier")
>> Reported-by: Nikl=C4=81vs Ko=C4=BCes=C5=86ikovs <pinkflames.linux@gmail.=
com>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217602
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>
> I take it you'll send this straight to Linus?

I can do that.

Thanks,

        tglx
