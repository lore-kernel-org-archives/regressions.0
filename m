Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741811A2C36
	for <regressions@lists.linux.dev>; Tue, 18 Jun 2024 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714446; cv=none; b=odcs7D1xfhRy2ny8PuLD5+lRS/fI/86UFsJIlGWpsE1nUuuFwK4K3wBmQmpdmC4l/zU9URn8y4S1I0w0nSfdum7s+HFoNjJzukPxVdTgaJ3ON49/gmdbG4v3tZmnFk5+P0nyHwbxYQ0TqC8QRwTwI6GTWBhSNiekuexnh2iIsgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714446; c=relaxed/simple;
	bh=bSJ2jaEfqtK6rpQXQu7mnH3+2YKmJiFFCHG2T8O/+60=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=JIccXBA82NnLhCqWQTOTD8u5qfLnYj7WVj1IbID0S8NnM/NqT9L4TEtOn/5y1uTkMQurbAPo7pwShzDoL8n/U5ITlW7zQmrWtdVA+VvBJIlb8+6CAAfTHkJXXLS7u8VJZoh1EOJ1/bpe4M5AMCfaXI+q4M8DxHXIaspKgUIdtf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CkzX03Mv; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CkzX03Mv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=bSJ2jaEfqtK6rpQXQu7mnH3+2YKmJiFFCHG2T8O/+60=; t=1718714444;
	x=1719146444; b=CkzX03MvyCkl9+7DiTv0EgW8cDUIkgIU4WtCrHOOeVndNYr+wRsjq8it4y/7z
	8WVE+B5e5tN5WQ4qRAYVR0gvT4yJ0uV5r9/ZX2VSibLR22QW72Yo3SAkx9/BhDJmpmYGhIn4+7h14
	QAfAln/D5Pp4R/laRcGQ6m7H+xIEUtcrYR/ltwR5nw+u1eE8HCXWe5yswuYRJPJkPyOmCc1jCmPu2
	EGBwVPQqz8X4BOF1c1m1GzhKh4zOKOIuCU1EkWNv3Udt6OQwd8Ia180zZmK+1F6Uu4uPjsI4RJ3sE
	WB962eHt0tHDvFS9Cm2c48ZQ+ZjcSMxCJpyUCy1hoF8exa7MrA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sJY8g-00072T-6R; Tue, 18 Jun 2024 14:40:42 +0200
Message-ID: <8aefa78e-10ec-4d6d-a9cd-ca0192fed5d3@leemhuis.info>
Date: Tue, 18 Jun 2024 14:40:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718714444;56c6f07d;
X-HE-SMSGID: 1sJY8g-00072T-6R



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/77b71bd9-42be-40e8-8b96-196e214c8afb@schmorgal.com/
#regzbot fix: Revert "serial: core: only stop transmit when HW fifo is
empty"
#regzbot monitor:
https://lore.kernel.org/all/20240606195632.173255-1-doug@schmorgal.com/

#regzbot report:
https://lore.kernel.org/all/20240614155437.2063380-1-popcornmix@gmail.com/
#regzbot introduced: 865e7a7700d9
#regzbot summary: fs/ntfs3: memory corruption when page_size changes
(like from Windows -> RasPi5)
#regzbot link: https://github.com/raspberrypi/linux/issues/6036
