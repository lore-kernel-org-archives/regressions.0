Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1951DDA30
	for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729712829; cv=none; b=h1/1jkrrsRG7Q62CoHHsOoX9OuvPvOO2RbEHYRtZ5Ol5TjFnirlwiusHmWZ7nCfFntULxIEDUhsCM77gMkAm3A6nuY18KabShSwLvDjorymst3ILVdawAJ5aX45Z5ZIQvp+o+FgF1i2qf6K77u3D9HRqEFN4JVl0Z8W0/BijIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729712829; c=relaxed/simple;
	bh=M72n/VMflKKIL8GpFlNX+001CH6qDRfRgs4vfD+Lc60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bsG5YYxXWm5xb47g4ngVUtqUnYV8dkp4P0YcY1rllAuCj1DhLu9NAlVxVJNSXJVBf2B75jCUZpD7B40r5Hu8ejl9PxhcmmZbtiDHMRJ/VIgBLpgW2ADAmKA7yTE+wW1/o5B1CIDVctR2cn5fKIlW/RKqJC5wirh8dOgQD8ZzEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FHRogN/d; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FHRogN/d"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so181402a12.1
        for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729712826; x=1730317626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjeWek960NcUIgiohtPXB+Vg0rJ92eP6xQNpgT2ubOU=;
        b=FHRogN/dlSQaS7CdQOu05QeEbhSbIble7RRg6K0nzNnDdCJTANpHeOL1nlcOezlabl
         xDcVubo+sjlbTvaOOC7CrBB/sP06kFzMaF3TI9TZRTPDjPrJi5uBATQjn24hOX5rdCy9
         7ZOFGApBdpEtwvJ4HrDkcVLUObW4AMhlqWHKOOohtNKlNGOFdYfijxj9ycnoZNbsUCOY
         t3qDgpUO2EFvBw2iavY1paBVEdtnByUdjlf/YNrwZTCgs/swNdrgXMZb+8UnMQmvG8pk
         Rlxb7w7IW7lPzsz9aJsxEtKdMkK2mUzbigeIpGloxfzXfPelDPPR9imav6XWrv7UuNpt
         fGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729712826; x=1730317626;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjeWek960NcUIgiohtPXB+Vg0rJ92eP6xQNpgT2ubOU=;
        b=wZcqQ0pRUKt+hj2wEkYehGsAWW7eXazifdk6woYqt69APf3Nmmj065Kja30PCnfZ9s
         aDBdaSN/vPJB5lxAKSbJTP7w0nT4GfW8YKfh4Nb8zODzGqeyCkCAppLjdzeqCKsrNJOf
         22xNEAK9hUScUm0/wb0rQwJWIsnbVvU4ixR9eOE+qI1wouPoz/jfif2XqqpnmDUYfy5+
         f/z4ZR502WIv4H1Cpvm7EAkVr9CN7JerpeGTYQQTZgLiYPa14wVsAr87D6RFLR8PtY6h
         y+QU7q48rSN/YFYSlGkr8fIC06QSuvwz8UN/zUMR55DdypwKSFK/n1jVx6xzDDG8+5Rq
         P+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4nhcl9Ncm4Ga88VCkcgQGKfAy1sGyvE0UDpyrtvo825yyC2meMi/kl9X3B2HrYBTB96Y6VgbB0jVPsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmHTkE85hNQE7dL4209+HL3HKme7TGIExRqRj7zF+XA+yo5uJt
	jIiZzRtMaUh2tXoajgD1dmMo9e7MTluyMiaFHEIDaeOTNkbh9OAaEoR77D+KPyE=
X-Google-Smtp-Source: AGHT+IEIA9rIJ04+Qcp3TzNgVJAqmBz3KuIj/pMJ7zakUwT1dcG/rm3pZHFabLhpGBrqDgGq03uVBQ==
X-Received: by 2002:a17:907:980c:b0:a99:a9b6:2eb6 with SMTP id a640c23a62f3a-a9abf53587cmr351767466b.0.1729712825573;
        Wed, 23 Oct 2024 12:47:05 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d62efsm513496766b.44.2024.10.23.12.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:47:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 082235F897;
	Wed, 23 Oct 2024 20:47:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>,  "open list"
 <linux-kernel@vger.kernel.org>,  "Linux ARM"
 <linux-arm-kernel@lists.infradead.org>,  lkft-triage@lists.linaro.org,
  "Linux Regressions" <regressions@lists.linux.dev>,
  qemu-devel@nongnu.org,  "Mark Brown" <broonie@kernel.org>,  "Catalin
 Marinas" <catalin.marinas@arm.com>,  "Aishwarya TCV"
 <Aishwarya.TCV@arm.com>,  "Peter Maydell" <peter.maydell@linaro.org>,
  "Anders Roxell" <anders.roxell@linaro.org>,  "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
In-Reply-To: <4730e562-7d14-4f12-897a-e23783d094af@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 23 Oct 2024 16:24:43 +0000")
References: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
	<CA+G9fYsMg0fA-jraEvC==0a-22J97o-uBmbLJt16_ZKBpOT8EQ@mail.gmail.com>
	<4730e562-7d14-4f12-897a-e23783d094af@app.fastmail.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Wed, 23 Oct 2024 20:47:03 +0100
Message-ID: <87bjzalhzc.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Sun, Oct 20, 2024, at 17:39, Naresh Kamboju wrote:
>> On Fri, 18 Oct 2024 at 12:35, Naresh Kamboju <naresh.kamboju@linaro.org>=
 wrote:
>>>
>>> The QEMU-ARMv7 boot has failed with the Linux next-20241017 tag.
>>> The boot log is incomplete, and no kernel crash was detected.
>>> However, the system did not proceed far enough to reach the login promp=
t.
>>>
>
>> Anders bisected this boot regressions and found,
>> # first bad commit:
>>   [efe8419ae78d65e83edc31aad74b605c12e7d60c]
>>     vdso: Introduce vdso/page.h
>>
>> We are investigating the reason for boot failure due to this commit.
>
> Anders and I did the analysis on this, the problem turned out
> to be the early_init_dt_add_memory_arch() function in
> drivers/of/fdt.c, which does bitwise operations on PAGE_MASK
> with a 'u64' instead of phys_addr_t:
>
> void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
> {
>         const u64 phys_offset =3D MIN_MEMBLOCK_ADDR;
>=20=20
>         if (size < PAGE_SIZE - (base & ~PAGE_MASK)) {
>                 pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
>                         base, base + size);
>                 return;
>         }
>
>         if (!PAGE_ALIGNED(base)) {
>                 size -=3D PAGE_SIZE - (base & ~PAGE_MASK);
>                 base =3D PAGE_ALIGN(base);
>         }
>
> On non-LPAE arm32, this broke the existing behavior for
> large 32-bit memory sizes. The obvious fix is to change
> back the PAGE_MASK definition for 32-bit arm to a signed
> number.

Agreed. However I think we were masking a calling issue that:

    /* Actual RAM size depends on initial RAM and device memory settings */
    [VIRT_MEM] =3D                { GiB, LEGACY_RAMLIMIT_BYTES },

And:

  -m 4G

make no sense with no ARM_LPAE (which the kernel didn't have) but if you
pass -machine virt,gic-version=3D3,highmem=3Doff (the default changed awhile
back) you will get a warning:

  qemu-system-arm: Addressing limited to 32 bits, but memory exceeds it by =
1073741824 bytes

but I guess that didn't trigger for some reason before this patch?

> mips32, ppc32 and hexagon had the same definition as
> well, so I think we should change at least those in order
> to restore the previous behavior in case they are affected
> by the same bug (or a different one).
>
> x86-32 and arc git flipped the other way by the patch,
> from unsigned to signed, when CONFIG_ARC_HAS_PAE40
> or CONFIG_X86_PAE are set. I think we should keep
> the 'signed' behavior as this was a bugfix by itself,
> but we may want to change arc and x86-32 with short
> phys_addr_t the same way for consistency.
>
> On csky, m68k, microblaze, nios2, openrisc, parisc32,
> riscv32, sh, sparc32, um and xtensa, we've always used
> the 'unsigned' PAGE_MASK, and there is no 64-bit
> phys_addr_t, so I would lean towards staying with
> 'unsigned' in order to not introduce a regression.
> Alternatively we could choose to go with the 'signed'
> version on all 32-bit architectures unconditionally
> for consistency. Any preferences?
>
>       Arnd

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
