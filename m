Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B62F33
	for <regressions@lists.linux.dev>; Wed, 26 Apr 2023 14:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001C7C433D2;
	Wed, 26 Apr 2023 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1682517670;
	bh=gYUt9qtbJF9vSk4ZmRnp3b+Bi4fD/rx0/xrXT1dyo4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuZn/zCzwNY7KJZNpAElilLJyrEvuC9CeeePgKu67s1cR3Q+4eQ7IPQHSJ0qieDL5
	 wMm9MzTFuy7J2F/fX3Q6jBCPDCxt6DXJb9wtJRezxibeu/oHPKgZC3/g+li20lAOON
	 GQgQj87u9bu8661NJDTQ+4JFQJyQ+xEqPOV12R8I=
Date: Wed, 26 Apr 2023 16:01:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Akira Shimahara <akira215corp@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Stefan Wahren <stefan.wahren@chargebyte.com>,
	regressions@lists.linux.dev
Subject: Re: Regression: w1_therm: sysfs w1_slave sometimes report 85 degrees
 Celsius
Message-ID: <2023042645-attentive-amends-7b0b@gregkh>
References: <b1093de5-9f62-6714-0063-7c719dc4f6ca@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1093de5-9f62-6714-0063-7c719dc4f6ca@i2se.com>

On Wed, Apr 26, 2023 at 03:39:15PM +0200, Stefan Wahren wrote:
> Hi,
> 
> recently we switch on our Tarragon board (i.MX6ULL) to Linux 6.1 and noticed
> that the connected 1-wire temperature sensors (w1_therm.w1_strong_pull=0)
> sometimes (~ 1 of 20 times) report 85 degrees Celsius, which is AFAIK the
> only way to report errors to the 1-wire master:
> 
> sys/bus/w1/devices/28-04168158faff# cat w1_slave
> 50 05 4b 46 7f ff 0c 10 1c : crc=1c YES
> 50 05 4b 46 7f ff 0c 10 1c t=85000
> 
> I wasn't able to reproduce this issue with the old kernel 4.9.
> 
> After that i successfully bisected the issue to this commit:
> 67b392f7b8ed ("w1_therm: optimizing temperature read timings")
> 
> Unfortunately this commit contains a lot of independent changes, which makes
> it hard to figured out the cause of this issue. So i tried to split this
> patch in seven independent changes [1]. Now i was able to bisect the cause
> further to this change [2] which seems to rework the pullup handling within
> read_therm().
> 
> Looking closer at the code change and verify it some debug messages, the
> change inverted the locking behavior (before: no pullup -> keep lock, after:
> no pullup -> release lock during sleep).
> 
> Before:
> 	if (external_power) {
> 		mutex_unlock(&dev_master->bus_mutex);
> 
> 		sleep_rem = msleep_interruptible(tm);
> 		if (sleep_rem != 0) {
> 			ret = -EINTR;
> 			goto dec_refcnt;
> 		}
> 
> 		ret = mutex_lock_interruptible(&dev_master->bus_mutex);
> 		if (ret != 0)
> 			goto dec_refcnt;
> 	} else if (!w1_strong_pullup) {
> 		sleep_rem = msleep_interruptible(tm);
> 		if (sleep_rem != 0) {
> 			ret = -EINTR;
> 			goto mt_unlock;
> 		}
> 	}
> 
> After:
> 	if (strong_pullup) { /*some device need pullup */
> 		sleep_rem = msleep_interruptible(tm);
> 		if (sleep_rem != 0) {
> 			ret = -EINTR;
> 			goto mt_unlock;
> 		}
> 	} else { /*no device need pullup */
> 		mutex_unlock(&dev_master->bus_mutex);
> 
> 		sleep_rem = msleep_interruptible(tm);
> 		if (sleep_rem != 0) {
> 			ret = -EINTR;
> 			goto dec_refcnt;
> 		}
> 
> 		ret = mutex_lock_interruptible(&dev_master->bus_mutex);
> 		if (ret != 0)
> 			goto dec_refcnt;
> 	}
> 
> I don't believe this is intended. After inverting the strong_pullup check,
> the issue wasn't reproducible on our platform anymore. But i'm not sure this
> is clean.
> 
> Best regards
> 
> #regzbot introduced: 67b392f7b8ed
> 
> [1] - https://github.com/chargebyte/linux/commits/v6.1-tarragon_w1
> [2] - https://github.com/chargebyte/linux/commit/17ca863a32a6a1bdd376959f05c954bef12fc1b5

Can you send a patch that shows the change you wish to have made here so
that you can get credit for fixing the issue?

thanks,

greg k-h
