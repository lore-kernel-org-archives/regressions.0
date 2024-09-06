Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D841C8FAB
	for <regressions@lists.linux.dev>; Fri,  6 Sep 2024 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618610; cv=none; b=U0i/wcEDky3OrfO2xEYRl2/wu/kR7bLutSt4w/wbVtSYqytOr2+yzKkoTrUngjSTC7t3ONPQOlkEvr7ykXgKTq2POz+MRiCddwWRl9KghB4sHbYJp/+8nqXkHWJgah7M0Zj4fVi4lI76bAlRVnYM/mrCdIUGcrDaCBZHcJIsgYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618610; c=relaxed/simple;
	bh=h/QRYrmsB+5fzz2RK33yDGOuO+IUNQIx103HMiOQx3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfvIGahEDoDLYbz8mhJ7TkbLQUzy9nZe2M0vurDinGPNTuYq+PvQm9SpmY+1zHpVUbhptNmHxf7YVTlRXMi7sRJZ6HKWvIoDR37cAyO2bD6Vy6MR1A7TsZcf5+SrqN2+z1l14WjCEjc5YxIHHb3SfJAdpjdH1trf9F/1euN9fxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XRGNJTKO; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XRGNJTKO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=4zxx/jMsknAIv2RVTchdYDbtVepf8NTr2Pp5F/21wVY=;
	t=1725618608; x=1726050608; b=XRGNJTKOY2JCjxrml3PHHaY/56LG/3PTjnYMEHJTE73pf/8
	HJ8GmMyUZtAdtVSq4nl6jRziOBWwQKOgcdMPvAEt1k3e7LhHivSS5EUDO81mk9edcxj+Ap+8v49uz
	c/R9VcW2XwzlWTymMZqaglo/vSZI+xYdPyizp840di8RR/yfnFdw80kqiyTJzzHqmzCln3Gx+OkWp
	qXySPWB9eoVtrUya/psxuoCY5BYXJ74KeaGfKt3hAgbzYfJsn3UhgqX+JbCusY1rsvHcToLh7CPEU
	bjCqiFQSzbLl4aNz4Tu6AyBhYsvgN0Em7lgEHKVz2S7aIDKOZHABpv3lzuOE0Osg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smWE7-0006ib-OL; Fri, 06 Sep 2024 12:30:03 +0200
Message-ID: <8e3afa4a-aca2-4803-886d-e162eb5e0478@leemhuis.info>
Date: Fri, 6 Sep 2024 12:30:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] kernel NULL pointer dereference in xen-balloon with
 mem hotplug
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 regressions@lists.linux.dev
References: <ZrSecpuTN9zgtqYu@mail-itl>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Language: en-US, de-DE
In-Reply-To: <ZrSecpuTN9zgtqYu@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725618608;e174ce84;
X-HE-SMSGID: 1smWE7-0006ib-OL

On 08.08.24 12:31, Marek Marczykowski-Górecki wrote:
> 
> When testing Linux 6.11-rc2, I've got the crash like below. It's a PVH
> guest started with 400MB memory, and then extended via mem hotplug (I
> don't know to what exact size it was at this time, but up to 4GB), it
> was quite early in the domU boot process, I suspect it could be the
> first mem hotplug even happening there.
> Unfortunately I don't have reliable reproducer, it crashed only once
> over several test runs. I don't remember seeing such crash before, so it
> looks like a regression in 6.11. I'm not sure if that matters, but it's
> on ADL, very similar to the qubes-hw2 gitlab runner.

Marek, did this happen again or do things appear to be resolved? Asking
because I'm tracking this as a regression.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

