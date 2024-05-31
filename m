Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B439FF3
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158589; cv=pass; b=e6PoATHt4oIfRDE2aICyhjBgXfahpnPz8RgVrDZe9JV56TBPni/V5ecRVL31ZUUslq+dSXJgDFRXmwxNgmjXOLr/p/dmWdkg0RT4IhlvVeCTqVtrKl93DyfbsrmeYv+yt7rop9L6LOC84V8OtKJXcjKy1zat+vIOpTCZLKyEWqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158589; c=relaxed/simple;
	bh=csQvlmnmzzldAH1zGUruJ99f35VLka6Fn7mo6b6y/4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cDP3zfJAb0Q9glj5E9yEXLWUkudlfeDmBoihlCoqDlUKRUWj4W2A9yzR0Vvo1xBAMqNG148zi2uv4ZVhuwq15QEOqZwupsFkLjKo6rqf5YD3BrASFrAnGzNXcdqTf2sRX4WTvsXJ/NC6pXyiWUFcq5bTdY/DIRM7pERukYFYio0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=EWPonKkM; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=lhCMJLco; arc=pass smtp.client-ip=81.169.146.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="EWPonKkM";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="lhCMJLco"
ARC-Seal: i=1; a=rsa-sha256; t=1717158399; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bs6HxUeetj+EWaGyVxMKlJRXaAGTzs48IihGwjFViZWeV3ZeqL9yJAi5mK+Wxpw3oj
    4EHAfpDN7m9pUYMdkDWOERI72s7aWF2Ywl4cDBnzxrx4gi+LYlBiW8grsDH445EgnsS8
    wubqq0kh68a4+89H8U0Os35axlKirPDBaEzv1cs66xvyjy9h2Rv5Eidfpgp888kOhGLR
    01FRjL0ap6Pp2KhIqBJ0Dzi/hR5f1Dzp2c6M19wcl7k8BrNl/amMxnkckDdQ0CZiSfQx
    DNu6ciIGAGwu8aZ30oumH0PpwP7moRGf5wdn2bin7BHOQIrWxXeG2Og+lTpx2mt0FUq/
    Dh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1717158399;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=4fffa7HnfxrKlSrFwaE1xgg4P7hM9NiByDYj45gR3ec=;
    b=pg1Hnn1qIavy4PgRnzJ5CISH6PvLsSH8Rqef7z8hA5zQ+TwE7MDkPakzJePPTK+HsJ
    Kyc+h+oY9SKvh4Cj9uGhbQ9EZyT8tUuvj3+jFSAoNg6qkihBnlnC1CnJ+nI3p+xH7XvG
    P+humqPDG8UfWKA7F8vQaAg4foS6abbPC1ipTn6b1Bjv0GNhYWlbwN/SXe/GlKx2U405
    cLUNSVQ8S/d4ZV/23eFcxqdG9bYam6ZwSCR3efc21ZpTb5w7pkMmDuxl4lmY4tJpOULn
    ItRKBuhpfoiI461CcbJwpkmtj1d2xP46NIQwRrzOz+ySMpWT1DGzb4KclLBHUuPNCGYj
    XZGg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1717158399;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=4fffa7HnfxrKlSrFwaE1xgg4P7hM9NiByDYj45gR3ec=;
    b=EWPonKkMLWNGf1kND6YFKBRuv2xiuGIdL5/TgPqvYGmDzc2uX8ghg33Ac+V2wcUo7K
    KtphvyS5Q8hU8fceX14T9yc8jW9iSh7fseNsZZqNVWRxuNP2rYrmUivMw7ZwKQRaOOZk
    HIYM1+dqoh9EDLFbi+/OCWorK7XLR//+IxTnZTy5YmYLh7pDP3PDASJvjnwzrsuCF6Tb
    pd3OXGOu86fE277rM1TUMiJVqm/ncNaFybPzxziqfELfclRqUc8Xre+HXz6Q/UhO2FJp
    qzunQNvVdY4pcIOzSJd0DBOo+QTYIvzfmwwTJaVkZpZJwb/onyQQbMoUz2KWX7iVwZZ3
    m8kA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1717158399;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=4fffa7HnfxrKlSrFwaE1xgg4P7hM9NiByDYj45gR3ec=;
    b=lhCMJLcojxrVP/ivV1ajKdqSc1h4bvGa8z5uE9T1FBgCzI/5EtBLgIjf+/lfsSphn9
    Gb/gh/NdW5FdRjrJa+AQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43J0lbSiPOfaY0XT9zGWI312LPn8wNt1+3JXo6M8="
Received: from [IPV6:2a01:599:814:b9bb:b156:e740:f15d:79cf]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e092ae04VCQbzmr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 31 May 2024 14:26:37 +0200 (CEST)
Message-ID: <b307ad01-023e-4c78-b9d3-92bcb8403a0b@xenosoft.de>
Date: Fri, 31 May 2024 14:27:05 +0200
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Christian Zigotzky <info@xenosoft.de>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <87zfs731jn.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.24 14:51, Michael Ellerman wrote:
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
> That is presumably because of this:
>    https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
>
> cheers
Hello Michael,

Many thanks for the hint! :-)

I was able to revert this commit and Xorg works again. We tested it with 
a Radeon and a VirtIO-GPU.

@Skateman
I reduced the uImage. Please test it. Link: 
https://github.com/chzigotzky/kernels/releases/tag/v6.10.0-rc1-4

Have a nice weekend,

Christian
