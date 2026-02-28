Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6A2DB790;
	Sat, 28 Feb 2026 21:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772315001; cv=none; b=W3elcg5zd79s4dX12DWZEBjzy60AOAoY14Utb3vIrBUAx3GnN1OVQvWEx/wOYE+cASG9pgMTITzSnxCvP/Q08nrIiYiVwUJ870SQrj6Wh/rtRcW+dzpcEvFK1CHPpIWUoA67A7Wues2YSisXDjFjrPV1M6RAlTnOxVzfjCCSHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772315001; c=relaxed/simple;
	bh=QqgNFW0oD1ptDxSjWze9rBni61UBMN9mD8LeiDn17pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYXfPXRwbqmpVnXVH8aKu0RVhOAYViseRs6Rd58E8wHW19XUrUiJ02F8yDoMdQwExtOeTpGRLEkbyc+F9VDNxEPosWcMIRQx2EYjgonrSuOf3WvJRCiBH4wVtiYq0QbvU3Sbh4Zkwlemr1NProyM7f9hpCz9giOc0lvCXvVnM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skogtun.org; spf=pass smtp.mailfrom=skogtun.org; dkim=pass (2048-bit key) header.d=skogtun.org header.i=@skogtun.org header.b=ummWYOLV; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skogtun.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skogtun.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=skogtun.org header.i=@skogtun.org header.b="ummWYOLV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=skogtun.org
	; s=ds202512; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=+QdTXK8UhU1rQZu4R15pAX4F6h2le7wt32qqzCdQ/qM=; b=u
	mmWYOLVfWNVhZq7HmJvAYp/N9eIOC1zte2Abv/L787CflpPqd5K5vlO8/xzp2OM8vrTzfVzu1QUq9
	9IWMU7S+bwrUiNgf7fgza4Y5cXZkRXE6+TSn0JM5FUjPPuooVx8J3L+gDoA13GLF+d+jbL2rrVyJP
	TolXZWGknu1o/IqnmDAK4Sps3tpS3nH4pY6XlICvauvDvTeUgd6GR18ZUZ+1+s5qvLPacCSMqNdQd
	gApebXseQ+BQhdOppPQNmSfz9GiaX6RzfwZRSkofrH423KZe40BSOmrEeMJUp711E+9oFAssrbQ+2
	jfxv5zNU3LQpfcjZZGGSCB1IgjjwPOJkg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1vwS5g-00AgL7-Cj;
	Sat, 28 Feb 2026 22:43:12 +0100
Message-ID: <6926f8c2-d3e3-45e9-961a-9c648e070016@skogtun.org>
Date: Sat, 28 Feb 2026 22:43:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED]: Black screen on 7.0-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Takashi Sakamoto <takaswie@kernel.org>
Cc: David Gow <david@davidgow.net>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Danilo Krummrich <dakr@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux1394-devel@lists.sourceforge.net
References: <18b0ead7-0a5d-4699-a09d-de5bc2208b68@skogtun.org>
 <CAHk-=whsxHKbtSpiqqQ1V8YDh_zu+CMB=Zt9MxUOmWGocueZNQ@mail.gmail.com>
 <245628b6-6cdb-446c-824d-442100c89da8@skogtun.org>
 <CAHk-=whxJBPZ=7jpAKgz+5hUjJZ129JJsyA6iEw70Wg58hD0zg@mail.gmail.com>
 <a200d310-e3df-48e4-8376-7bbbb483f2eb@skogtun.org>
 <CAHk-=wgUmxkjwsWzX1rTo=DTnaouwY-VT8BjrTqfH7RmTwO72w@mail.gmail.com>
 <67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net>
 <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
 <CAHk-=wiiwxzvS1t16YNLofoF6afMB3camXdWteswhdpu3TZVvQ@mail.gmail.com>
Content-Language: nb-NO
From: Harald Arnesen <linux@skogtun.org>
In-Reply-To: <CAHk-=wiiwxzvS1t16YNLofoF6afMB3camXdWteswhdpu3TZVvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Linus Torvalds [2026-02-28 19:09:38]:

>   On Fri, 27 Feb 2026 at 23:22, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> Not sure why Takashi did not reply here. Feels a bit like I'm missing
>> something.
> 
> I wonder if it's because we've been cc'ing the sakamocchi.jp address,
> and while that is what Takashi uses for sign-offs and his "From:"
> address, John used the kernel.org address and the linux1394-devel
> mailing list.
> 
> Maybe sakamocchi has some issue?
> 
> Anyway, I've taken that fix directly so that we'll have this fixed for rc2.
> 
>                      Linus
> 

Works as expected with this patch.
-- 
Hilsen Harald
