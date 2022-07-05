Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F8F2F5A
	for <regressions@lists.linux.dev>; Tue,  5 Jul 2022 11:15:02 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o8gWC-00039a-3v; Tue, 05 Jul 2022 13:15:00 +0200
Message-ID: <206a15ec-4800-da1c-6c8f-eb7714e75fd4@leemhuis.info>
Date: Tue, 5 Jul 2022 13:14:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/3] x86: fix brk area initialization
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220623094608.7294-1-jgross@suse.com>
 <2592493b-4339-3e54-8acf-585dcf90be96@suse.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
In-Reply-To: <2592493b-4339-3e54-8acf-585dcf90be96@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1657019702;876e2281;
X-HE-SMSGID: 1o8gWC-00039a-3v



On 29.06.22 16:10, Juergen Gross wrote:
> On 23.06.22 11:46, Juergen Gross wrote:
>> The brk area needs to be zeroed initially, like the .bss section.
>> At the same time its memory should be covered by the ELF program
>> headers.
>>
>> Juergen Gross (3):
>>    x86/xen: use clear_bss() for Xen PV guests
>>    x86: fix setup of brk area
>>    x86: fix .brk attribute in linker script
>>
>>   arch/x86/include/asm/setup.h  |  3 +++
>>   arch/x86/kernel/head64.c      |  4 +++-
>>   arch/x86/kernel/vmlinux.lds.S |  2 +-
>>   arch/x86/xen/enlighten_pv.c   |  8 ++++++--
>>   arch/x86/xen/xen-head.S       | 10 +---------
>>   5 files changed, 14 insertions(+), 13 deletions(-)
>>
> 
> Could I please have some feedback? This series is fixing a major
> regression regarding running as Xen PV guest (depending on kernel
> configuration system will crash very early).
> 
> #regzbot ^introduced e32683c6f7d2

#regzbot fixed-by: 7e09ac27f43b382

