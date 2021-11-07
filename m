Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8758468
	for <regressions@lists.linux.dev>; Sun,  7 Nov 2021 17:35:39 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mjm4v-0000Ye-SV; Sun, 07 Nov 2021 18:35:37 +0100
Message-ID: <10ac1fd8-e20b-dd2b-5b69-73af1eb4556d@leemhuis.info>
Date: Sun, 7 Nov 2021 18:35:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: DEAD callback error for CPU, WARNING: CPU: 3 PID: 1134 at
 kernel/cpu.c:1163 _cpu_down+0x20a/0x3a0
Content-Language: en-US
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <f6a0f4be-ad53-489c-0036-09dead99f368@gmail.com>
 <ea5fe78c-9a36-726f-afe2-1bdc25c5eba7@leemhuis.info>
In-Reply-To: <ea5fe78c-9a36-726f-afe2-1bdc25c5eba7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1636306539;ae583497;
X-HE-SMSGID: 1mjm4v-0000Ye-SV



On 07.11.21 18:29, Thorsten Leemhuis wrote:
> On 07.11.21 12:59, Colin King (gmail) wrote:
>> On a SMP system in a VM, a deadlock callback error can be reproduced
>> with 5.15, tested from head at commit
>> d4439a1189f93d0ac1eaf0197db8e6b3e197d5c7
>>
>> Didn't see this issue on 5.13
>> […]
>> See bug report https://bugzilla.kernel.org/show_bug.cgi?id=214955
> 
> #regzbot introduced v5.13..
> #regzbot link https://bugzilla.kernel.org/show_bug.cgi?id=214955
> Bugzilla Ticket
> #regzbot activity-ignore

#regzbot invalid: user error aka PEBKAC :-/
