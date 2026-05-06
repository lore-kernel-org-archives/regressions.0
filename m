Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209F318EFF
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778105185; cv=pass; b=KfNTXduV4zDOjrWWEMV9Nah24oONahRKaragRulBv+mzHks/ETqPneVKHSJcJWAs9OdFjwKXec7vjiqXO6q6xbfvZmKQlwWx6dOr7y9pqfofz/fylVucPvlAJkmbB/MVw+9SZmBbR9FiFYyBvNkbpy9+Fl3JtYfWq5UTZfMmYA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778105185; c=relaxed/simple;
	bh=kG//RpSgCek4dzLQJZPfcKev3QYiO0nVTNRvPy17R18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVeVNNYPE/kk1Xmpe3KGQtxT/2sS0yKq3cMI1UIpDbjdO8TfqNPoe14UybTwXMlWjB7gtELzTvVIhbfXwQBdAf+6GMjTjJX9eL2FWVZxJhrDaP7vgcxxWgRop0WNWzte+l9h4luruntreuFD/Ig5xE8lTL3BZSWCeFIR6MaXTeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=Q46fBCUI; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="Q46fBCUI"
ARC-Seal: i=1; a=rsa-sha256; t=1778105177; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HnjxqvwGqH+drOKo4+pSQx64YnY9MV9M/8lX6Za6ruhV3YS0jj3rSCyb4XhInvMOkiLkQBvJWp7kUNTLzFjUKXuX6hzyXXtFb1xAZOP+NQR8L++E6TRFkbE1MxXH7idGnW45sKWljbPpF6xPMzBhZG9MfE0OGNg1sH4E3xY+H5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778105177; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CUs4AuipDPWTJ+PC7ClkOBoflf7NncdDKt+wqffbGcM=; 
	b=BY3R2Ov9S5RV1aavdxAw0ZvKHuQnH8ZXeo1S5S+Obx3QdfHzv+y7/Lc9wqCw7w1l9UQjOAPlM5H2sKHjOFOjynmKGWEm8L7c6wVSyYHAFNyGsEHr+XdFa1KhWoqInf0gC8k37ho08FXXDhs3RoI9YBUkrI/iY5m2cM3ZK/CCUW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778105177;
	s=zmail; d=harin.net; i=me@harin.net;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CUs4AuipDPWTJ+PC7ClkOBoflf7NncdDKt+wqffbGcM=;
	b=Q46fBCUIMCglMIdB18Z353PMOzNAd9XX9+XxSu2Cw8pU1elbbeLQqjLRDgAWObKd
	WdIP3/dbOP+uaP7EcGI7udMJkQGbD12niQtvJEZ9+ML+cgqPnsRckkQdE5rMQZY+ReP
	EPDsI8Ad1uynGDlssJcbt5FVoXQPg1kCIPKB3NCV+XBCKZdlSjEmPpkqwHVyvrWpC2Z
	fhuQ/A9c3KkXchac/zgz46xyit3MEicSEGCmnjWyh9abbsFzw6wYI9DU3S8Slj8hPY1
	nFAVyupHqGyio2JS/UfpfXWuvd9SGkhjKXDLOoZJAycvDVZsTKKINHHgcmeRijMtr54
	BUvZpU7jQQ==
Received: by mx.zohomail.com with SMTPS id 1778105175752998.7270007329777;
	Wed, 6 May 2026 15:06:15 -0700 (PDT)
Message-ID: <7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
Date: Thu, 7 May 2026 07:06:11 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] ctxfi: no speaker output when headphones connected
 on >=7.0.x
To: Takashi Iwai <tiwai@suse.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stoa@gmx.us
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
 <87bjett3ud.wl-tiwai@suse.de>
Content-Language: en-US
From: Harin Lee <me@harin.net>
Autocrypt: addr=me@harin.net; keydata=
 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
In-Reply-To: <87bjett3ud.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/6/26 4:05 PM, Takashi Iwai wrote:
> On Wed, 06 May 2026 08:24:36 +0200,
> Thorsten Leemhuis wrote:
>>
>> Hi! Just FYI, I noticed a regression report in bugzilla:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=221461
>>
>> To quote:
>>
>>> Dutch Ingraham 2026-05-03 18:12:49 UTC
>>>
>>> Kernels >=7.0.1 contain a regression as to Creative Sound Blaster Z SE
>>> discrete pci sound card, but not integrated. Kernels 7.0.1, 7.0.2, and
>>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or 6.12.x does
>>> not present the issue.
>>>
>>> Specifically, using pipewire managed by pavucontrol, on both Gentoo and
>>> Arch Linux, when both external speakers and headphones are connected,
>>> all sound is routed through the headphones regardless of whether settings
>>> are set to Line Out/Speaker or Line Out/Headphones; there is no speaker
>>> output. If headphones are disconnected, without reboot, speakers work;
>>> reconnect headphones, without reboot, sound reverts to headphones.
>>>
>>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig on 6.18.24
>>> 		.config; Arch standard release
>>> 'lspci -nnk | grep -i audio' attached
>>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
>>> pipewire-1.6.4 on both Gentoo and Arch Linux
>>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
>>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and Arch Linux
>>>
>>> Processor		:	AMD Ryzen7 5700G
>>> Motherboard		:	Asus Prime X570-Pro
>>> RAM				:	Patriot Viper Steel DDR-4 @3200mHz
>>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
>>> Sound Card      :   Creative Sound Blaster Z SE
>>>
>>>
>>> Expected outcome: ability to choose output to either speakers or head-
>>> phones while both are plugged-in to sound card.
>>>
>>> Workaround: none known.
>>
>> See the ticket for more details. One of them: 7.1-rc2 is affected as
>> well. Reporter is CCed. Forwarded this to ensure this report makes it to
>> the interested parties, as bugzilla might not have forwarded this.
>>
>> Dutch Ingraham: if nobody within a few days has an idea why this
>> happens, you will likely have to use a git bisection to get this resolved.
> 
> As there have been many significant changes in ctxfi since 6.18, it's
> hard to tell what broke.  Please go git bisect.
> 
> 
> thanks,
> 
> Takashi
> 

Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132 driver,
not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
entries.

Thanks,
Harin Lee
