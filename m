Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221CD6997B
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234842; cv=none; b=sF9U1Ju6pfTbdHsLmEqsDaEzHT57Vof+fu5E6zSp1xXnrADl8oxT3WCDInqx+2ENhftwbwJZkswo+tklBOjGxh7cCUaSSEJX/Osp7wbpuS+Uh/XMwBX3BgBcRNINdo8scaNsQRvO5E4yuazaIEZ0hIDVLiDYmM0MHbdHRRO2prg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234842; c=relaxed/simple;
	bh=u+FstKrY0V99gmJGzg12dbxHDW86r1KUQBZX4WFplYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bxs6whR6bTjkS283XuLgbqjQFqZCdXn29ximbuaOSLB4pAHqZ3NwxMrQf5j6JwrNKy90UmbOcc0zgAuI7LjKDNUNX95nG5u3u/rCUxYfHqbd4f1T+dtyFLO0pO2N+4QYPaZmgJfQKqnNKZgmtcC6bt5pAjZY9EsdKbAhXmX9WJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=HhOY7fxN; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="HhOY7fxN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ESYXRmTvKh61dh2lBo+YvFMsVmkvxuakqClUcrKvHEk=; t=1710234840;
	x=1710666840; b=HhOY7fxN09v9zPbz7r4zFFDCIms9WWchxT9T/+KfpD6XGL9Q+fvgg37+2NgtD
	j+TFk0DRMiIeleBXYPNqJuv+qRVpZSkw23KhbGB0zhTUgBJiJKvaORvXdTluIA3FG67/5EqUNSj+W
	SpZMhfrWDexRtM72cDXNnKnRuHTX9q0eyQ2dGasDLjanEKvQxHVqYrVM68M4nPYwbilRcP69PUFo+
	Ov29JXNdgy7bJFC2D9tADH3Ro39nyL2e93SLghw4czn/cY2v8guWm6Pb4owMpWgPhpGePrfXFkhxm
	4Katvak6Q9PWmR3chNrki+Ikii1Mdz8Ki5LN30tzT1C2AQrNpA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rjyCr-0004aO-9o; Tue, 12 Mar 2024 10:13:57 +0100
Message-ID: <6f0511e7-aeb9-46a3-b168-fbdef463a928@leemhuis.info>
Date: Tue, 12 Mar 2024 10:13:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
To: regressions@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
 <ecb11a0f-83a9-422b-9b24-8fd574656fe7@roeck-us.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <ecb11a0f-83a9-422b-9b24-8fd574656fe7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1710234840;acf47904;
X-HE-SMSGID: 1rjyCr-0004aO-9o

On 11.03.24 20:47, Guenter Roeck wrote:
> On Sun, Dec 10, 2023 at 12:05:18PM +0100, Borislav Petkov wrote:
>> On Sat, Dec 09, 2023 at 09:31:48PM -0600, Chris Lindee wrote:
>>> My Dell-EMC PowerEdge T340 server worked with v6.4.15, but it will not
>>> start with v6.5.x - it won't even display dmesg events during boot.  I
>>> reproduced the issue on v6.7-rc4 and bisected the first problematic commit
>>> to:
>>>
>>> 0c7ffa32dbd6 x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup()
>>> and enable it
>>
>> I presume booting with "cpuhp.parallel=0" on the kernel cmdline fixes
>> it?
>>
> #regzbot fix: 69a7386c1ec2

Many thx, I had missed that. Sadly regzbot was unable to handle this, as
there was no blank line before the regzbot command. I wonder if I should
drop that requirement...

#regzbot fix: 69a7386c1ec2

Ciao, Thorsten
