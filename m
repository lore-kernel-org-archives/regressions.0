Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87DEECE
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="H3z8GcPd"
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 01B3B301BEA
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 16:11:12 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 78D5C9C0061;
	Mon, 13 Nov 2023 16:11:01 +0000 (UTC)
Received: from [192.168.1.115] (unknown [98.97.112.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 4A04013C2B0;
	Mon, 13 Nov 2023 08:10:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 4A04013C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1699891858;
	bh=C7CapxtBMMZZdzsCXVqlwHkDLQnyVPV1jyGOMx+Q46Y=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=H3z8GcPdWIVHyGUfnp50D7zIQoJbL1tKvU0vfGHdJnpX5Ygk4IwIOOFaBQurgxRYi
	 MPw+Y3bsiiHI+WEkuvUr9GWyf+mqWLea+oOE/VaepkQ4jwvGyCzhMDtfGQb2Om8jmL
	 RtY+HYT6kCLTS1VhyXElDola79NFdAW+LmkpyqwU=
Subject: Re: [PATCH v4] wifi: iwlwifi: fix system commands group ordering
To: Emmanuel Grumbach <egrumbach@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 pagadala.yesu.anjaneyulu@intel.com,
 Linux Regressions <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 =?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>,
 Damian Tometzki <damian@riscv-rocks.de>
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
 <20231112143620.36619-1-emmanuel.grumbach@intel.com>
 <875y26ajks.fsf@kernel.org>
 <CAHk-=wgyG-8ehCc4C4V-b-8rBtfyd9ApDeQSx-5BKRaHywhVpw@mail.gmail.com>
 <CANUX_P0kDV6PC5=+oxgnVetMR+kERqCMsVju22mBqcW5bED8sA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <b2008f61-dd71-6a17-bea9-89ba51904a72@candelatech.com>
Date: Mon, 13 Nov 2023 08:10:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CANUX_P0kDV6PC5=+oxgnVetMR+kERqCMsVju22mBqcW5bED8sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
X-MDID: 1699891863-BrwEj1L2TOuR
X-MDID-O:
 us5;at1;1699891863;BrwEj1L2TOuR;<greearb@candelatech.com>;3dd19b123b29985d5fd746a2b0eecbd6

On 11/12/23 11:53 AM, Emmanuel Grumbach wrote:
> On Sun, Nov 12, 2023 at 9:39 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Sun, 12 Nov 2023 at 10:54, Kalle Valo <kvalo@kernel.org> wrote:
>>>
>>> Linus, I suspect it will take a while before we make a new wireless pull
>>> request (there's currently just one commit in the wireless tree). So if
>>> you want to take this directly to your tree please go ahead, otherwise
>>> you get it via the normal route in a week or two. Just let us know what
>>> you prefer.
>>>
>>> Acked-by: Kalle Valo <kvalo@kernel.org>
>>
>> Ok, I just tested it in my private tree, and it fixes the WARN_ON() as
>> expected, so I'll apply it for real.
> 
> Good to know - thanks.
> 
>>
>> However, now that I don't have that big warning in there, I do note
>> another iwlwifi issue that is new to this meger window:
>>
>>    debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
>>    iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:wlo2
>>    debugfs: Directory 'iwlmvm' with parent 'netdev:wlo2' already present!
>>    iwlwifi 0000:45:00.0: Failed to create debugfs directory under netdev:wlo2
>>
>> and looking at my system logs, this is new.
>>
>> It looks like it is probably due to
>>
>>    c36235acb34f ("wifi: iwlwifi: mvm: rework debugfs handling")
>>    e9dd25550770 ("wifi: iwlwifi: mvm: add a per-link debugfs")
>>
>> but that's just from looking at the patches (ie no bisection or any
>> real effort).
> 
> Don't bother, we'll take a look.
> 
>>
>> This is after the system has come up, so I assume it's when
>> networkmanager or whatever actually is setting that wireless thing up.
> 
> Most likely the network-manager brings the device up several times or something
> like that, but let's not blame them before we check what happens internally.

The debugfs warnings are seen all of my systems, no network manager for me, but
I am bringing stations up and down a lot.

Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com
