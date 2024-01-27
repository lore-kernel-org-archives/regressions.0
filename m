Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3717744
	for <regressions@lists.linux.dev>; Sat, 27 Jan 2024 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706338602; cv=none; b=NFEuuJFTchhBmVaj43L6lztPVvhH/2HCw/deU1qpi8kX9nEBMO8fcHnm1Ed46Caep0Es4JnvHwCMdmdyYYrIkUcD+nL7TqXugTdufJoV0YkOf7nEl4m3w1WjSoZzqHnANwPeLe8v4pHCN5zg2W/xCets5wn7FQtfifIhG8fZaEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706338602; c=relaxed/simple;
	bh=B7F721/dCnZKcPovzAbO2UT29nhYYcZTLvztOBP6Fys=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lrtS2o3oara9EYhOnGlK4R+IH8JdCWEgHFT8J5iwf89NxIScTw73VznYWYynB8MNqVlBt0JiB+nR5rnEe5L1bbny5JrrqiAAEUlLWPhGp9nr8udUX7xXWfDjIcAY11mIpSYKKQR18HKVuv08c36PXMg1NT+6YZwAMyCk0L5lZLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rTccI-0007Y0-OV; Sat, 27 Jan 2024 07:56:38 +0100
Message-ID: <7bf72680-19e9-464d-ac10-fb62273379f4@leemhuis.info>
Date: Sat, 27 Jan 2024 07:56:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: include bit index in cell sysfs file name
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240122153442.7250-1-arnd@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20240122153442.7250-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706338600;e6cd81ca;
X-HE-SMSGID: 1rTccI-0007Y0-OV

On 22.01.24 16:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Creating sysfs files for all Cells caused a boot failure for linux-6.8-rc1 on
> Apple M1, which (in downstream dts files) has multiple nvmem cells that use the
> same byte address. This causes the device probe to fail with

#regzbot ^introduced 0331c611949fff
#regzbot title nvmem: boot failure for linux-6.8-rc1 on Apple M1
#regzbot fix: nvmem: include bit index in cell sysfs file name
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
