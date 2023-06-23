Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3272E23109
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 22:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CF0C433C0
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687560917;
	bh=weOVIPX4hAWoUV6Jeu0W12QfWvVBdBF8o/HWsfEgReg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u+wQ/8vmazD36SpKNw2YOm0hAbLZARjAvAe11jZe15SkEhf64ntz68tc2LRI39Zq+
	 KS4Ke24qUP09whKQk0yI1dZXTQPri0fj+z97djQQCbX9UoByaWQel+aRN93/FMoVes
	 NLJeCxEnCyMs2fMcrod34sjXB0rdl04wsa0BydGYbT+O37udslwVkxSwRokCkT0xfd
	 apdzGFVBaCP8rWx2ZZoLjtVQljNP8dvZsgqnLG+w1vY+1X1YXMFfD0NS4gloqOL8o6
	 3/myydGKKteVONl9o2ioPpB6E2pP2LBXZRzbEpuMga+KXYXKGAww92Jeohnxqtquby
	 bt1Xjmco6xi0g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f86dbce369so1584826e87.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 15:55:17 -0700 (PDT)
X-Gm-Message-State: AC+VfDwtjpARQrM2/tQ9DIOejEI37X382Rt224N29zxMzjoANT+C9p7v
	zJ25RKaILpQYheS+Sw+FOBveMWz3u2h9JhuVmXY=
X-Google-Smtp-Source: ACHHUZ5ZpkrLcguE5vC7mCL5z1dRy/+wsNHNNVIvve1lnIWpIW/ZhU+RN6svbHMRj1LHmEZ1oVSngzhhCk/sJHlU1YE=
X-Received: by 2002:a05:6512:10ca:b0:4f9:6b64:9a36 with SMTP id
 k10-20020a05651210ca00b004f96b649a36mr3826766lfg.62.1687560915498; Fri, 23
 Jun 2023 15:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com>
 <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
 <CAHk-=wiiFHLSDe3JSSMm5EezpXXMFxYH=RwFLEbgsCKLjg4qqQ@mail.gmail.com>
 <CAHmME9oC6Kq5qeoSmY5CdDrbGnkcp9sy-9ESXdpRtM8x1_6Hwg@mail.gmail.com> <CAHk-=wjKtHwJBeUiJL_1HFJKWja120w-6qaLx1FS5p9QE0PfSw@mail.gmail.com>
In-Reply-To: <CAHk-=wjKtHwJBeUiJL_1HFJKWja120w-6qaLx1FS5p9QE0PfSw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 24 Jun 2023 00:55:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF7aO1FPXeBFeLBe1-7j5hUjiTAXu-xV6oKFN8dRY3qDQ@mail.gmail.com>
Message-ID: <CAMj1kXF7aO1FPXeBFeLBe1-7j5hUjiTAXu-xV6oKFN8dRY3qDQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, regressions@leemhuis.info, 
	Andrew Lunn <andrew@lunn.ch>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Jun 2023 at 23:52, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 23 Jun 2023 at 13:31, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > We always have to write when using so that we don't credit the same
> > seed twice, so it's gotta be used at a stage when SetVariable is
> > somewhat working.
>
> This code isn't even the code that "uses" the alleged entropy from
> that EFI variable in the first place. That's the code in
> efi_random_get_seed() in the EFI boot sequence, and appends it to the
> bootup randomness buffers.
>
> And that code already seems to clear the EFI variable (or seems to
> append to it).
>

It reads the variable twice (once to obtain the size and once to grab
the data), and replaces it with a zero-length string, which causes the
variable to disappear. (This is typically NOR flash with spare blocks
managed by a fault tolerant write layer in software, and so really
wiping the seed or overwriting it is not generally possible)

Using SetVariable() from boot services to delete a variable is highly
unlikely to regress older systems in a similar way.

> So this argument seems to be complete garbage - we absolutely do not
> have to write it, and your patch already just wrote it in the wrong
> place anyway.
>
> Don't make excuses. That code caused boot failures, it was all done in
> the wrong place, and at entirely the wrong time.
>

With the revert applied, the kernel/EFI stub only consumes the
variable and deletes it, but never creates it by itself, and so the
code does nothing if the variable is never created in the first place.

If we leave it up to user space to create it, we won=C2=B4t need any policy
or quirks handling in the kernel at all, which I=C2=B4d prefer. The only
thing we should do is special case the variable's scope GUID in
efivarfs so the file is not created world-readable like we do for
other variables. (This predates my involvement but I think this was an
oversight). Using efivarfs will also ensure that the 'storage
paranoia' logic is used on x86. (This is something I failed to take
into account when I reviewed Jason's patch)
