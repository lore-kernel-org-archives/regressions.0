Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC181B85F2
	for <regressions@lists.linux.dev>; Sat,  7 Sep 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709122; cv=none; b=S9G6HCgs91VfRTe7HPVDspgyAGBjTfLjzJ8TyoxhaPGXuzhyt0/EupzhP6+Uo20FktIoYtijkxKUJlkZoetGqsFKbJRESL7KX6VExjF+Wx2BwQukGQZB2effGZghdDMV72kiW2dGHUpqKTtf7H9e1BYoOaVGuuVNOpH2xodhV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709122; c=relaxed/simple;
	bh=y/ydNRErBrKRmtLye3z4fIXtV1+jB7JRwY/FujELnMg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Iqi2dSjD7Vuxc226WVInZRS6fgM5a/wmsAIXJInXXQyRWlS/IiFElARmWKrul1rlnuN7mXEaaH7+gGXeGeX630Y82t/TwOI/+9CPOfoigY2vP5+JO7CVMWmW/imlBJpDBIgZ9AuqE9qRtusAJ9us+ZszLGUCYcZ7wobngorl2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=pUhvvHH/; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="pUhvvHH/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=y/ydNRErBrKRmtLye3z4fIXtV1+jB7JRwY/FujELnMg=; t=1725709120;
	x=1726141120; b=pUhvvHH/Urp4M0fC6a7QDkuJoYppvkU/0OndukVgwmt2Sfv1y82Jvz1Uantqq
	UBc3R9I2tzWlO61EsWDWkyg6Ge7H3Ox23av5XwT3bO4Z7wJBdfYb6mcIGMd1xBC4EzYx72z6Dfg2q
	WLOb2viWlPW/XV1QIuUfVAQUcCL3c+NXiGbjeH0qmaNyMYvXpB4RGjXLJPL31xtB6pVEUnGlVM98J
	eSw7DVtEM6WfrU9iMvgb0yndhJhx6f3T1ejHUAS9tkRhz0RTH1fwia5va/+pF6vFgmZjhDHoZlDPE
	3cbZqv+7I18USGyNprsSyJMl5xM3Ok95Y0fKo0kG1Bl1O4MKjA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smtm2-0003GO-JO; Sat, 07 Sep 2024 13:38:38 +0200
Message-ID: <6635a059-1361-40e5-916a-e84b207132ae@leemhuis.info>
Date: Sat, 7 Sep 2024 13:38:38 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725709120;e2e91c73;
X-HE-SMSGID: 1smtm2-0003GO-JO



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/8a541683-36da-4cea-a8a9-db6ee875c86d@leemhuis.info/
#regzbot from: icaliberdev
#regzbot summary: usb: typec: ucsi: Keys do not or only later register
on the keyboard on the 2022 Asus Vivobook S15 OLED

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3345
#regzbot summary: drm/amd/display: crashes on resume when the dock is
unpluged while suspended

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219166
#regzbot unlink:
https://lore.kernel.org/linux-block/20240907014331.176152-1-ming.lei@redhat.com/
#regzbot monitor:
https://lore.kernel.org/linux-block/20240907014331.176152-1-ming.lei@redhat.com/
