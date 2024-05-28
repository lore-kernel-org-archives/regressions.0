Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC813CFAF
	for <regressions@lists.linux.dev>; Tue, 28 May 2024 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716887594; cv=none; b=tXMa8sWf9y79X2A5YIUFxhsNQDeuEYx7B1RagmqyB1MQWv9LiCaAWwRinpOPHQb4/CoIaM11mV4iEz3klX/b6s306p7z1x/cOn1v/s3x5VPIv+sJF0uxBqHuP3hlWS0RcOTMb5Z1b6d84KToGOYuD2h3XMmL9Mg3h9oeHLaciY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716887594; c=relaxed/simple;
	bh=/U9wXayJxHlUad1DeJRA+jYPwPiiSDvvtHJtPwLyqvc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ur7qP9znr2v3cfgd0T9iYrnly7fDSwvJgX6hgtRpwD51K1NpxgysQgs6AkMN2INA2jAzvne5z64JmZlOo5/SIIn0OI0pFzSswOZFIDvoJ7b/JaHpRAbgJN4IdjZCu9HZ7xjVLcp9cuNEK14DLult92GnqWX+jYE9zobi3sKtOSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JNjx3UeE; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JNjx3UeE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=/U9wXayJxHlUad1DeJRA+jYPwPiiSDvvtHJtPwLyqvc=; t=1716887592;
	x=1717319592; b=JNjx3UeEWczZe0iLO2OgiQEXlI3OX9XBGgzwDPDXUXTe4IMxfnaqKvRI6OtA7
	qBrgwP/rGgJ6k8BWYvT7MU2R9Rgm79lryQxDECQzZczg/ts058pk8XBPUOVrKeNS8iWH1dwJe71N9
	bSMMjoqZm5tM1ihVrPVDxLU52WB+Fb0hXNkdu0dYiv/ngU5o62RhCjD7faU1dKHce8FDQCCn4EbVJ
	YcwZxeBpxf4/IT6yLtpBkGg9tcpLu1+fpCOpB5unaAXic2HAF/xeunaBFH/m6UWsb0ewtnXX9Kd+M
	BLCkaxYegZ1k0UALax9O7HJHC4G44P2ssFmjbNvSMNtIr+Lzhw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBstK-00068H-Jt; Tue, 28 May 2024 11:13:10 +0200
Message-ID: <e204840e-06ca-49a5-86f8-5b3b54301cd1@leemhuis.info>
Date: Tue, 28 May 2024 11:13:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716887592;c8e1bb58;
X-HE-SMSGID: 1sBstK-00068H-Jt



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/fd3f73dc-a86f-4bcf-9c60-43556a21eb42@googlemail.com/
#regzbot introduced: 22d63660c35eb751c63a709bf901a64c172659
#regzbot summary: x86: Bogus messages from topology detection

#regzbot report:
https://lore.kernel.org/all/c41c5bf8-9ed8-49c8-a9f4-431d523fffbf@tasossah.com/
#regzbot resolve: user apparently satisfied after adjustment in the BIOS
Setup

#regzbot report:
https://lore.kernel.org/all/CAE4VaREzY%2Ba2PvQJYJbfh8DwB4OP7kucZG-e28H22xyWob1w_A@mail.gmail.com/
#regzbot introduced: baa23a8d4360d9
#regzbot summary: tracefs: Panic During Shutdown/Reboot, likely due to a
older bug now exposed

#regzbot report:
https://lore.kernel.org/all/alp44tukzo6mvcwl4ke4ehhmojrqnv6xfcdeuliybxfjfvgd3e@gpjvwj33cc76/
#regzbot duplicate:
https://lore.kernel.org/all/z42qu35nuybho36bwjdoatqp3skwm7w2l4apd75ubzaezyvxef@f6yrdlgltlaf/

#regzbot report:
https://lore.kernel.org/linux-wireless/87wmo0k71i.fsf@kernel.org/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=218888

#regzbot report:
https://lore.kernel.org/all/14b89dfb-505c-49f7-aebb-01c54451db40@proxmox.com/
#regzbot introduced: 81ada09cc25e
#regzbot summary: blk-flush: crashes with NULL pointer dereferences in
blk_flush_complete_seq
