Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB63D546
	for <regressions@lists.linux.dev>; Sun, 26 May 2024 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716743916; cv=none; b=YMdn4d/bLab1F3xkfQDl5EO3RDEak3JMUaww9LPHXpGJEZXclJff/QNWOnXHO25WwSnT6EgmbxLvWpC42HpqhBeHUmbLsLT/SJcVy1EvlflkftzBpukyJxvo6IaxMZ/pjTw11PTSildPAIiarWuvrPAQRZ3eQcahFaSWQwNak6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716743916; c=relaxed/simple;
	bh=/n/mC4j9ZwyQYNn4TPCzVXwVGwo2DGt/oUu+7L9TNhk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=XSXUVMkFqC/SVQt4G8o8ZjvJVi9VIvO+atL1r14Wwmkv3lv7m8vOSXM3USyPAOSiB67zm7CwNFGsJYLl3Bgi5rEX1vHyKG4q0D9dtARwT7RQK0YD42UK7/PIZ3uLxExexPr2F9MkjxFKzAuqW8qZsk8prnuMFBWQmfHpzWDHtNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=FHIRzBf/; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="FHIRzBf/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=/n/mC4j9ZwyQYNn4TPCzVXwVGwo2DGt/oUu+7L9TNhk=; t=1716743914;
	x=1717175914; b=FHIRzBf/jvbNcR8cUY1fQJVRGQoeiIq8MXBY8qk+OBJCskwmnZ5oWWTUu3JdY
	nv9xdPO/T2gZmeCukA8i0z8C3WyeOrVtGQNKzfV4Cluvp3YuVJ7NjEw6WNJxR+PbOdsDo4sGhp25j
	Og3F1scBvE769jzVC3h0JGpsmqe5rkdRJdWPvURAWEJWb4LrzfgLFUjI1129rTapuHuucGtnoFtiU
	RbgJThmQHLtse35wnpX1vnNXSRvhHLTxQooG9g68bAuXqKBvwlsRo3xWiwog2RFUURqiTEJeNPTWQ
	XgQgw9Hb5NPJL7HSBRRDR6KXaKH6AxWgOmcqEozB/IpRXqIirg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBHVu-0008Dy-VB; Sun, 26 May 2024 19:18:31 +0200
Message-ID: <b163c274-ae6d-4825-b043-fc746725ac71@leemhuis.info>
Date: Sun, 26 May 2024 19:18:30 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716743914;bc0ef0c3;
X-HE-SMSGID: 1sBHVu-0008Dy-VB



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://github.com/void-linux/void-packages/issues/50417
#regzbot introduced: cd94d1b182d2
#regzbot summary: drm/amd: shutdown problems (again) on some SMU
v13.0.4/11 platforms
#regzbot fix: drm/amd: Fix shutdown (again) on some SMU v13.0.4/11 platforms
#regzbot monitor:
https://lore.kernel.org/all/20240526125908.2742-1-mario.limonciello@amd.com/

#regzbot report:
https://lore.kernel.org/all/CACLx9VdpUanftfPo2jVAqXdcWe8Y43MsDeZmMPooTzVaVJAh2w@mail.gmail.com/
#regzbot introduced: 4f53138fff
#regzbot summary: scsi: sd: USB flash drive unusable due to constant resets

#regzbot report:
https://lore.kernel.org/all/CABXGCsNptxsQO%3D5%3Dqi-JYiFX%3DrX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com/
#regzbot introduced: bc87d666c05a13e6d4ae1ddce41fc43d2567b9a2
#regzbot summary:drm/amd: green flashing bar on top of screen
