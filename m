Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8C624
	for <regressions@lists.linux.dev>; Sat, 14 May 2022 11:57:25 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1npqOb-0002iX-SH; Sat, 14 May 2022 13:57:18 +0200
Message-ID: <82f5a064-85f3-8329-81ab-8ce0570ccaff@leemhuis.info>
Date: Sat, 14 May 2022 13:57:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Bug 215679 - NVMe/writeback wb_workfn/blocked for more than 30
 seconds #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0a0b0127-8e5d-d6ca-52db-bf9937d6d887@leemhuis.info>
In-Reply-To: <0a0b0127-8e5d-d6ca-52db-bf9937d6d887@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652529446;c0a27d9a;
X-HE-SMSGID: 1npqOb-0002iX-SH

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 18.03.22 15:49, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> About a week ago a regression was reported to bugzilla.kernel.org that
> seems to be handled there already, nevertheless I'd like to add to the
> tracking to ensure it's not forgotten.
> 
> #regzbot introduced: 4f5022453acd0f7b28012
> #regzbot from: Imre Deak <imre.deak@intel.com>
> #regzbot title: nvme: NVMe/writeback wb_workfn/blocked for more than 30
> seconds
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215679

#regzbot invalid: turns out hardware was faulty
