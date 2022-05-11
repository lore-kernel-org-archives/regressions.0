Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E3728F3
	for <regressions@lists.linux.dev>; Wed, 11 May 2022 12:13:38 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nolDd-0007Gi-LU; Wed, 11 May 2022 14:13:29 +0200
Message-ID: <04c2cb21-a377-d996-8297-16cd7c744063@leemhuis.info>
Date: Wed, 11 May 2022 14:13:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0%
 regression #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220420013526.GB14333@xsang-OptiPlex-9020>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220420013526.GB14333@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652271218;9c3811d6;
X-HE-SMSGID: 1nolDd-0007Gi-LU

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 20.04.22 03:35, kernel test robot wrote:
> 
> (please be noted we reported
> "[mm/page_alloc]  39907a939a:  netperf.Throughput_Mbps -18.1% regression"
> on
> https://lore.kernel.org/all/20220228155733.GF1643@xsang-OptiPlex-9020/
> while the commit is on branch.
> now we still observe similar regression when it's on mainline, and we also
> observe a 13.2% improvement on another netperf subtest.
> so report again for information)
> 
> Greeting,
> 
> FYI, we noticed a -18.0% regression of netperf.Throughput_Mbps due to commit:
> 
> 
> commit: f26b3fa046116a7dedcaafe30083402113941451 ("mm/page_alloc: limit number of high-order pages on PCP during bulk free")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> in testcase: netperf
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz with 128G memory
> with following parameters:
> 
> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 1
> 	cluster: cs-localhost
> 	test: UDP_STREAM
> 	cpufreq_governor: performance
> 	ucode: 0xd000331
> 
> test-description: Netperf is a benchmark that can be use to measure various aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
> [...]

This regression is discussed quite a bit currently, so let's better add
it to the tracking:

#regzbot ^introduced 39907a939a
#regzbot title mm: [mm/page_alloc]  f26b3fa046:  netperf.Throughput_Mbps
-18.0% regression
#regzbot ignore-activity

Ciao, Thorsten
