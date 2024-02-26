Received: from clark.ferree-clark.org (clark.ferree-clark.org [74.95.126.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B8323D
	for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.95.126.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708910270; cv=none; b=MGxJQnMBwUlTAkQUPTXNJ1tD7o+e7ZGUJ7XOf8nHjsvq6+XfdMO2kI/XVjoMR+pSp7Hezttmw1fVHQ++sBZ1/8z5UekJjTgaG85IexhAj56qhakWGa3+QPp7NeIrOfnJE3e0w6F/djUZapm6PpVOIgCJHSTsyEmE65NAQhmnYlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708910270; c=relaxed/simple;
	bh=w+AXV9OAkujB25C0bhWg5wLsivBry4XvK9NrS814CTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AUOt98VYtV3rb5DJK8qAIiqJ/Tnco25CsKjzAuLqxMgndIWrby5LRXY1OqN+Gqced1EcvqfWQu35TlAbunTsiUkfC8ttkgRBhsodEVZoVGovJhzIOJxVlVNfc4GezXYoC+9DYsvpcB9ro/AvNHf10tXsX28iiCAdlJnyfTVjlaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clark.bz; spf=pass smtp.mailfrom=clark.bz; dkim=pass (2048-bit key) header.d=clark.bz header.i=@clark.bz header.b=mSqKkx/3; arc=none smtp.client-ip=74.95.126.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clark.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clark.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clark.bz header.i=@clark.bz header.b="mSqKkx/3"
Received: from clark.ferree-clark.org (localhost [IPv6:0:0:0:0:0:0:0:1])
	by clark.ferree-clark.org (8.17.2/8.17.1) with ESMTP id 41Q1HZZf1272523;
	Sun, 25 Feb 2024 17:17:35 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 clark.ferree-clark.org 41Q1HZZf1272523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clark.bz; s=c20;
	t=1708910255; r=y; bh=U1rLLx7g4CNvR8Gh8vQKO2CbPNcqgAhiJ6rP+C/u+gE=;
	h=Date:Subject:To:From:From;
	b=mSqKkx/3XhU/eGnOJcFh8+5HMnvbrLwXknGnR+ViFW4Hb3wArWjGFu01w4Mz6LKA1
	 LWTMGlzQgqS2HPes+o9UjUBNyoXTxWu0XetipfkEJNRp/8tyUk5ZRlC8yZ8tExqJZN
	 HlVYcgMKa1gSUyZDKjX7vczIYDejowWw+ibGX+MRrEXO96p4M053Z5GAnjFwe8lGvj
	 0e2bgMW+G1+w3BPRFvvs+89sCLh3a6F/vZ8tHalnKfbkcnho6XX/9qEFluex28UqpW
	 QXZeGthDhWzAVdD5gLPbARiOzbebytkXhBN7x+Bv72pArMD8aQn2yq5i3tI2XDBBfW
	 jjyVxWMFHcpcA==
Received: from [100.115.92.202] ([10.1.10.12])
	by clark.ferree-clark.org with ESMTPSA
	id 2w1pAK/m22XJahMACNZ+ew
	(envelope-from <kernel@clark.bz>); Sun, 25 Feb 2024 17:17:35 -0800
Message-ID: <3470e4c8-4bd4-497f-812a-0c2e290d4de8@clark.bz>
Date: Sun, 25 Feb 2024 17:17:33 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.7.1: md: raid5 hang and unresponsive system;
 successfully bisected
Content-Language: en-US
To: Song Liu <song@kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        dan@danm.net
References: <20240123005700.9302-1-dan@danm.net>
 <20240220230658.11069-1-dan@danm.net>
 <7efac6e0-32df-457e-9d21-4945c69328f8@leemhuis.info>
 <CAPhsuW5QYTjBvjAjf8SdcKmPGO20e5-p57n6af5FaXudSiOCmg@mail.gmail.com>
 <c21ee3c9-6cb8-45f7-ba46-880cee757cb3@clark.bz>
From: "Thomas B. Clark" <kernel@clark.bz>
In-Reply-To: <c21ee3c9-6cb8-45f7-ba46-880cee757cb3@clark.bz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.1.10.2

After finding a few additional responses to Dan Moulding's original 
post, I would like to add some more detail:

1.  This is a real issue, not a quirk. The first thing I did was rebuild 
my md RAID1 device by deleting it, wiping out the superblocks and 
starting over.  I had to boot into 6.6.14 to delete the md device; in 
6.7.5 the system hung while trying to stop it.  I then booted into 6.7.5 
to re-create it.  It made no difference even when the md device was 
created in 6.7.5.

2.  The original filesystem on which I experienced the issue was xfs.  
After one of the RAID1 rebuilds, I replaced the filesystem with ext4.  
It made no difference.  The md device causes the system to hang whether 
the filesystem is xfs or ext4.

3.  For what it's worth, my RAID1 device includes a hot spare. I did not 
experiment with creating the md device without a spare because there is 
a limit to the number of times I can find this server unresponsive. For 
now, and until this issue is resolved, I will be running 6.6.14.

Finally, I can't find that this issue is being tracked anywhere. I can't 
find it on bugzilla.kernel.org nor on bugzilla.redhat.com.  Is it being 
tracked anywhere other than email?


On 2/25/24 09:46, Thomas B. Clark wrote:
> This issue isn't limited to RAID5.  It's happening to me on a RAID1 md 
> as well. I use an ext4 filesystem over RAID1 for /guests.
>
>  I can add a couple of observations to what is already noted. The load 
> increases gradually and inconsistently, and sometimes it runs for 
> several hours after rebooting without any noticeable ill effects 
> before the load starts creeping up in the VMs, eventually bringing the 
> server to an unresponsive state. The longest I've seen it run is 12 
> hours. I haven't figured out whether there is some trigger or a 
> cumulative effect.
>
>
