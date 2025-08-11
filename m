Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7182822578A
	for <regressions@lists.linux.dev>; Mon, 11 Aug 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921177; cv=none; b=uexegzozEPHdEs2QBh9tUwGqzkpwv3zSHzpMDnsGUAqBQpEWiKjSC4u/NqYFdxus39Z+37g6LvgAkuGIpmgueZjHhPYzS7u0V9F1z+rH2Igw9iFEA6M19ol7USJwIsFaoCtGXzW1uQoqEGVCFuvj/Kdjrn+KrxF92DcsChj/Ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921177; c=relaxed/simple;
	bh=oFtYo3U0qdWvDHjlfJam5B1mnTb+9DwyaUOSt65uqOA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qCVtw8wGN9Kd+Nx3UjyvtnHEYBZaC2y1WQ52S7S67tshV+XxAzLHGnCW2wFQtArwr7iKfCLH3SsovqbwVMAOJ5yNNknvf3CtbZNDrZF6kCTC3eaxfp9pUtW8lexiIgyor2BfZTYfxlkBe0pTIb/WrlKdnW+A4miU+pzipHVS17I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=yykTOcDu; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="yykTOcDu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=oFtYo3U0qdWvDHjlfJam5B1mnTb+9DwyaUOSt65uqOA=; t=1754921175;
	x=1755353175; b=yykTOcDuNFmw9xWW5IukNOxjq2uvZnIyHcW+A1cudXV4FB6HvdNRynyYmQKEc
	ktVhGFWzVpJBnzDvOyGxsDFsjR5ygp1Bs36Kp43DSi30vXqpmKh39NYD1zRjlCyYlSY9HrQQpLNza
	wwKXJqTpMX8vBqvnjt8+u6MQ2wb4y6mIoXv/Cql5GZdx8RkemttaZYvRWf8dWcSN027DAyALfuAZ9
	i6hevya07MpQ4PwhzV4Ae/7xazgK6958qu8XOvo+/cC0gzUQY6hxXcmRZmnAfWNX4ZLOw8oleTeU3
	hAcaVAA1uMlvl4n+7PgymuF1nv03fiOK/92v9NNixLG8E+QEUw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1ulTA8-00GsmX-1k;
	Mon, 11 Aug 2025 16:06:08 +0200
Message-ID: <63f97b70-bdb5-4f36-936a-2094b3e4d959@leemhuis.info>
Date: Mon, 11 Aug 2025 16:06:06 +0200
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1754921175;5e7dc111;
X-HE-SMSGID: 1ulTA8-00GsmX-1k



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20250807160301.GA50800@bhelgaas/
#regzbot fix d5c647b08ee02c

#regzbot report:
https://lore.kernel.org/all/f2b70e6e-bff6-42f3-82a2-81eed892cc30@linux.dev/
#regzbot introduced: b8adc31cc0ca
#regzbot summary: drm: amdgpu: freeze while shutting down Steam inside
of gamescoperestore,process.").
#regzbot fix: drm/amdgpu: Fix race condition in amdgpu_vm_wait_idle
during process kill

#regzbot report:
https://lore.kernel.org/stable/718C209F-22BD-4AF3-9B6F-E87E98B5239E@plan9.rocks/
#regzbot introduced: fb5873b779dd585
#regzbot fix ff7ccaadb0bf6b79a87


