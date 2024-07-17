Received: from mail-200162.simplelogin.co (mail-200162.simplelogin.co [176.119.200.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C484688
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721253580; cv=pass; b=BQSkVz8ulJB+NqTf3y2vOFCdnyP4kWNwJ6mbbz+ymOuQvoadoWRVsx5vDDzDnUaqc6zS/mmIxh5cJtifTiI7ls9peQqDYx2a+ARIcqjf3922BRwu4wIGsDJ4kyw2hP6TzAGQrecR8cT/FXmDl39pLnqbORq1vQchEcEneZ3dORE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721253580; c=relaxed/simple;
	bh=LPMPOHPZeaVBTXmVyrbvuG1Qi/BSmAdrUp7qysiOLYo=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=MYTr4qOvC/Tga0V3lqKbHG/+UqTOG401eyi+Dvi6juFnh3i8wO50aT9+R2wx6eCPLr6Zw3Uy/u+UBcYOcXm94V+he/fruDuZ6xAgZy6FAP3wFfh4+Qsfy4KdvKMk9XUS6uUQ+pwkQSYYfjPdcdpMvI5h/qkI0KkxcaAHugNlAiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com; spf=pass smtp.mailfrom=simplelogin.com; dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b=P/Ne0wWs; arc=pass smtp.client-ip=176.119.200.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b="P/Ne0wWs"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1721253571;
	cv=none; b=t5whVp+rc9UZ1wNNnc2/p6I6C1qTxRIwRZMtg5TGtfm9ILLk31apoujMkjjQmRbKl0cIvmBFj1Y7QLe+Zb9/tz6eJdbVbBlzRebVU2EJJikYsjf9PBQIzRwYBymfXWYxwX80V/kr4QCqlgSe352fk2wKX3zBkYdxP2KG0JQhzFCSDI1/gQr2qKD8G6TTO7c3I1YMAiarDpQmth2w7aa/lKaCw9P8XmmPZU+Mosymxe64iJXN8zFImYH50LVcKOLgE4jGPS1qZpRnBxAdKIvgqMVwUNcm9LPVJPCJEQv96IMVjEGdd7aMG3JWjX4GwYvrosdEQiTd4Xeln6wFTnsc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1721253571; c=relaxed/simple;
	bh=LPMPOHPZeaVBTXmVyrbvuG1Qi/BSmAdrUp7qysiOLYo=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=ZiCsQg7FRAf9EqYMYVp+Kibq9rjgsgp382g5kek+Ij08M15OLo+NenGftRx4SabZyxPVYivRggvu53TCNfMe/+xlptVfFsdTbDezLvhWKCH0yZRq8kGlyY7WSyBWfdx5Dinhwz9YcDaFxtIEFCZeaoX83m51jPexpwGvzxZ+xZo9E30qXpWy50pCIJBnM6HQ8rrfe8ERXpPZ/6AN2RFffykWT02SY6T95BM9DsG2pFrsVTd27ZQ384ByZiF1rg9WD1U43dt8hduvufp3/4PpKNIb5sPJ07Ej9rDvwfl4/xuR4w2seGYvAn3IqWIGte1kkLzSjn8zXYC7qsoPfKH5Lg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
	s=dkim; t=1721253570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMe8O/xpGggBKKRCrsCPjdJ/b6mjZ+tyvhWoj7F5UlU=;
	b=P/Ne0wWsVzA/QAHOi0Tl8/LrfmrFeo8dp8/t0eW/Pv51OMKBldlonOblLvn2mrJj/a3tK8
	CMqAPlQ4Cm5s8KtlGV7YzUQjR6QvRRqqrZTuT4gANZplFMnsQuWgkjC5QnNaUOKHzaWwZN
	QVeIH+oyAvs8c/GeSUytABNKu+SXvK0=
Date: Wed, 17 Jul 2024 21:59:24 +0000
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
In-Reply-To: 
 <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: mavrix#kernel@simplelogin.com
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Radek Podgorny
 <radek@podgorny.cz>,regressions@lists.linux.dev,regressions@leemhuis.info,Christian
 Heusel <christian@heusel.eu>
Message-ID: <172125357072.7.13007674265724826216.382402450@simplelogin.com>
References: <172096653882.8.16813493378478071178.379356753@simplelogin.com>
 <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 382402450
X-SimpleLogin-Want-Signing: yes

On 7/17/24 5:55 PM, Ard Biesheuvel - ardb at kernel.org wrote:
> Does it make any difference if you boot with 'nokaslr' on the command lin=
e?
>
> Another thing you might try is applying the hunk below, to try and see
> whether the placement of boot_params in the binary is causing the
> issue.
>
> I can also provide a partial backport of the offending patch, to
> figure out whether it is the allocation that triggers the issue, or
> the way the boot_params data structure is populated.
>
>
>
> --- a/arch/x86/boot/compressed/vmlinux.lds.S
> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
> @@ -55,8 +55,7 @@ SECTIONS
>          . =3D ALIGN(L1_CACHE_BYTES);
>          .bss : {
>                  _bss =3D . ;
> -               *(.bss)
> -               *(.bss.*)
> +               *(SORT_BY_ALIGNMENT(.bss*))
>                  *(COMMON)
>                  . =3D ALIGN(8);   /* For convenience during zeroing */
>                  _ebss =3D .;
>

On 7/17/24 7:16 PM, Ard Biesheuvel - ardb at kernel.org wrote:
> Please also share your kernel build config and the output of
>
> hexdump -C /sys/firmware/efi/efivars/MemoryOverwriteRequestControl-e20939=
be-32d4-41be-a150-897f85d49829

- nokaslr does not make a difference; it will still not boot
- linux 6.10 with the partial revert applied, as provided by*@loqs on the A=
rch forum thread, does not work either - the requested=20
hexdump is: *00000000 =C2=A007 00 00 00 00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|.....|=20
00000005



