Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF117BAB
	for <regressions@lists.linux.dev>; Mon, 20 May 2024 05:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716181673; cv=none; b=NHrbzughwgCHpwmRmej7nrNro4zzxhkNNQKwNRV7gTRYkeq1qQKeeFGSwqvl7QBSVv9WnwA4VaQyGR0z1BVa6y6go2Kk/VChxD5MF1WJXT3U5gWv2npKnNK2yHynHFciPnokcq29wll1lVrZHZMLa0PzTDgCFPoZPyFCMdUDiHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716181673; c=relaxed/simple;
	bh=j0XueXmxauLezf7m4HS03F6rOeOxCBJG2KcZB4Xs9kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bRmzHpU38R3FGwLchh1nB2x5P6lRx3HVP1FEmjq2jKnHUoR3/wNhCEa3BYG6owEvjEUeKi6ZKD0D2szLSPMVwUt+HE2Ua8dCoEiGx5+y05oOgpwbjWgytPakz8NCmDvYxqyPKL952qq1K9tVUonpFALQ7MhF/LRtzPFydYO0hV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=f5ueFXAV; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="f5ueFXAV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=mKDYgM6Og7+LKWhILXj8PKp9+IRymxcbOI5RpD0IpT0=; t=1716181671;
	x=1716613671; b=f5ueFXAVT2Dq3gEHO9KzWvL9LOmG/MKG7m5UbEgxI/WnHXjNDxzeKBFPOkVSi
	b5YBSX8b1ItAJdwMNru2xlfFcSnwRPXFBOhqd99IBGDTtN28h6oVzTyCAIlqt0WmgR4onRIBY2ofi
	ESYiTGW2tb6LBKuZMMcBQ9rn35Kbhanwq1VJnO8LdIY6PeM4RUL1LwemuKa8XoqrtNKOC4hNusOH2
	J0oh2+/IgtiCRHbhiBg40CtjhbmhV9LbBR4dYCMdavvRXzT/nzRsj01qgeuufygkKKV7SEx7kvfcU
	vlBW6NN0PIcyJoFG3BHNScJU6nmv5IcoP1MlzjVuJT4ZkTHn8A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s8vFU-0001N6-VJ; Mon, 20 May 2024 07:07:49 +0200
Message-ID: <321c4216-bd43-47cc-b1e5-b4f7230f241c@leemhuis.info>
Date: Mon, 20 May 2024 07:07:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Arch: release 6.9.1 broke GPU rendering on Hyprland
To: Alex Murkoff <413x1nkp@gmail.com>, regressions@lists.linux.dev
References: <eb52e700-0cff-4cf7-b74b-46457bec03d4@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <eb52e700-0cff-4cf7-b74b-46457bec03d4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716181671;9ddacc45;
X-HE-SMSGID: 1s8vFU-0001N6-VJ

On 20.05.24 06:24, Alex Murkoff wrote:
> Updating kernel to release 6.9.1 breaks GPU rendering with NVidia on
> Hyprland.
> 
> All the relevant info can be found on this GitHub issue:
> https://github.com/hyprwm/Hyprland/issues/6134

FWIW, this sort of "look for details over there" approach often does not
work out, as many people will not care enough to do so. But no worries,
I did.

> NOTE: It's specifically the kernel that is to blame.

You are using Nvidias drivers, so it might be an issue with them. If you
want to report a kernel issue, you have to do so using a vanilla kernel.
For the reasons why, see:

https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/

Ciao, Thorsten
