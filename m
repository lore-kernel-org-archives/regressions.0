Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757481D4156
	for <regressions@lists.linux.dev>; Mon,  7 Oct 2024 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308014; cv=none; b=Mtma2xPcN4DC3eJ0jlKJbFqfvt38lHphAfWcE8w5ZROoC38XGXK3ZQZnx9mWupB4DQV02GkQ338OlJN2aohggyGEuSK6Qxy5GjNn2jZbHc6k4m/ifP/okbb5M+svS+aCxjeJMWLAK3oQ6zAC06OotMBiD0EcuvVs5aSczQoPIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308014; c=relaxed/simple;
	bh=dtg1zHdBAzaiFfoZmrey2jOmdIoE8VPZWX7RHsJxwEc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=gejuB618436dw3rMptJQ0fEOY0Ve6mIQjRQxtYJPmG/khknTasDDyF5yabm+hW5CdpV4RXZHmGkvKyMYILIoSemibPA55tb33Zzu9m9D+1ze7zDvDHLL/+jPI8zEKyEknEMjuEBY5vHnOJaBEu4VxjYsSUwnVE5ebHh6BB1BmlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=zVhFGWL+; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="zVhFGWL+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=dtg1zHdBAzaiFfoZmrey2jOmdIoE8VPZWX7RHsJxwEc=; t=1728308012;
	x=1728740012; b=zVhFGWL+o4qFr4a5HlxQdprelxdtxrXpPgVvjH0XNdr7imqCHEw9W0comIEXO
	Dpyy5BdwXd/Krf+EMEOYVEwShG3tS8yU5wGAl5oVIzQW+NY0i5y0IJRO+LOXllXERq0/qHihHgfdK
	NM7llaAqVarYT8u0Jo0WTnKtdTjS31an2xV+cLOgxcGnudTnNS7JpryFpA/JE83ZWsn/CV0FyGueR
	1GPUkXw+Svmy7esp4eRNudw2jQmsD/MjWkkTFSJYU4QXOuF2Gi5bEgVP5f9dRNWZTABrJIl/V+1Zo
	aqYhOPg4n0uMDtdE9A9/pdqcOMhd2PsujyNllkPB7AjTokjK7Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sxnre-0007Xr-JU; Mon, 07 Oct 2024 15:33:30 +0200
Message-ID: <a24cf83c-5bf7-4b95-a503-803bb07411de@leemhuis.info>
Date: Mon, 7 Oct 2024 15:33:30 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728308012;2d73d607;
X-HE-SMSGID: 1sxnre-0007Xr-JU



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219285
#regzbot resolve: inconclusive: bug in test code; might need revisiting
in case practical problems emerge

#regzbot report: https://lore.kernel.org/lkml/202409281331.1F04259@keescook/
#regzbot from: Jan Hendrik Farr <kernel@jfarr.cc>

#regzbot report: https://lore.kernel.org/lkml/ZvV6X5FPBBW7CO1f@archlinux/
#regzbot introduced: 86e92eeeb23741a072fe7532db663250ff2e726a
#regzbot summary: bcachefs: mounting rootfs broke
#regzbot dup: https://lore.kernel.org/lkml/202409281331.1F04259@keescook/

#regzbot report:
https://lore.kernel.org/lkml/2a15105f-67e2-42f6-b624-562485b0bee2@kernel.org/
#regzbot monitor:
https://lore.kernel.org/lkml/20240904-msm8939-rpm-apcs-fix-v1-1-b608e7e48fe1@linaro.org/
