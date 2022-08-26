Received: from yamato.tf-network.de (yamato.tf-network.de [93.186.202.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B054C74
	for <regressions@lists.linux.dev>; Fri, 26 Aug 2022 20:10:52 +0000 (UTC)
Received: from amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221])
	by yamato.tf-network.de (Postfix) with ESMTP id 4MDrYc00h8z4CQr;
	Fri, 26 Aug 2022 22:10:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis3.tf-network.de
Received: from smtp.tf-network.de ([93.186.202.221])
	by amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221]) (amavisd-new, port 10024)
	with LMTP id D7qHuZ_408aE; Fri, 26 Aug 2022 22:10:43 +0200 (CEST)
Received: from [10.1.0.10] (xdsl-89-1-54-21.nc.de [89.1.54.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.tf-network.de (Postfix) with ESMTPSA id 4MDrYb3fNXz41sy;
	Fri, 26 Aug 2022 22:10:43 +0200 (CEST)
Message-ID: <07ef216b-367a-2133-3707-3580d58fae31@whissi.de>
Date: Fri, 26 Aug 2022 22:10:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
From: Thomas Deutschmann <whissi@whissi.de>
Subject: Re: [REGRESSION] v5.17-rc1+: FIFREEZE ioctl system call hangs
To: Song Liu <song@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Vishal Verma <vverma@digitalocean.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <000401d8a746$3eaca200$bc05e600$@whissi.de>
 <43e678ca-3fc3-6c08-f035-2c31a34dd889@whissi.de>
 <701f3fc0-2f0c-a32c-0d41-b489a9a59b99@whissi.de>
 <0192a465-d75d-c09a-732a-eb2215bf3479@whissi.de>
 <CAPhsuW6yLLcj3GtA+4mUFooQmfGo3cVTYn-xBEY2KuP1wwmQNA@mail.gmail.com>
 <b903abd4-d101-e6a5-06a0-667853286308@whissi.de>
 <4f69659f-7160-7854-0ed5-6867e3eb2edb@whissi.de>
 <CAPhsuW6Bq8rkiCzsWW7bkrCbYYEwFWtKaswOZcXsyk8tu3C5Dg@mail.gmail.com>
 <be8542cf-9b58-8861-11b5-8eeaa08f1421@whissi.de>
 <CAPhsuW45eYTjmA4C_wc_Z=ELbw9NStGpX6Mkf=tn1AEBknDg4Q@mail.gmail.com>
 <CAPhsuW7zdynykfXnz8X4CDEusHSHm9Vr01yiQSpEvizGwBUDkQ@mail.gmail.com>
 <172d7663-ce22-f87a-6aa0-0b6145115711@whissi.de>
 <CAPhsuW4ZeQXL2KsLD_xxUy2dz-aoe+1fZj_+tMEeaLwXJywf=g@mail.gmail.com>
 <CAPhsuW6OcFeyVO-=12opRDijXHpQh1drQZZ6nLAq9P5TzvpnMA@mail.gmail.com>
 <3114ed77-3802-8ca4-52e4-0e4b917d88b2@kernel.dk>
 <CAPhsuW7AYMXrW4DNRTnGEvySSLHVz_8n0vJDHzZh90o5NR_5_Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPhsuW7AYMXrW4DNRTnGEvySSLHVz_8n0vJDHzZh90o5NR_5_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

patch looks good to me -- cannot reproduce the problem anymore:

I tested 10 hours against single NVME drive and 10 hours against mdraid 
array so the patch addresses both problems.

Thank you very much!


-- 
Regards,
Thomas

