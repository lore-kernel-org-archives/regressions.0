Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2D125A9
	for <regressions@lists.linux.dev>; Sat,  1 Jun 2024 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717224345; cv=none; b=QFSqSkdTUaGvfdyB65265y/axtZ03o08zdJWbYEiXvsS86/13fI6zex/UC3uF8heoMbYDwVPzWWfd28GIIzV+gT/0OSF5woFXT9H19TWaxgmjyq995EVfimpp8nOo0ahlUvqeihGTP84Z4Ng2OZRb9J1PcwRsXgfnm+x6T3+QKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717224345; c=relaxed/simple;
	bh=fvSvhRvqxYljJlsaxjZeM/jG5GCdXMxpQ2wuG1QYp3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=et7rcRCHFhIue5fE9kQPcJVvbkS1zTSWcxmvXpaVXCyD0eEyx7+1i4v1qq9mzrASpaHTXN05eEUB4cUkOxa+AeISOUa1/ASxKvuaqnqwgKPctp+Q4ip+OblEYuGydrpZ89fcQOi+KnG+zMoNnz2SHtjkVNGeKInnr7u96ROM7pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LsXH02RX; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LsXH02RX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=M3VbKv/Z7RsHsd6+54TQ3z6DsAp7eyx6ax81hSXAgsU=;
	t=1717224343; x=1717656343; b=LsXH02RXNo+EcAjgKkXxpzX3QuUHnQgc4/PvCWSOMpdLoyo
	brY6UWz/vzIIBik8vuWR/82hVkfPVORg2e/039VxE4q49XUYq/qAynmoHeUD1KRyVm55DxLdPXj/P
	M4f6vNB/Xcz9dCnIhg2IV0rYSjziuCKSUaEo9ovd3BEr9oGQtoe9JzgsppNBLTRTOMMwpUnHtbx5g
	fGKJY0a70kLeSU2m/rdK3zP/ydbx1QNwTDFTw8dsSuh660s/73h9t9jPJXmlgqn9Sq+hjVGLqUIi2
	NVckEcTVO3r81pymyCo0AtAsiKIhKXnNdB7QNFEtQFk7YbqHE0FyDYBiKff5n5Ng==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sDIUm-0000AT-9X; Sat, 01 Jun 2024 08:45:40 +0200
Message-ID: <e98cd7fa-0845-4de9-998c-96a0cf884f6c@leemhuis.info>
Date: Sat, 1 Jun 2024 08:45:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse> <87plt22w1k.fsf@mail.lhotse>
 <f4559641-2a64-4a1d-a00c-0f5ed85f3354@leemhuis.info>
 <2024053128-pueblo-skid-585e@gregkh> <2024053145-tapered-kleenex-d647@gregkh>
 <2024060155-chemicals-carrot-ea58@gregkh>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <2024060155-chemicals-carrot-ea58@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717224343;98ed7e1d;
X-HE-SMSGID: 1sDIUm-0000AT-9X

On 01.06.24 08:34, Greg KH wrote:
> On Fri, May 31, 2024 at 12:16:50PM +0200, Greg KH wrote:
>> On Fri, May 31, 2024 at 12:02:15PM +0200, Greg KH wrote:
>>> On Fri, May 31, 2024 at 11:19:34AM +0200, Thorsten Leemhuis wrote:
>>>> Thx, I already had an eye on this, but thought tracking would not be
>>>> needed, as Greg (now CCed) wanted to revert 8c467f3300591a ("VT: Use
>>>> macros to define ioctls") two days ago:
>>>> https://lore.kernel.org/all/2024052901-police-trash-e9f9@gregkh/
>>>>
>>>> But that commit is not yet in -next afaics. :-/
>>>>
>>>> /me meanwhile wonders if it would be wise to fix this before -rc2
>>>
>>> I do, sorry, been traveling this week with geen vrije tijd.  Will get to
>>> it tomorrow.
>>
>> Ugh, sorry for the dutch, I have "no free time" because I am studying
>> the language this week.  It is bleeding over here into my emails now...

:-D

> Pull request now sent:
> 	https://lore.kernel.org/r/Zlq8yMiUBTOisuWp@kroah.com

Dank u wel![1, 2] And good luck with your studies! Ciao, Thorsten

[1] "Many thx!"

[2] I understand some dutch (more than enough for "geen vrije tijd"),
but do not really speak it; but it was enough to get that simple phrase
right on the first attempt.

#regzbot fix: 7bc4244c882a7d7d
