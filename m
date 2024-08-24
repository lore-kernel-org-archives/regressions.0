Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EC257D
	for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724487097; cv=none; b=F3z6hnk6S0eXLeEdEmamFJL8tT4yV6GnNZChzma9aA0PCI4IrYvDMagXBeb/RAqkgnqPoL5efrCoEo1dayMvY2gLQ5N2OOugHgG9wbXyepEONxSc19b7tG1uZga8D2SgYy5b8rFmFPGOaSko4prfvtF0j39iUKq+55qUJ2Q3LmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724487097; c=relaxed/simple;
	bh=lhS+cGfx/DYb9LBQhMCY9X5TfRKSI9OvUw0W/GvRdKQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Rwp0LOJ6nBg3Wi3joxNqovQKxUaLO+wdb6IoSlC0r2s6FV952VP2CcSrRZ0s3tAeDQSnss2RnePK/EmUgRRGTGPrd6IyuKfJJYEnYvbaaka3QbZzTeCDQ0khLdHzatIFHlsQHT7hKyfNZdDq3lieB5Hu6VmpFJ5EoYm5adl1cqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=sEP261qd; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="sEP261qd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=lhS+cGfx/DYb9LBQhMCY9X5TfRKSI9OvUw0W/GvRdKQ=; t=1724487095;
	x=1724919095; b=sEP261qdy+MI6fF6G25WtdSmzBF0s0oEN9fqdsrkzoR7dB3kwRQFnpoxsohC+
	VeD2wzBkl1bd50/7nTx6zLSSZuAkRGFfYqiArmvKULkGOKpArf2QtHgNjmc8uyFFSMEqs9gTprGHv
	OmS498e5llQjAsGimD9tidSReVXJY+asX+eWeJEZEf0fjEpYeB2SfHVG3W2J/xEcvbwhYgwy1sQJ9
	Jt8rT7LK9IWbTsvuUnsyRGE9+F9Ld/haPLxBIAPwxRdD7E9Oqldi+T6tEzzLTSTFjEURidGRWfzZu
	IlQIO6BphB73XrFFz6s+gSsJ7qAJSOVLiAHgECsvHSKgEAcSqw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1shlrr-0001Go-ME; Sat, 24 Aug 2024 10:11:28 +0200
Message-ID: <9557fbaa-1a3c-4e9c-a922-9048efd1666e@leemhuis.info>
Date: Sat, 24 Aug 2024 10:11:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724487095;5343919a;
X-HE-SMSGID: 1shlrr-0001Go-ME



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAHQZ30DXgctshMVfGRSyHudViapAs0ib=NPJnMR648dydO892g@mail.gmail.com/
#regzbot introduced: 37f32f526438
#regzbot summary: ovl: wrong lowerdir number check for parameter
Opt_lowerdir
#regzbot fix: ovl: fix wrong lowerdir number check for parameter
Opt_lowerdir
#regzbot dup:
https://lore.kernel.org/all/CAHQZ30DXgctshMVfGRSyHudViapAs0ib=NPJnMR648dydO892g@mail.gmail.com/


#regzbot report:
https://lore.kernel.org/all/CAH2r5mvXE9kKEFfEpsf3AA0s8oVA8737aLZ2LkOrz1hptujt2A@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/all/CAH2r5mssjjgO3hmNXhb12H1q%2BccTV4P%2BLzaL6kMwxpip6u6kjg@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/all/CAH2r5muJabg%3DdB9EkuZD26%2B2mnQGRYRbpbQ96UxTk2UF4ZNQ6g@mail.gmail.com/

#regzbot report:
https://lore.kernel.org/all/CAMHwNVv-B+Q6wa0FEXrAuzdchzcJRsPKDDRrNaYZJd6X-+iJzw@mail.gmail.com/
#regzbot introduced: 539aad7f14da
#regzbot summary: cifs: "VFS: parse_reparse_point: unhandled reparse
tag: 0x9000601a"
#regzbot fix: smb: client: ignore unhandled reparse tags
#regzbot monitor:
https://lore.kernel.org/all/20240821034503.739532-1-pc@manguebit.com/

#regzbot report:
https://lore.kernel.org/all/20240823074217.14653-1-hdegoede@redhat.com/
#regzbot introduced: 7d99a70b6595
#regzbot summary: ASoC: Intel: NULL pointer deref in BYT/CHT boards harder
#regzbot fix: ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT
boards harder

#regzbot report:
https://lore.kernel.org/all/CA+Qy7vRQnWx+0Au06hPbgASTRTxtNnbMxV=0jmJaZtsEBQ81zg@mail.gmail.com/
#regzbot introduced: v6.8..v6.9
#regzbot summary: alsa: Headset mic stopped working

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219075
#regzbot fix: 71bf41b8e913ec

#regzbot report:
https://lore.kernel.org/linux-scsi/Zr%2FXrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com/
#regzbot fix: cd06b713a688
