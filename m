Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2921862
	for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724131893; cv=none; b=Rm0myI0LZKcnV8Kahako3vkIS+EEDSHDkTKsNoqP1x6bMlu5bs9ES4SBm2f070bGU2Evwlo4z+022iZQKPWtIanphWxyI6ZIPwde88hHQeAQCQd2b9g6qmueY1u56L7B0yApNklA4gdEl61EfVWhzDDMLljHhx+jlWeRiS6l2QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724131893; c=relaxed/simple;
	bh=lnn1cMwZ5xGuxZXmYgF8Mux94AyucGFh2qMYd0RHS4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBhvpJUg4Qbn/Zr1nOCxxS6TARwmlWnypXy/btqM6IuJp4phrLWuA7Cwn+j5MO04uYrxJWysn3GCHVG+HxKjQfP2/4MxrrAqDfefp3kYU4jC6kZLNYXzOOHo6k+NTSVtWengoPc7YoSHbtcP6kyEYt45Vj332UvYts+Elo4VgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af271.dynamic.kabel-deutschland.de [95.90.242.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5486861E5FE07;
	Tue, 20 Aug 2024 07:31:12 +0200 (CEST)
Message-ID: <17001e93-7baf-428b-b979-e6fb8330cb84@molgen.mpg.de>
Date: Tue, 20 Aug 2024 07:31:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Commit *pidfd: prevent creation of pidfds for kthreads* causes
 `Failed to remount '/' read-only: Device or resource busy`
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <3a1c9e27-6dcb-4eec-85cb-c03271c61a37@molgen.mpg.de>
 <b21aa149-fd70-4aa0-9b25-886c81ebfae2@leemhuis.info>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <b21aa149-fd70-4aa0-9b25-886c81ebfae2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Thorsten,


Am 20.08.24 um 07:03 schrieb Thorsten Leemhuis:
> On 19.08.24 23:02, Paul Menzel wrote:
>> #regzbot introduced: 3b5bbe798b24
>>
>> Commit 3b5bbe798b24 (pidfd: prevent creation of pidfds for kthreads)
>> causes a regression. On the Dell XPS 13 9360 with Debian sid/unstable
>> and *systemd* 256.5-1, systemd is not able to unmount the root partition
>> (LUKS encrypted) anymore.
> 
> Hi Paul! Thx for the report. FWIW, a revert to fix this is already
> queued as 780d60bac21ebe ("Revert "pidfd: prevent creation of pidfds for
> kthreads"") [next-20240820 (pending-fixes)] after Eric reported similar
> problems recently:
> 
> https://lore.kernel.org/all/20240819-staudamm-rederei-cb7092f54e76@brauner/

Thank you for digging this up. I thought I search for the commit hash in 
lore.kernel.org, but maybe I hit the wrong button *locate inbox*.

Anyway, reverting the patch on top of master also fixes the issue for 
me. Maybe Linus can take it directly, as more people are going to run 
into this.


Kind regards,

Paul
