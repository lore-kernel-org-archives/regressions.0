Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E668154B7
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 07:57:37 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pvvkN-0007zm-8s; Mon, 08 May 2023 09:57:27 +0200
Message-ID: <f8852e43-fcc2-7f5f-d1cd-4d99ebc37372@leemhuis.info>
Date: Mon, 8 May 2023 09:57:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Regression Issue
Content-Language: en-US, de-DE
To: "Rai, Anjali" <anjali.rai@intel.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Gandhi, Jinen" <jinen.gandhi@intel.com>, "Qin, Kailun"
 <kailun.qin@intel.com>, Greg KH <gregkh@linuxfoundation.org>
References: <DM4PR11MB55183E4B87078E0F496386029A719@DM4PR11MB5518.namprd11.prod.outlook.com>
 <2023050851-trapper-preshow-2e4c@gregkh>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <2023050851-trapper-preshow-2e4c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683532657;47e37a7d;
X-HE-SMSGID: 1pvvkN-0007zm-8s

On 08.05.23 09:40, Greg KH wrote:
> On Mon, May 08, 2023 at 07:33:58AM +0000, Rai, Anjali wrote:
>>
>> We have one test which test the functionality of "using the same loopback address and port for both IPV6 and IPV4", The test should result in EADDRINUSE for binding IPv4 to same port, but it was successful
>>
>> Test Description:
>> The test creates sockets for both IPv4 and IPv6, and forces IPV6 to listen for both IPV4 and IPV6 connections; this in turn makes binding another (IPV4) socket on the same port meaningless and results in -EADDRINUSE
>>
>> Our systems had Kernel v6.0.9 and the test was successfully executing, we recently upgraded our systems to v6.2, and we saw this as a failure. The systems which are not upgraded, there it is still passing.
>>
>> We don't exactly at which point this test broke, but our assumption is https://github.com/torvalds/linux/commit/28044fc1d4953b07acec0da4d2fc4784c57ea6fb
> 
> Is there a specific reason you did not add cc: for the authors of that
> commit?
> 
>> Can you please check on your end whether this is an actual regression of a feature request.
> 
> If you revert that commit, does it resolve the issue?  Have you worked
> with the Intel networking developers to help debug this further?

FWIW: that commit you mentioned above indeed caused a regression in a
test, but the issue was fixed before 6.2 was released -- or at least it
is supposed to. For details see:

https://lore.kernel.org/all/6b971a4e-c7d8-411e-1f92-fda29b5b2fb9@kernel.org/


Ciao, Thorsten
