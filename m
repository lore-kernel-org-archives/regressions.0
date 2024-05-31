Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C87C768EA
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147186; cv=none; b=TksczvwrR13ZXTfcuoydmabeXQ+LuCTLTcJelOlTKzXqYxvk868UBSg/RRMLX2P9bzcChSUzG4QtVaxVO7Df3n3HSqg6F2uuMu/JyfsncGZVus8eCW+/VICUOWatChtKYyj0NUjTvv3ZPE5LwOkDk39/gya1QolHsnMcnXE8j84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147186; c=relaxed/simple;
	bh=L+BEFA9Zg3+OPZzRKUfoAmL3pZB95OR5zqfa8cgy5L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gEQoIAAQCJSBWukntOOjFWZOZHlz44aEY85LPU3iFxpl6/Jjf3WAd/BOTCnyeYE+DTpPTjHNz2RMjCcAiXvRdmv8gyGsDGNgZCNdYSB+WQxzc/FvVQbKgRiyrQxT8A++eVqZKI5KkLsAZwhs9mQSanBoAUOdJ1kMKONL9c2vD2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=n1C4uUEL; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="n1C4uUEL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=XCfUSwwG38LbsorFibZSI1D3cUGb8T2kMLpzHOPARB4=; t=1717147185;
	x=1717579185; b=n1C4uUELN5r3EdR62UlbtN6djIl/5pxMmHI+1u1t8BNGjDbT9AbggZ8I1DzYj
	nCWUyX+A3AZ9LsNTSQ49/ncA7nbHLymBZiC4Vy4iuJTt7Q8449eIafhIuE5vZWSASLYVwk7uxtIh4
	P53kdly/1YbWglbrFTFXqrJ2a7SJa91u+3TUXptJJtSO3ZLAf8uQ674hbkZAhjY7M0NkJNJipevgR
	A2hmOI/hVG+tKI618HvoTdVjkWRpGnJ9W9EefkSZ3EYJ3QXQAFMnXijyKnyUUPK4t0jNfDxYxcWdW
	HWNRJOLVJw1Xtwg3ZYKKDztjpNWMmItHUSzYX55n7o3XMTpAYw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCyQB-0003ML-EJ; Fri, 31 May 2024 11:19:35 +0200
Message-ID: <f4559641-2a64-4a1d-a00c-0f5ed85f3354@leemhuis.info>
Date: Fri, 31 May 2024 11:19:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse> <87plt22w1k.fsf@mail.lhotse>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <87plt22w1k.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717147185;ce6318f2;
X-HE-SMSGID: 1sCyQB-0003ML-EJ

On 31.05.24 11:03, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>>> On 28.05.24 22:00, Christian Zigotzky wrote:
>>>> Hi All,
>>>>
>>>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
>>>> with the VirtIO GPU and with some Radeon cards.
>>>>
>>>> Another error message: Failed to start Setup Virtual Console.
>>>>
>>>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>>>
>>>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>>>>
>>>> Could you please test Xorg on your PowerPC machines?
>>>>
>>>> Thanks,
>>>> Christian
>>> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
>>> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
>>>
>>> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
>>> Inappropriate ioctl for device.
>>
>> That is presumably because of this:
>>   https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> 
> Attempting to regzbot this.
> 
> #regzbot introduced: 8c467f330059
> #regzbot monitor: https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/

Thx, I already had an eye on this, but thought tracking would not be
needed, as Greg (now CCed) wanted to revert 8c467f3300591a ("VT: Use
macros to define ioctls") two days ago:
https://lore.kernel.org/all/2024052901-police-trash-e9f9@gregkh/

But that commit is not yet in -next afaics. :-/

/me meanwhile wonders if it would be wise to fix this before -rc2

Ciao, Thorsten
