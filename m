Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995571C9EA7
	for <regressions@lists.linux.dev>; Thu, 30 May 2024 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073521; cv=none; b=DXe3prgxyUkx1jVenPjvgyjKWssuaQfzP+kqBoyb3BojgkE/zekxLqqf0ExczKjP7EZVj7MHniKOZkfGI7obtc1gKuCHavzfjlSkDEs2CH5FahtkPR4KpH5Jjnxqf2WDvTfdJZJvXpeOdoX8NK+YfcY5z8TGthme2jIZlWBiI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073521; c=relaxed/simple;
	bh=WEpjE071napbAvBiKxaXpW/8WM+JX7ouLLNAW70nzaU=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gir+rB0jy6l2FNs+5TqAS+hG4fPFaRvBVyuiXev2pFFXLqN3Mp+S1TMj858zwja0aDrjG3sJ5VlAQGw1cjGJULubq7Tiamczy+Bwep/b0DAnzpsLq2fDb0zELUiLIOjU8HrOJ1bAbgm2Ss1WhSniJ7ypVdCqLzD6Xhr6lsaJtsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=V+X/jXKu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="V+X/jXKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717073517;
	bh=nbpfdIkBoH4ag3VRmmnhOBkhh97JDa0cmnf8dyt1Ebc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=V+X/jXKuNB5khu+w3zhoYa9uXNCiwVZ1oGrrcsrrbLlpQD9n2ANEevqE20KmFCvRa
	 t3pQXrBr9MvM8TmVYPzgbY9boaQ6zH9kmlgJFEEYFsw7HRYKzTS/Smz3wJ4KHVysBk
	 oZB/NT2M2lyvS4Zcs3o+m0KJchtY3tJSMlIq5lWBaIZAO2iP+Ledss9r+/czolf2HI
	 w/EnoRkDboJc8noG6FjE6RoyOyVbgcEfqleglP2WRi6+f6eUix2bdeDNB2XrkIKVsA
	 /e2MaMnfIyZw/cxm9NAhafSDBO/SSFKf1hWcQekSyiMUe4qi/lJn/JPAyaptQOmIzk
	 CKyqKxvWIUlFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VqmNY21yWz4x1C;
	Thu, 30 May 2024 22:51:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
In-Reply-To: <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
Date: Thu, 30 May 2024 22:51:56 +1000
Message-ID: <87zfs731jn.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> On 28.05.24 22:00, Christian Zigotzky wrote:
>> Hi All,
>>
>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
>> with the VirtIO GPU and with some Radeon cards.
>>
>> Another error message: Failed to start Setup Virtual Console.
>>
>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>
>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>>
>> Could you please test Xorg on your PowerPC machines?
>>
>> Thanks,
>> Christian
> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
>
> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
> Inappropriate ioctl for device.

That is presumably because of this:
  https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/

cheers
