Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E9468C
	for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 04:07:46 +0000 (UTC)
Received: from [192.168.0.185] (ip5f5ae840.dynamic.kabel-deutschland.de [95.90.232.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7D40861E5FE01;
	Thu, 13 Jul 2023 06:00:09 +0200 (CEST)
Message-ID: <552a361b-d699-5d96-543a-e3aa09e6c05c@molgen.mpg.de>
Date: Thu, 13 Jul 2023 06:00:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: bluetooth broken in Intel Macbook 2014
Content-Language: en-US
To: John Holland <johnbholland@icloud.com>,
 =?UTF-8?Q?Tomasz_Mo=c5=84?= <tomasz.mon@nordicsemi.no>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
References: <370f0784-05c2-a36d-bfe8-f5159aeb8729@icloud.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <370f0784-05c2-a36d-bfe8-f5159aeb8729@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Fix email address, Cc: +regressions@lists.linux.dev, regzbot commands]

#regzbot ^introduced: c13380a55522bf14e54779a142487c224509db95
#regzot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=217651

Am 13.07.23 um 01:08 schrieb John Holland:
> Hello,
> 
> I've had my first attempt at kernel development in trying to fix a 
> problem with newer kernels and the bluetooth in my Macbook Pro (2014 
> vintage). I did the bisecting and found that the commit below seems to 
> be the culprit.
> 
> 
> commit c13380a55522bf14e54779a142487c224509db95
> Author: Tomasz Moń <tomasz.mon@nordicsemi.no>
> Date:   Tue Feb 7 12:57:41 2023 +0100
> 
>     Bluetooth: btusb: Do not require hardcoded interface numbers
> ......
> 
> Reverting this change in both 6.3 and 6.5 restores my ability to use the 
> Bluetooth in this Mac. I created a bug in bugzilla for it.
> 
> 
> This is new to me, I'm a retired application developer. I hope this is 
> close enough to the correct process. Thanks,
> 
> John Holland
> 
> 
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=217651
