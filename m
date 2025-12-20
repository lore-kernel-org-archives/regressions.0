Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0813AD1C
	for <regressions@lists.linux.dev>; Sat, 20 Dec 2025 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193584; cv=none; b=Coj6Q2QHuNMq0DFfn3JfVRH+t4vVcBEQQLmp3RKaghU/w1RgdHHv8T+vO4GZcNpk9v0ylfTRJKMCPlYrIa2QXN1qfxIYWBmP5OXRTcvDzywk+PWLXNUm2icIRLAKNGsnshl7rIzLYgUhY30Zjh+fEkE29Z37OFrorspHSYLuaGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193584; c=relaxed/simple;
	bh=UAv4VsnO1f6WhxU7SkgAuV0N5XBMbtSHDkWqN01Nnf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKwbibQyaMEO7KJLgfura98x7e7GjSPCCB/U2vUQ5UjJrTABaLQwbI0iLmQZE/ABDjOMsT3SFa11SYwc/73E6JfLKB/Ro6vtnv/aYv1wkR5WLREG0Bg2Jglzsbzp5FEAB+2MF67icp6ECXBITQkvCCNKdojFVbhMWRDzIe4jxto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUUhu2R4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUUhu2R4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477632d9326so14180045e9.1
        for <regressions@lists.linux.dev>; Fri, 19 Dec 2025 17:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766193581; x=1766798381; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zK22OFLvaJjEwSRzCjqir8eHtku5CMTMzFAHnPXvPsE=;
        b=VUUhu2R4vSK+TVofe+rBqd6mWwZC03lm32wgOJhu5GzRr7kVZcCMkEhCSN5HPSAqD2
         colnzM75f/vyCc5sET+DUuEfgq8JNFcP3d/S9ndoMlX25rfwqmTxq+YEGWSl7T+lNZEH
         HDiL2rMxc3DXKi/vd6Iqto4KszmXvDp3O9Xyt5x3ogbdcgHS07uabpIVaqwM1eLen9oZ
         WEUsHyZjhrHsvUXTreWrYKKgvu6araq9y9n3PsFYHFvzdTXtLpNMB7RUb+gWstF0Q3R/
         hY8MSfrsX/iXDt79r3ThtfL/Znw99I+oy7LGH/b79P+rJHGQyV0OP93zADqmcbdFV0NV
         gvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766193581; x=1766798381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zK22OFLvaJjEwSRzCjqir8eHtku5CMTMzFAHnPXvPsE=;
        b=hF4j/2sLvH7GnAB/+HDcQdEnjwzvUAVKF/h+YxeeGmgXzV70x9mPoQZ5SuHbvb9a5d
         Xii0q9VUmYWqEns7xCkQgLFmAe8gFXnZZm2F7KuQd/cSmaqQdn0BaUUGjQIuHk6xqPcN
         sk1jKvggBP9WkN/UWKHjeKb7wli9o7qJTJTpAWzXszs02DeQ4rm+OOb4C9PtXJsMFItB
         C76V1wnAcCUpq+xLX23FMeoDb4pdrFaVzr1vPD8SNpHNxf38CLzE5LWvlHreRV69OVbD
         wFeOb+babO5gz50JXoCKab1aTOmcGXWml+upKXzD+hmuXsGzdjGF4sluC17ULnVv7Fdb
         g4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUof+nwf7wmXbED767RQTX07QcKiUhheEDAS7X3cRa0jliiNqfchBYAt1Gueayxv895yyCcEW3uj7kzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlKnZjvP0uStnsOs5Wca4bUd9RNhZxXUfkV+Ugh6RjFSP1WyxH
	PWbRZ23tDW51cIC8VX7Vqjn+6GXdkO+B4E80KVu9drLFyS5UOcFvtKyL
X-Gm-Gg: AY/fxX780ejNdcEVjusHiIAQb8DvXqsXYzuvWRSZFZZW3GN0OAEm4Ca0eYpHnGtVZxD
	Q8govbRtz+TRn88aoH9MQx6goaBMNu6hv31R9ggebee9JjekSwwSbGKHS2y7hlhkoPTt8M+MYt9
	hZYf6knorCpswRLWZPaW3jH7DTr8Ubp/YGsyiUW+nREaM8sAkWI05/BBOHzWwLT0g+0xCVXkwFm
	tMLPLP0aFdW34IzTbPUi1qpaS1KoVZl2rFeGhHNalmzlMC4QM+hSDMEAhbxyAOyWWrg60TdZCd+
	Lj3sOjx3pfTkPy5sJP8L3UQ075fMc0wj3Em8oHLIGPV/DfaHsMWJFVaw03yhsMmOpSM17fTX3DP
	zp9XwB6ofbRYK+iDf6PTCabkvlOedmgj7uP9SDnLkRiEENpIyS/kdPWAN37x+ikIXoWcPqD4zAm
	frNjkVaqEdEHirZokwGeSNHlARFs4/6h4V8Gw=
X-Google-Smtp-Source: AGHT+IF0wGcWgILC9H3tfPesbVD2VmsjrslWPh0/J9HlYlPO8n11RyhVH5Pxz5vhOfwwh8J55YseTQ==
X-Received: by 2002:a05:600c:4f09:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-47d195672d1mr43896195e9.15.1766193580895;
        Fri, 19 Dec 2025 17:19:40 -0800 (PST)
Received: from ?IPV6:2001:871:22a:3342::171c? ([2001:871:22a:3342::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm135576055e9.2.2025.12.19.17.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 17:19:40 -0800 (PST)
Message-ID: <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Date: Sat, 20 Dec 2025 02:19:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Nathan Chancellor <nathan@kernel.org>,
 Rudraksha Gupta <guptarud@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 llvm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
 <1910f4b6-db74-4c86-9010-28ab4462c5a7@gmail.com>
 <20251219211147.GA1407372@ax162>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20251219211147.GA1407372@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/19/25 10:11 PM, Nathan Chancellor wrote:
> Hi Rudraksha,
> 
> On Wed, Dec 17, 2025 at 02:21:11AM -0800, Rudraksha Gupta wrote:
>> On 12/16/25 06:41, Christian Schrefl wrote:
>>> On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
>>>> Hello all,
>>>>
>>>>
>>>> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
>>>>
>>>>
>>>> In short, what is happening is the following:
>>>>
>>>>
>>>> - The kernel boots and outputs via UART when I build the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>>>
>>>>
>>>> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm"
>>>>
>>>>
>>>> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.
>>>
>>> I've managed to the get the build setup for qemu-armv7. For some reason
>>> I could not get past the initrd even on kernels that are supposed to work,
>>> but I think that is unrelated (and not a kernel issue).
>>
>> Yep, I just got qemu-arm working to drop into a debug shell for now. I have
>> to look into why other things aren't behaving nicely (but that's a problem
>> for later me :P). For now, it seems to demonstrate the problem nicely:
>>
>> https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740
>>
>>
>>> On the linux-next kernel I didn't get any output on the console from qemu so I
>>> think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.
>>>
>>> So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
>>> do a bit more digging, but I'm not sure how much I'll get done.
>>
>> Did a little more testing in addition to the testing in the gitlab issue
>> mentioned above:
>>
>> - Removed Rust configs from linux-next/pmos.config -> didn't boot on
>> qemu-arm and my phone
>>
>> - Then I removed Rust dependencies from linux-next/APKBUILD -> didn't boot
>> on qemu-arm and my phone
>>
>> - used linux-stable instead of linux-next -> booted on qemu-arm to a debug
>> shell
>>
>> linux-stable is built via gcc:
>> https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/community/linux-stable/APKBUILD#L179
>>
>> linux-next is built via clang:
>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD#L68
> 
> It certainly seems like LLVM / clang is a factor here based on the fact
> that LLVM binutils were being used with GCC based on the original report
> using 'LLVM=1 CC=gcc'. A few additional ideas for narrowing this down:
> 
>   * Does this reproduce with GNU binutils + clang (i.e.,
>     CROSS_COMPILE=... CC=clang)? This would further confirm that clang
>     is the cuplrit since GNU binutils and GCC are confirmed working with
>     linux-stable, correct?
> 
>   * Does this reproduce when linux-stable is built with clang / LLVM=1?
>     This would rule out a -next specific regression as well as allow
>     diffing the linux-stable GCC configuration with the clang
>     configuration to see if there are any configurations that get
>     enabled only with clang, which could be another reason no issue is
>     seen with GCC.
> 
>   * Our continuous integration boot tests several ARM configurations in
>     QEMU, including Alpine Linux's:
> 
>     https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/20379046102/job/58575229973
> 
>     So it is possible that a postmarketOS configuration option
>     introduces this?
> 
> The results of that testing might give us a more obvious direction to go
> for troubleshooting, especially since this appears to reproduce in QEMU,
> which should make debugging in gdb possible.

I've found the issue (at least on qemu), it was just that the driver for
the PL011 serial was not included in the config.

I don't know why Rudraksha would have observed any difference disabling
Rust or clang though.
Maybe it's an entirely different issue on Hardware?

> 
> Also, what version of clang is this?
>

Alpine clang version 21.1.8

Cheers,
Christian

