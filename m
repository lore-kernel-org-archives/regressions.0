Received: from yamato.tf-network.de (yamato.tf-network.de [93.186.202.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22589256C
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 15:29:16 +0000 (UTC)
Received: from amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221])
	by yamato.tf-network.de (Postfix) with ESMTP id 4MBGVX61cHz4Rg6;
	Mon, 22 Aug 2022 17:29:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis3.tf-network.de
Received: from smtp.tf-network.de ([93.186.202.221])
	by amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221]) (amavisd-new, port 10024)
	with LMTP id yk5cmo2fy9hF; Mon, 22 Aug 2022 17:29:08 +0200 (CEST)
Received: from [10.1.0.10] (xdsl-213-196-226-148.nc.de [213.196.226.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.tf-network.de (Postfix) with ESMTPSA id 4MBGVX2YZ5z442N;
	Mon, 22 Aug 2022 17:29:08 +0200 (CEST)
Message-ID: <b903abd4-d101-e6a5-06a0-667853286308@whissi.de>
Date: Mon, 22 Aug 2022 17:29:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [REGRESSION] v5.17-rc1+: FIFREEZE ioctl system call hangs
To: Song Liu <song@kernel.org>
Cc: Vishal Verma <vverma@digitalocean.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Jens Axboe <axboe@kernel.dk>
References: <000401d8a746$3eaca200$bc05e600$@whissi.de>
 <000001d8ad7e$c340ad70$49c20850$@whissi.de>
 <2a2d1075-aa22-8c4d-ca21-274200dce2fc@leemhuis.info>
 <0FBCAB10-545E-45E2-A0C8-D7620817651D@digitalocean.com>
 <CAPhsuW5f9QD+gzJ9eBhn5irsHvrsvkWjSnA4MPaHsQjjLMypXg@mail.gmail.com>
 <43e678ca-3fc3-6c08-f035-2c31a34dd889@whissi.de>
 <701f3fc0-2f0c-a32c-0d41-b489a9a59b99@whissi.de>
 <0192a465-d75d-c09a-732a-eb2215bf3479@whissi.de>
 <CAPhsuW6yLLcj3GtA+4mUFooQmfGo3cVTYn-xBEY2KuP1wwmQNA@mail.gmail.com>
Content-Language: en-US
From: Thomas Deutschmann <whissi@whissi.de>
In-Reply-To: <CAPhsuW6yLLcj3GtA+4mUFooQmfGo3cVTYn-xBEY2KuP1wwmQNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-08-20 03:04, Song Liu wrote:
> Hmm.. does the user space use different logic based on the kernel version?
> 
> I still cannot reproduce the issue. Have you tried to reproduce the
> issue without mysqld? Something with fio will be great.

No, I spent last day trying various fio options but I was unable to 
reproduce the problem yet.

I managed to reduce the required mysql I/O -- I can now reproduce after 
importing ~150MB SQL dump instead of 20GB.

It's also interesting: Just hard killing mysqld which will cause 
recovery on next start is already enough to trigger the problem.

I filed ticket with MariaDB to get some input from them, maybe they have 
an idea for another reproducer: https://jira.mariadb.org/browse/MDEV-29349


-- 
Regards,
Thomas

