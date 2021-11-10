Received: from queue02b.mail.zen.net.uk (queue02b.mail.zen.net.uk [212.23.3.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004772
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 18:55:10 +0000 (UTC)
Received: from [212.23.1.5] (helo=smarthost01c.sbp.mail.zen.net.uk)
	by queue02b.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <lkml@badpenguin.co.uk>)
	id 1mkskW-0005y3-Lr
	for regressions@lists.linux.dev; Wed, 10 Nov 2021 18:55:08 +0000
Received: from [217.155.148.18] (helo=swift)
	by smarthost01c.sbp.mail.zen.net.uk with esmtp (Exim 4.90_1)
	(envelope-from <lkml@badpenguin.co.uk>)
	id 1mksiV-00083j-7p; Wed, 10 Nov 2021 18:53:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by swift (Postfix) with ESMTP id C3BA72C99FA;
	Wed, 10 Nov 2021 18:53:02 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at badpenguin.co.uk
Received: from swift ([127.0.0.1])
	by localhost (swift.badpenguin.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xj5NaD9G6LVK; Wed, 10 Nov 2021 18:53:00 +0000 (GMT)
Received: from [192.168.42.11] (katana [192.168.42.11])
	by swift (Postfix) with ESMTPS id 798E12C9951;
	Wed, 10 Nov 2021 18:53:00 +0000 (GMT)
Subject: Re: kernel 5.15.1: AMD RX 6700 XT - Fails to resume after screen
 blank
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <dbadfe41-24bf-5811-cf38-74973df45214@badpenguin.co.uk>
 <YYwDnbpES0rrnWBw@kroah.com>
From: Mark Boddington <lkml@badpenguin.co.uk>
Message-ID: <b42db67d-4c13-9623-7f17-5c04023e27ba@badpenguin.co.uk>
Date: Wed, 10 Nov 2021 18:53:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YYwDnbpES0rrnWBw@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-smarthost01c-IP: [217.155.148.18]
Feedback-ID: 217.155.148.18

Hi Greg,

I'll can try reverting that patch, and check.

This hardware has been stable with all kernels from around 5.11 up to 
and including 5.15.

Cheers,

Mark

On 10/11/2021 17:38, Greg KH wrote:
> On Wed, Nov 10, 2021 at 04:27:39PM +0000, Mark Boddington wrote:
>> Hi all,
>>
>> I run the mainline Linux kernel on Ubuntu 20.04, built from
>> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.15.1/
>>
>> There appears to be a regression in 5.15.1 which causes the GPU to fail to
>> resume after power saving.
>>
>> Could it be this change??:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c?h=v5.15.1&id=8af3a335b5531ca3df0920b1cca43e456cd110ad
> If you revert it, does it solve the problem for you?
>
> If not, what kernel version did work for you with this hardware?
>
> thanks,
>
> greg k-h
