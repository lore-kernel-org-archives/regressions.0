Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4C7F
	for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720968585; cv=pass; b=URF2EgdbBkFScrk0WYE6350JB8gnQnIx9Oh/IrlT8tmUKrm3KrLJkce3hxvuBl2BjlEvjwhRURhk5YR8U3Mf7VseUXITw+ZvOVzPm0blD9p/MAKIcF8Vrd6f+uaj6iAQhSZE+BRqcT/+oS0D3C82UGY65/52h5Wfdp/UoYy0tEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720968585; c=relaxed/simple;
	bh=Y0ztaWB4OzAmGhQOBiUbzEAiBu6xITn3W2JYbeT4ZuA=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=pFbtZ7eEIOJrCEoMrHnEoCTXnT+KXzIhvnw72b8t4NWwRhRCy8QO6DEbogkF/QigYV7EVHow20riKG99/JqjD7CWglikj1MD57m70yo1YrKtKf7y7w0gd5+jCirVTGfIY58gP81UzHIHYley2Q18bilaD8D4Uzxlwr44CLytEFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com; spf=pass smtp.mailfrom=simplelogin.com; dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b=mGdddm82; arc=pass smtp.client-ip=176.119.200.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b="mGdddm82"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1720968056;
	cv=none; b=uIOLPcGIMeR3DwT1tX8HjyUTReB+/QyIZflbf7un1ugQshjoeLIEePKSwnB95VE0E91AOQ0boag8U4Hi/QYlQeyaYoPhht4AdnfbYDzRMNvDPPuZTb65g34FBCZ/Vy7RX0rdnEiHyoStALObRO9W8zOP/oTRD5GO6MBuYZX3f2w/bIwy7d56AEw0vlRCFNcb3rcdJQ8WiRVm+GVx3uhfO6qMfLys0KwzDpvqQZnORbr7sjHaSX/QjvchbJ8qFcEulxKAmBuyKfrAa5ZJ+lvJaUGjJRlHOOIcLlJtTksWNeIJotCDX+VDNlnutJsrPIZOIWRKeU7V1wzIAlng/59cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1720968056; c=relaxed/simple;
	bh=Y0ztaWB4OzAmGhQOBiUbzEAiBu6xITn3W2JYbeT4ZuA=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=W7Xe3d1Sbs7G34ev2zpCu8jKjV0xG5gSgFasf9a3sLZkun4k1vnuTdTSNWS8HHvogE7pzWPIWVO2mcI2r0vq4XMXOBrssdG/HDDh1KT1EckXSfQ8LYzoD1U9iQpvATfNvz4EfzvSehgMyGs5hbn2BBaNr6iL0HSPJg2me7D1jntPTKHT8k0ZzRdJf1rwJUzjE8x16mAOaftaOPDdSC3qG9BngL9j8N0uKOU7JEUywXx0OQN4jKNeuKk8sCqcT6Cd/tDAUC+5lpt+hrcALZaTd8r5EG7mrFnalNlmX9F6E8UXFsPH0zrAW8D/TwvjQlBh1/sHYs6NxGzqaSZvqYDTvw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
	s=dkim; t=1720968055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0F5CgJQpZiqLI39KgMfAPBRVZgL2dLXXBSyWpkwcdU=;
	b=mGdddm82bTzkfRNpQPJ78/JlOfsoFlYMVJm3WlRlzkXrwcWZLYa4r8khlG9JjqjRI1a2v2
	z7fFldEz1OtcOXEauwNzXkbKfi0Pz/oqo9H+molPb0pYrfjoXv+QtBeFBsfDegwTe4BbYi
	MEiN3uiNnCWVtGgWBx7eApZ6gfSRjDM=
Date: Sun, 14 Jul 2024 14:40:46 +0000
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
In-Reply-To: <32bd7226-5d26-46fd-a3bb-5b14344bc0b5@pm.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: mavrix#kernel@simplelogin.com
To: Ard Biesheuvel <ardb@kernel.org>,Radek Podgorny <radek@podgorny.cz>
Cc: regressions@lists.linux.dev,regressions@leemhuis.info,christian@heusel.eu
Message-ID: <172096805546.8.15772688283210394474.379370367@simplelogin.com>
References: <172096653882.8.16813493378478071178.379356753@simplelogin.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 379370371
X-SimpleLogin-Want-Signing: yes

Hi

My system appears to be affected by a regression originating with commit=20
8117961d98fb2d335ab6de2cad7afb8b6171f5fe as well, with the main=20
difference being that the current fix does not resolve the issue for me.=20
What I don't know is whether it's a different regression resulting from=20
the same commit or if the core issue is the same and the patch only=20
fixes it is some cases. I decided that replying here would be the most=20
efficient way to bring this to attention, but if I should start a new=20
report altogether, please let me know.

Here's the story so far: After updating from 6.6.9-arch1-1 to the next=20
regular kernel version, I had an unbootable system where I could still=20
select the systemd-boot loader entry but then the computer became=20
unresponsive with a black screen, where not even sysrq worked anymore.=20
For a while the Arch LTS kernels still worked as a fallback after that,=20
but eventually they resulted in the same behaviour. I recently posted on=20
the Arch forum about the problem -=20
https://bbs.archlinux.org/viewtopic.php?id=3D297453 - where Christian=20
Heusel, who I CC'd in this reply as well - helped me bisect the first=20
bad Arch LTS kernel, i.e. 6.6.18. This lead to the aforementioned=20
commit. Mainline unfortunately does not fix it for me (as of=20
linux-mainline-6.10rc6-1). I also have other machines with a similar=20
setup as far as the operating system goes (but on different hardware)=20
that work fine.

I have an otherwise up to date Arch system that I've originally set up=20
well over 5 years ago on a Dell XPS 13 and that has been regularly=20
maintained and updated, mostly without issues. The information requested=20
so far in this thread in my case is as follows:

bootctl - https://drive.proton.me/urls/P1TKZPA98R#YHmvPFBCRy7v
dmidecode - https://drive.proton.me/urls/GXTZVVSTK0#43CCvNy1m6dh
dmesg - https://drive.proton.me/urls/6DSXK4R2D8#8TFGkw6yvFfx

I hope this all is of some help; if you need further information, please=20
let me know.

-t


On 3/29/24 3:36 PM, Ard Biesheuvel wrote:
> On Fri, 29 Mar 2024 at 12:43, Radek Podgorny<radek@podgorny.cz>  wrote:
>> hello,
>>
>> this patch (i named it 112) WORKS. no initramfs error, normal boot seque=
nce.
>>
> I'll take that as a tested-by, thanks
>
> I'll send this fix out to Linus today, so it should hit v6.9-rc2 and
> make its way back through the stable releases in the following weeks.
>


