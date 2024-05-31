Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B343770FD
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146190; cv=none; b=Qq3zYBtXpd5QXRPvW4zYgT5MlVWd7+JF75UnsYdjgy4aYhblyVQmKQXG79/W4XR3aHZL3xVMv6xC+TxalHSCdvFbnlC5Jy0Ic3BmyelYr7Q053sllNgsog1pOcLIm/DceL5p/g9rcLANw1Pnz8H4C85FAlcWQaFcCvQ0SRN30+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146190; c=relaxed/simple;
	bh=/Kkap/azDIUI84KyZ81iAOgOc+PxAbge21lLmLqdsGI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K1j6jpLerMMbiOfW3zGIJMBRrja6ecl7u618zZo6h7wYFsx/ooGgpyezO4oGuolPdBvBZsGA8HvDNRXvzpkObNi8QtB3dF0LFxzS0WCKqeodiOSOVMFB/riLb/useRVuDGhBgeTZcXxCvuyqw6qfKY8q9T7U96ykdj3xsbw7U2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=M989URgs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="M989URgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717146185;
	bh=Be/Bo5uim5k47lx+ZGvRVOozMX8CnKvGj91vH0atq8A=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=M989URgsfci4Jdp2BHeZUnZ9yFkUR0iWWi4MNayDECIqWKak+rJ16iZxVtKb02Czx
	 q+676B0Gs5q2bWhFdKhstlmwEfvWKENQ3z9EG9DQOqeut+a2EIgJ+bILE5NNejmD0e
	 S9sLyfEQoDDbt7Pvvlf1SJgZEenfur4CWVZZxeNa6GBFgMZhaEwHucBgDWXDq87eUq
	 C/KYKUBS7rR9esyvtwmkKSO6JtDfsClqFulmWTm14EcDioVafvzA2/Qtoxg3nboNtc
	 Ut9V/c56ZD+EFXuxJglRBh6Hnm/OpRyXXD9cJ7aeurdj4NoQfmjavCzCKuR9+JNkzj
	 p455NIevWEZrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VrHG05QpYz4wcq;
	Fri, 31 May 2024 19:03:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
In-Reply-To: <87zfs731jn.fsf@mail.lhotse>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse>
Date: Fri, 31 May 2024 19:03:03 +1000
Message-ID: <87plt22w1k.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Michael Ellerman <mpe@ellerman.id.au> writes:
> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>> On 28.05.24 22:00, Christian Zigotzky wrote:
>>> Hi All,
>>>
>>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
>>> with the VirtIO GPU and with some Radeon cards.
>>>
>>> Another error message: Failed to start Setup Virtual Console.
>>>
>>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>>
>>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>>>
>>> Could you please test Xorg on your PowerPC machines?
>>>
>>> Thanks,
>>> Christian
>> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
>> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
>>
>> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
>> Inappropriate ioctl for device.
>
> That is presumably because of this:
>   https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/

Attempting to regzbot this.

#regzbot introduced: 8c467f330059
#regzbot monitor: https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/

cheers
