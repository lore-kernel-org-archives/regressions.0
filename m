Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A94183999
	for <regressions@lists.linux.dev>; Thu, 30 May 2024 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060782; cv=none; b=ioWtHARpkHiriM3F5chNWFPiW51E+rxphJw/eh28srC9AYA6yXl+QDKF4ouikPnVJcurh/d9geHif6wwyYQS/jJcOto2gQPcLGDEd7ECS+OQFTifHLW+10dt8SVgHZY7Tl8I6Pymnd58N3j0Fnn4EqcZpvSC9tqcGFW32EXGkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060782; c=relaxed/simple;
	bh=OBMiaOr5EQPQNnTiBTW+KT7tN0uywyPVg/TT1Mxetis=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=gFhXMYwWbe1MF76BoBiJrzb1o3GbkYRwJgavNe8FZBTQko2gYytHFDrH7/D7RRbyczJeaIvGvYvzeVG2g7uFJDBoAwpQCNLeFaZA4Z7n1ddcJoYY5il76Qf+xMYyAaGqTjOknFFlBYCVQTaAUMDl0gmvgzQLbJ3hQoBnMlPI4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Auoy0FiS; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Auoy0FiS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OBMiaOr5EQPQNnTiBTW+KT7tN0uywyPVg/TT1Mxetis=; t=1717060780;
	x=1717492780; b=Auoy0FiS1QuudB/ZzLdrOJsxa9JA7FIF/rMPW+F+ABAy3/PnmfyWVUVYMbnX0
	RMbUonzny7F4uSW/EaLX0BTgKSVP/uUl+rnlfn1PUwwCE3D29FinKAJ+3FWuVV3XtmodrldnedJmk
	0qrgO8ufrIW1f+a2WvvvBMBKePg+u9pr9mGBgwNho08Q8+XI+/g8Kx1oCIsIZYXBDel36yYEUt75m
	O9oYq+VANZmtfn7vIOUVjbiUPoApKvyuydgEV7x9RTVoJkqampR1QD6N6JmNTt+V+HwRGNB72Jcn6
	k6dyTowQxNYg8/+IK2kQ5AJbPRTWg7jmlBRBAeSOTE4vSmumYw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCbwg-0004Yf-MA; Thu, 30 May 2024 11:19:38 +0200
Message-ID: <66e2de37-99d7-411d-aa2b-8792a749895a@leemhuis.info>
Date: Thu, 30 May 2024 11:19:38 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717060780;b0343233;
X-HE-SMSGID: 1sCbwg-0004Yf-MA



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218896
#regzbot fix: 9e2f46cd87473

#regzbot report:
https://lore.kernel.org/linux-block/ce2bf6af-4382-4fe1-b392-cc6829f5ceb2@roeck-us.net/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=218905

#regzbot report:
https://lore.kernel.org/all/21ea292a-b1d1-43e2-92ab-9f1f63aaf729@samsung.com/
#regzbot dup:
https://lore.kernel.org/all/ecb8d3e8-d525-4a2d-a868-803202c16296@franken-peeters.be/
#regzbot summary: usb: chipidea: USB broken on DragonBoard410c,
msm8974-based devices, and sony yuga

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsOkiGxAfA9tPKjYX7wqjBZQxqK2PzTcW-RgLfgo8G74EQ@mail.gmail.com/
#regzbot summary: net: igc: kernel crash
#regzbot dup: https://lore.kernel.org/all/87o78rmkhu.fsf@intel.com/
#regzbot fix: Revert "igc: fix a log entry using uninitialized netdev"
#regzbot relate:
https://lore.kernel.org/all/20240529051307.3094901-1-sasha.neftin@intel.com/

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=218900
#regzbot dup:
https://lore.kernel.org/all/20240527192159.GEZlTdV7OoOuJrHmI0@fat_crate.local/
#regzbot fix: iommu/amd: Check EFR[EPHSup] bit before enabling PPR
#regzbot relate:
https://lore.kernel.org/all/20240530071118.10297-1-vasant.hegde@amd.com/



