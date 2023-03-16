Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74D36E
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 06:34:13 +0000 (UTC)
X-QQ-mid: bizesmtp73t1678948428tc83ll7o
Received: from [10.4.16.24] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Mar 2023 14:33:46 +0800 (CST)
X-QQ-SSF: 00400000002000I0Z000B00A0000000
X-QQ-FEAT: 3M0okmaRx3hcKxKpNBvZixBsS7cYrOvg3mMWMCpNPcLHGTCbBMetyQ5NkHikX
	Hzicsqh4CkLsk4mVq2WGOfyS3t2KuAiq1BiQGkVyUqo9eAHkNNMfCNJLCs+6kUlJh7h9HHC
	NzXKa7Uyz9gsiiacvlhhC5O84jQG/2XKblpAtdn/4QNd4tlATuRIGMkUHQfJjl8v8ySo4hi
	aG2tP7iEtSVtrWdhqAH7xjwVC8Qdgc2aXTDvnucl4VWrEX+jMnu20etB5whZzThLlZR9l4y
	E06t0FOHriFWALWiVcizaybcz6dAM82hChxUj/72OUhfEu4pyQXMEDxMsViGNGnS+g51+Gu
	3gYtdD9HNKTei0az0IpT0d232RxPdw5FeX7mOsBviD8fYV6PpA9uddmQvXlAmvazQ16zi81
	5ilmmBvl8gI0O6DUeBB5pw==
X-QQ-GoodBg: 2
Message-ID: <FB5EB3E66BC11752+d365c0b5-3ea6-c1d9-6e2d-9eaed541f6c1@uniontech.com>
Date: Thu, 16 Mar 2023 14:33:46 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [REGRESSION] External mic not working on Lenovo Ideapad U310,
 ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
To: Takashi Iwai <tiwai@suse.de>
Cc: Jetro Jormalainen <jje-lxkl@jetro.fi>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230308215009.4d3e58a6@mopti> <87o7ou9jfi.wl-tiwai@suse.de>
 <927A9CC7D19E5BD6+6758c124-1a86-a981-d3cf-fa0da9ab589e@uniontech.com>
 <87a60djl5y.wl-tiwai@suse.de>
From: tangmeng <tangmeng@uniontech.com>
In-Reply-To: <87a60djl5y.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr7



On 2023/3/16 13:54, Takashi Iwai wrote:
> Too bad.  So, if any, further fixes will be a guess work.
> Do you know the codec vendor ID at least?
> 
 From the information I saved as follows:

制造商:  Intel Corporation
型  号:  Intel 7 Series/C216 Chipset Family High Definition Audio Controller

And by my pci.ids comparison, the corresponding should be 8086:1e20

> At the next time you submit such a change, please keep the
> alsa-info.sh output for a future reference.
> 
Yes, I will save relevant information in the future.

Thanks,
   Meng
